// The render mode of the frame
display = 0; // [0: for printing, 1: sample, 2: cross section, 3: flat, 4: exploded, 5: upside down sample]

// Unit type of the art size
art_unit = 0; // [0: mm, 1: inch]

// The width of your artwork
art_width = 171;

// The height of your artwork
art_height = 246;

// Number of hanging holes
screw_hole = 4; // [0: no screwhole, 1: 1 screwhole, 2: 2 screwholes, 3: 3 screwholes, 4: 4 screwholes]

// Enable or disable the outer lip
lip = true;

// Enable or disable the artwork gutter
art_gutter = true;

// Enable or disable the glass gutter
glass_gutter = false;

// Enable or disable the faux wood texture
texture_enabled = true;

/* [Frame Dimensions] */
// Total width of the frame profile (mm)
frame_w = 22; // [5:0.5:100]

// Base height of the frame (mm)
frame_h = 6.5; // [1:0.5:50]

// Width of the retaining lip (mm)
lip_w = 9; // [1:0.5:50]

// Height of the retaining lip (mm)
lip_h = 2.4; // [0:0.4:10]

/* [Woodgrain Texture Settings] */
// Likelyhood of Woodgrain (0.0 to 1.0)
tex_threshold = 0.70;
// Base Woodgrain width (mm)
tex_diameter = 40;
// Woodgrain vertical step size (mm)
tex_size = 0.75; // [0.25:0.05:1.5]
// Maximum Woodgrain depth (mm)
tex_depth = 0.8;

/* [Gutter Settings] */
// Depth of the artwork gutter (mm)
art_gutter_d = 3; // [0:0.1:20]

// Height of the artwork gutter (mm)
art_gutter_h = 2.4; // [0:0.1:20]

// Distance between art and glass (mm)
glass_offset = 2; // [0:0.1:20]

// Depth of the glass gutter (mm)
glass_gutter_d = 3; // [0:0.1:20]

// Height of the glass gutter (mm)
glass_gutter_h = 3; // [0:0.1:20]

/* [Screwhole Settings] */
// Diameter of screw head (mm)
screw_head_d = 10; // [0:0.1:20]
// height of screw head (mm)
screw_head_h = 4; // [0:0.1:20]
// Diameter of screw shaft (mm)
screw_shaft_d = 4.5; // [0:0.1:10]

// Margin between the wall and the screwhole (mm)
screw_hole_margin = 3; // [0:0.1:10]
// Margin around the screw (mm)
screw_margin = .5; // [0:0.1:2]
// Distance from outer face to screw hole cutout (mm)
screw_hole_edge_offset = 16; // [1:0.5:50]
// How many positions on the screwhole
num_screw_positions = 7; // [3:4:23]

/* [Dovetail Connectors] */
// Margin between the edges of the frame and the dovetail (mm)
dovetail_margin = 1.2; // [0:0.01:5]

// Smoothness of the dovetail corners (mm)
dovetail_corner_radius = 0.6; // [0:0.1:5]

/* [Printing & Assembly] */
// Tolerance between male and female dovetail corner connectors (mm)
margin_between_corner_connectors = 0.05; // [0:0.005:0.2]

// Tolerance between male and female dovetail straight connectors (mm)
margin_between_straight_connectors = 0.02; // [0:0.005:0.2]

// How much to take from the bottom of the straight dovetail connectors (0.0 to 1.0)
straight_connector_sink_percentage = 0.2; // [0:0.05:1]

// Maximum length of a single frame segment (mm)
max_size = 320; // [20:1:1000]

// Visual gap between pieces in Print Mode (mm)
gap = 3 + 4; // [0:1:50]

// Distance for Exploded View (mm)
em = 30; // [0:1:200]

// Resolution of circular features
$fn = 32; // [16, 32, 64, 128]

// --- Computed Values ---
art_w_mm = art_width * (art_unit == 0 ? 1 : 25.4);
art_h_mm = art_height * (art_unit == 0 ? 1 : 25.4);
art_gutter_h_val = !art_gutter ? 0 : art_gutter_h;
glass_gutter_h_val = !glass_gutter ? 0 : glass_gutter_h;
glass_offset_val = !glass_gutter ? 0 : glass_offset;
lip_h_val = lip_h;
total_h = frame_h + art_gutter_h_val + glass_gutter_h_val + glass_offset_val + lip_h_val;
lip_z = -total_h + lip_h;
art_gutter_z = lip_z + art_gutter_h_val;
glass_offset_z = art_gutter_z + glass_offset_val;
glass_gutter_z = glass_offset_z + glass_gutter_h_val;
inner_w = art_w_mm - (!art_gutter ? 0 : art_gutter_d * 2);
inner_h = art_h_mm - (!art_gutter ? 0 : art_gutter_d * 2);
outer_w = inner_w + frame_w * 2;
outer_h = inner_h + frame_w * 2;
total_lip_w = frame_w + lip_w;
has_gutters = art_gutter || glass_gutter;
gutter_depth = (!art_gutter ? 0 : art_gutter_d) + (!glass_gutter ? 0 : glass_gutter_d);
eps = 0.01;
eps2 = 0.02;
sink_depth = frame_w * straight_connector_sink_percentage;

// --- Frame Side Piece ---
module frame_side(length, side_index = 0, miter = true) {
  segments_raw = ceil(length / max_size);
  even_adj = segments_raw % 2 == 1 ? 0 : 1;
  num_segments = segments_raw + even_adj;
  segment_length = length / num_segments;
  inner_count = num_segments - 2;
  print_gap = display == 0 ? eps : display == 4 || display == 1 ? 5 : 0;
  adjusted_length = num_segments == 1 ? length : length + (eps * (num_segments - 1));
  difference() {
    if (num_segments == 1) {
      translate([adjusted_length / 2, frame_w, 0])
        union() {
          apply_dovetail(side_index, adjusted_length / 2, miter)
            frame_profile(adjusted_length / 2, miter);
          mirror([1, 0, 0])
            apply_dovetail(side_index, adjusted_length / 2, miter)
              frame_profile(adjusted_length / 2, miter);
        }
    } else {
      translate([segment_length, frame_w, 0])
        apply_dovetail(side_index, segment_length, false, true, true)
          apply_dovetail(side_index, segment_length, miter)
            frame_profile(segment_length, miter);
      for (i = [1:inner_count]) {
        translate([segment_length + (segment_length + print_gap) * i, frame_w, 0])
          apply_dovetail(-1, segment_length, false, true, true)
            apply_dovetail(-1, segment_length, false, false, true)
              frame_profile(segment_length, false);
      }
      translate([(adjusted_length + (print_gap * (num_segments - 1))) - segment_length, frame_w, 0])
        mirror([1, 0, 0])
          apply_dovetail(side_index, segment_length, false, true, true)
            apply_dovetail(side_index, segment_length, miter)
              frame_profile(segment_length, miter);
    }
    apply_texture(frame_w, adjusted_length);
    screw_cutout(side_index, adjusted_length);
  }
}

// --- Dovetail Connector (add/subtract) ---
module apply_dovetail(side_index = 0, seg_length, miter = true, other_side = false, pin = false) {
  if (miter) {
    if (side_index % 2 == 0) {
      union() {
        translate([-seg_length, -frame_w, 0])
          dovetail_shape(frame_w + eps, margin_between_corner_connectors, pin=pin);
        children();
      }
    } else {
      difference() {
        children();
        translate([-seg_length, dovetail_margin * 2, 0])
          rotate([0, 0, -90])
            dovetail_shape(frame_w + eps + margin_between_corner_connectors, pin=pin);
      }
    }
  } else {
    if (!other_side) {
      difference() {
        children();
        translate([-seg_length - dovetail_margin - eps, -frame_w, 0])
          dovetail_shape(frame_w + eps2 + margin_between_corner_connectors, pin=pin);
      }
    } else {
      difference() {
        children();
        translate([-dovetail_margin - (frame_w - eps + margin_between_corner_connectors), -frame_w, 0])
          dovetail_shape(frame_w + eps2 + margin_between_corner_connectors, pin=pin);
      }
    }
  }
}

// --- Frame Profile (cross-section extruded along length) ---
module frame_profile(length, miter = true) {
  module profile_shape() {
    difference() {
      union() {
        translate([-frame_w, -total_h])
          square([frame_w, total_h]);
        top_bevel(frame_w);
        if (lip) {
          translate([0, lip_z - lip_h])
            square([lip_w, lip_h]);
        }
      }
      inner_profile(frame_w);
      if (art_gutter) {
        translate([-art_gutter_d, art_gutter_z - art_gutter_h])
          square([art_gutter_d * 2, art_gutter_h]);
      }
      if (glass_gutter) {
        translate([-glass_gutter_d, glass_gutter_z - glass_gutter_h])
          square([glass_gutter_d * 2, glass_gutter_h]);
      }
    }
  }
  difference() {
    rotate([90, 0, 90])
      translate([0, 0, -length])
        linear_extrude(length, convexity=10)
          profile_shape();
    if (miter) {
      translate([-length + frame_w, 0, -total_h - eps])
        linear_extrude(total_h + 20, convexity=10)
          polygon(
            points=[
              [-frame_w - eps, -frame_w - eps],
              [lip_w + eps, lip_w + eps],
              [-frame_w - eps, lip_w + eps],
            ]
          );
    }
  }
}

// --- Dovetail Shape (rounded trapezoid) ---
module dovetail_shape(length, extra_margin = 0, pin = false) {
  fillet_r = dovetail_corner_radius - extra_margin / 2;
  margin_offset = dovetail_margin + extra_margin;
  offset_r = margin_offset + fillet_r;
  usable_depth = frame_w - gutter_depth;
  pos_top = [total_h / 2, offset_r];
  pos_right = [total_h - offset_r, usable_depth * .66];
  pos_bottom = [total_h / 2, frame_w - gutter_depth - offset_r];
  pos_left = [offset_r, usable_depth * .66];
  translate([margin_offset, 0, 0])
    rotate([0, 90, 00])
      linear_extrude(length, convexity=10)
        difference() {
          hull() {
            translate(pos_top)
              circle(r=fillet_r);
            translate(pos_right)
              circle(r=fillet_r);
            translate(pos_bottom)
              circle(r=fillet_r);
            translate(pos_left)
              circle(r=fillet_r);
          }
          if (pin) {
            polygon(
              points=[
                [0, 0],
                [0, sink_depth + margin_offset],
                [total_h, sink_depth + margin_offset],
                [total_h, 0],
              ]
            );
          }
        }
}

// --- Screw Hole Cutout ---
module screw_cutout(side_index, length) {
  half_length = length / 2;
  head_slot_w = screw_head_d + (screw_margin * 2);
  shaft_slot_w = screw_shaft_d + (screw_margin * 2);
  slot_depth = screw_hole_margin + screw_head_h + (screw_margin * 2);
  tiny_eps = head_slot_w * .001;
  edge_offset = screw_hole_edge_offset;
  shaft_center = edge_offset + (head_slot_w / 2) + screw_margin;
  head_end = frame_w - gutter_depth + edge_offset - screw_hole_margin * 1.5;
  position_spacing = 0.6;
  total_slot_length = (head_slot_w - shaft_slot_w) + (shaft_slot_w * (num_screw_positions - 1) * position_spacing + shaft_slot_w);
  has_hole = (screw_hole >= 1 && side_index == 0) || (screw_hole >= 2 && side_index == 2) || (screw_hole >= 3 && side_index == 1) || (screw_hole >= 4 && side_index == 3);
  if (has_hole)
    translate([-total_slot_length / 2 + half_length, 0])
      union() {
        translate([0, 0, -total_h])
          rotate([90, 0, 90])
            linear_extrude(total_slot_length, convexity=10)
              polygon(
                points=[
                  [head_end, 0],
                  [head_end - slot_depth * .66, slot_depth],
                  [edge_offset, slot_depth],
                  [edge_offset, screw_hole_margin],
                  [shaft_center - tiny_eps, screw_hole_margin],
                  [shaft_center - tiny_eps, 0],
                ]
              );
        for (i = [0:num_screw_positions - 1])
          translate([(head_slot_w / 2) + (i * (shaft_slot_w * position_spacing)), shaft_center, -total_h])
            linear_extrude(screw_hole_margin, convexity=10)
              circle(r=shaft_slot_w / 2, $fn=4);
      }
}

// --- Straight Dovetail Connectors ---
module straight_connectors() {
  w_segments_raw = ceil(outer_w / max_size);
  w_even_adj = w_segments_raw % 2 == 1 ? 0 : 1;
  w_segments = w_segments_raw + w_even_adj;
  w_connector_count = w_segments - 1;
  h_segments_raw = ceil(outer_h / max_size);
  h_even_adj = h_segments_raw % 2 == 1 ? 0 : 1;
  h_segments = h_segments_raw + h_even_adj;
  h_connector_count = h_segments - 1;
  total_connectors = w_connector_count + h_connector_count;
  if (total_connectors > 0 && (display == 0 || display == 4)) {
    union()for (i = [0:total_connectors * 2 - 1])
      translate([i * total_h, -frame_h, -dovetail_margin - sink_depth])
        rotate([90, 0, -90])
          dovetail_shape(frame_w * 2, margin_between_straight_connectors, true);
  }
  if (total_connectors > 0 && display == 1) {
    union()for (i = [0:w_connector_count - 1])
      translate([i * total_h, -frame_h, -dovetail_margin - sink_depth])
        rotate([90, 0, -90])
          dovetail_shape(frame_w * 2, margin_between_straight_connectors, true);
  }
}

// --- Frame Layout (assembles all sides based on display mode) ---
module frame_layout() {
  if (display == 0) {
    translate([0, total_h, 0])
      rotate([90, 0, 00])
        translate([0, 0, total_h]) {
          frame_side(outer_w, 0);
          translate([0, 0, -(total_h + gap) * 1])
            frame_side(outer_h, 1);
          translate([0, 0, -(total_h + gap) * 2])
            frame_side(outer_h, 3);
          translate([0, 0, -(total_h + gap) * 3])
            frame_side(outer_w, 2);
        }
  }
  if (display == 1) {
    frame_side(outer_w, 0);
  }
  if (display == 2) {
    difference() {
      frame_side(outer_w, 0);
      translate([0, 0, -total_h])
        linear_extrude(total_h * 2, convexity=10)
          scale([outer_w / 2, frame_w + lip_w, total_h + eps])
            square();
    }
  }
  if (display == 3) {
    frame_side(outer_w, 0);
    translate([0, outer_h, 0])
      rotate([0, 0, -90])
        frame_side(outer_h, 1);
    translate([outer_w, outer_h, 0])
      rotate([0, 0, 180])
        frame_side(outer_w, 2);
    translate([outer_w, 0, 0])
      rotate([0, 0, 90])
        frame_side(outer_h, 3);
  }
  if (display == 4) {
    double_gap = em * 2;
    translate([em, 0, 0])
      frame_side(outer_w, 0);
    translate([0, outer_h + em, 0])
      rotate([0, 0, -90])
        frame_side(outer_h, 1);
    translate([outer_w + em, outer_h + double_gap, 0])
      rotate([0, 0, 180])
        frame_side(outer_w, 2);
    translate([outer_w + double_gap, em, 0])
      rotate([0, 0, 90])
        frame_side(outer_h, 3);
  }
  if (display == 5) {
    rotate([180, 0, 0])
      frame_side(outer_w, 0);
  }
}

// --- Main Entry Point ---
module main() {
  frame_layout();
  straight_connectors();
}

// --- Texture Subtraction ---
module apply_texture(profile_width, piece_length) {
  if (texture_enabled) {
    render(convexity=4) woodgrain(piece_length, profile_width);
  }
}

// --- Woodgrain Pattern ---
module woodgrain(piece_length, profile_width) {
  for (y = [0:tex_size:profile_width]) {
    x_step = 16;
    translate([0, y, 0])for (x = [0:x_step:piece_length]) {
      if (rands(0, 100, 1)[0] < tex_threshold * 100) {
        translate([x, y, tex_depth])
          rotate([90, 0, rands(-2, 2, 1)[0]])
            translate([0, (tex_diameter / 2), 0])
              translate([0, -tex_depth * rands(.5, 1, 1)[0], 0])
                grain(tex_diameter + (rands(tex_diameter, tex_diameter * 10, 1)[0]), tex_diameter);
      }
    }
  }
}

// --- Single Grain Line ---
module grain(width, height) {
  linear_extrude(tex_depth * rands(.6, 1.4, 1)[0], convexity=10) {
    resize([width, height]) circle(d=10, $fn=100);
  }
}

// --- Top Bevel (thin strip at outer edge of profile) ---
module top_bevel(width) {
  polygon(
    points=[
      [0, tex_depth],
      [0, 0],
      [-width, 0],
      [-width, tex_depth],
    ]
  );
}

// --- Inner Profile Cutout (placeholder) ---
module inner_profile(width){}

// --- Corner Fillet Helpers ---
function normalize_vec(v) = v / norm(v);

module corner_fillet(pts, r) {
  let (
    p1 = pts[0],
    p2 = pts[1],
    p3 = pts[2],
    v1 = normalize_vec(p1 - p2),
    v2 = normalize_vec(p3 - p2),
    angle = acos(v1 * v2),
    tangent_len = r / tan(angle / 2),
    bisector_len = r / sin(angle / 2),
    tangent_pt1 = p2 + tangent_len * v1,
    tangent_pt2 = p2 + tangent_len * v2,
    arc_center = p2 + bisector_len * normalize_vec(v1 + v2)
  )
  difference() {
    polygon(points=[p2, tangent_pt1, tangent_pt2]);
    translate(arc_center) circle(r=r);
  }
}

module subtract_fillet(pts, r, enabled = true) {
  difference() {
    children();
    if (enabled)
      corner_fillet(pts, r);
  }
}

module add_fillet(pts, r, enabled = true) {
  union() {
    children();
    if (enabled)
      corner_fillet(pts, r);
  }
}

function check_corner(p1, p2, p3) =
  let (val = (p2.x - p1.x) * (p3.y - p2.y) - (p2.y - p1.y) * (p3.x - p2.x)) (val > 0) ? 1 : ( (val < 0) ? -1 : 0);

function get_corner_triplet(pts, i) =
  let (n = len(pts)) [
      pts[ (i - 1 + n) % n],
      pts[i % n],
      pts[ (i + 1) % n],
  ];

module apply_corner(all_points, index, fillet_r) {
  triplet = get_corner_triplet(all_points, index);
  direction = check_corner(triplet[0], triplet[1], triplet[2]);
  if (direction < 0) {
    subtract_fillet(triplet, fillet_r, true)
      children();
  } else if (direction > 0) {
    add_fillet(triplet, fillet_r, true)
      children();
  } else {
    children();
  }
}

// --- Noise Texture ---
module noise_pattern(w, l, density = 0.8, cutoff = 0.7) {
  x_step = 2;
  y_step = 5;
  for (x = [0:x_step:w]) {
    x_jitter = rands(-1, 1, 1)[0];
    for (y = [0:y_step:l]) {
      if (rands(0, 1, 1)[0] > cutoff) {
        r1 = rands(0, 0.5, 1)[0];
        r2 = rands(0, 0.5, 1)[0];
        jitter1 = rands(-0.5, 0.5, 1)[0];
        jitter2 = rands(-0.5, 0.5, 1)[0];
        hull() {
          translate([x + x_jitter + jitter1, y, 0])
            circle(r=r1, $fn=8);
          translate([x + x_jitter + jitter2, y + y_step, 0])
            circle(r=r2, $fn=8);
        }
      }
    }
  }
}

main();
