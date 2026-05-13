// The render mode of the frame
display = 0; // [0: for printing, 1: sample, 2: cross section, 3: flat, 4: exploded, 5: upside down sample]

// Unit type of the art size
art_unit = 0; // [0: mm, 1: inch]

// The width of your artwork
art_width = 171;

// The height of your artwork
art_height = 246;

// Number of hanging holes
screw_hole = 4; // [0: no screwhole, 1: 1 screwhole, 2: 2 screwholes, 3: 4 screwholes]

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
lip_w = 5; // [1:0.5:50]

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
// How many positions on the screwhole
num_screw_positions = 3; // [3:4:23]

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

kcJtw = display;
MywFF = art_unit;
WMuZN = art_width;
GibWo = art_height;
FCwIP = screw_hole;
GZiOZ = lip;
agfaS = art_gutter;
BtLgA = glass_gutter;
omQsL = texture_enabled;
pWOwC = frame_w;
Lfxra = frame_h;
yjKLF = lip_w;
XoZTW = lip_h;
Rmvyr = tex_threshold;
jsnsv = tex_diameter;
UVeDK = tex_size;
soCKU = tex_depth;
gHIHT = art_gutter_d;
rQNyD = art_gutter_h;
elVpn = glass_offset;
EoJJw = glass_gutter_d;
PpNnP = glass_gutter_h;
imSWY = screw_head_d;
cnmtq = screw_head_h;
NTLyk = screw_shaft_d;
gkcZK = screw_hole_margin;
JPxqn = screw_margin;
jYplO = num_screw_positions;
sGTXG = dovetail_margin;
dPinq = dovetail_corner_radius;
xKcRZ = margin_between_corner_connectors;
SOGbD = margin_between_straight_connectors;
DYGss = straight_connector_sink_percentage;
JCgFu = max_size;
ztKaf = gap;
GrOXZ = em;
module gFrLM(yZfFS) { translate(yZfFS) children(); }
module ZQcgr(yZfFS) { rotate(yZfFS) children(); }
module dDNNX(YrUXn) { polygon(points=YrUXn); }
module skoZn(LOoLr) { circle(r=LOoLr); }
module AJLXE(mtWKX, FXVTv = false) { square(size=mtWKX, center=FXVTv); }
module xfGvL(pZJbD, convexity = 10) { linear_extrude(pZJbD, convexity=10) children(); }

mdefs = WMuZN * (MywFF == 0 ? 1 : 25.4);
YqVoY = GibWo * (MywFF == 0 ? 1 : 25.4);
XbvlB = !agfaS ? 0 : rQNyD;
DXMVn = !BtLgA ? 0 : PpNnP;
gEDeq = !BtLgA ? 0 : elVpn;
rViwk = XoZTW;
JTsFD = Lfxra + XbvlB + DXMVn + gEDeq + rViwk;
oWfOj = -JTsFD + XoZTW;
rdWpW = oWfOj + XbvlB;
IsglG = rdWpW + gEDeq;
hraxB = IsglG + DXMVn;
ywBRk = mdefs - (!agfaS ? 0 : gHIHT * 2);
TktDa = YqVoY - (!agfaS ? 0 : gHIHT * 2);
dEDvS = ywBRk + pWOwC * 2;
YAJtc = TktDa + pWOwC * 2;
awKnP = pWOwC + yjKLF;
yVhVd = agfaS || BtLgA;
fUmqh = (!agfaS ? 0 : gHIHT) + (!BtLgA ? 0 : EoJJw);
JXfgF = 0 + 0.01;
vfyUO = 0 + 0.02;
yjrSz = pWOwC * DYGss;
module CfdDZ(TGegK, index = 0, miter = true) {
  iScTr = ceil(TGegK / JCgFu);
  brbrL = iScTr % 2 == 1 ? 0 : 1;
  BGGFp = iScTr + brbrL;
  JpdCl = TGegK / BGGFp;
  Gpiuo = BGGFp - 2;
  GrOXZ = kcJtw == 0 ? JXfgF : kcJtw == 4 || kcJtw == 1 ? 5 : 0;
  TGegK = BGGFp == 1 ? TGegK : TGegK + (JXfgF * (BGGFp - 1));
  difference() {
    if (BGGFp == 1) {
      gFrLM([TGegK / 2, pWOwC, 0])
        union() {
          YVcxr(index, TGegK / 2, miter)
            ObpXp(TGegK / 2, miter);
          mirror([1, 0, 0])
            YVcxr(index, TGegK / 2, miter)
              ObpXp(TGegK / 2, miter);
        }
    } else {
      gFrLM([JpdCl, pWOwC, 0])
        YVcxr(index, JpdCl, false, true, true)
          YVcxr(index, JpdCl, miter)
            ObpXp(JpdCl, miter);
      for (i = [1:Gpiuo]) {
        gFrLM([JpdCl + (JpdCl + GrOXZ) * i, pWOwC, 0])
          YVcxr(-1, JpdCl, false, true, true)
            YVcxr(-1, JpdCl, false, false, true)
              ObpXp(JpdCl, false);
      }
      gFrLM([(TGegK + (GrOXZ * (BGGFp - 1))) - JpdCl, pWOwC, 0])
        mirror([1, 0, 0])
          YVcxr(index, JpdCl, false, true, true)
            YVcxr(index, JpdCl, miter)
              ObpXp(JpdCl, miter);
    }
    PxUPl(pWOwC, TGegK);
    dvxbT(index, TGegK);
  }
}
module YVcxr(index = 0, l, miter = true, other_side = false, pin = false) {
  if (miter) {
    if (index % 2 == 0) {
      union() {
        gFrLM([-l, -pWOwC, 0])
          tjxtv(pWOwC + JXfgF, xKcRZ, pin=pin);
        children();
      }
    } else {
      difference() {
        children();
        gFrLM([-l, sGTXG * 2, 0])
          ZQcgr([0, 0, -90])
            tjxtv(pWOwC + JXfgF + xKcRZ, pin=pin);
      }
    }
  } else {
    if (!other_side) {
      difference() {
        children();
        gFrLM([-l - sGTXG - JXfgF, -pWOwC, 0])
          tjxtv(pWOwC + vfyUO + xKcRZ, pin=pin);
      }
    } else {
      difference() {
        children();
        gFrLM([-sGTXG - (pWOwC - JXfgF + xKcRZ), -pWOwC, 0])
          tjxtv(pWOwC + vfyUO + xKcRZ, pin=pin);
      }
    }
  }
}
module ObpXp(GMgzm, miter = true) {
  module mSDGh() {
    difference() {
      union() {
        gFrLM([-pWOwC, -JTsFD])
          AJLXE([pWOwC, JTsFD]);
        ArmeY(pWOwC);
        if (GZiOZ) {
          gFrLM([0, oWfOj - XoZTW])
            AJLXE([yjKLF, XoZTW]);
        }
      }
      rFNHe(pWOwC);
      if (agfaS) {
        gFrLM([-gHIHT, rdWpW - rQNyD])
          AJLXE([gHIHT * 2, rQNyD]);
      }
      if (BtLgA) {
        gFrLM([-EoJJw, hraxB - PpNnP])
          AJLXE([EoJJw * 2, PpNnP]);
      }
    }
  }
  difference() {
    ZQcgr([90, 0, 90])
      gFrLM([0, 0, -GMgzm])
        xfGvL(GMgzm, convexity=10)
          mSDGh();
    if (miter) {
      gFrLM([-GMgzm + pWOwC, 0, -JTsFD - JXfgF])
        xfGvL(JTsFD + 20)
          dDNNX(
            YrUXn=[
              [-pWOwC - JXfgF, -pWOwC - JXfgF],
              [yjKLF + JXfgF, yjKLF + JXfgF],
              [-pWOwC - JXfgF, yjKLF + JXfgF],
            ]
          );
    }
  }
}
module tjxtv(TGegK, extra_margin = 0, pin = false) {
  jmPGm = dPinq - extra_margin / 2;
  mAgNE = sGTXG + extra_margin;
  EbNdK = mAgNE + jmPGm;
  BDnpy = pWOwC - fUmqh;
  bbyRW = [JTsFD / 2, EbNdK];
  LMQEw = [JTsFD - EbNdK, BDnpy * .66];
  sBpHW = [JTsFD / 2, pWOwC - fUmqh - EbNdK];
  SSppi = [EbNdK, BDnpy * .66];
  gFrLM([mAgNE, 0, 0])
    ZQcgr([0, 90, 00])
      xfGvL(TGegK)
        difference() {
          hull() {
            gFrLM(bbyRW)
              skoZn(LOoLr=jmPGm);
            gFrLM(LMQEw)
              skoZn(LOoLr=jmPGm);
            gFrLM(sBpHW)
              skoZn(LOoLr=jmPGm);
            gFrLM(SSppi)
              skoZn(LOoLr=jmPGm);
          }
          if (pin) {
            dDNNX(
              YrUXn=[
                [0, 0],
                [0, yjrSz + mAgNE],
                [JTsFD, yjrSz + mAgNE],
                [JTsFD, 0],
              ]
            );
          }
        }
}
module dvxbT(index, TGegK) {
  GMgzm = TGegK / 2;
  bDFzZ = imSWY + (JPxqn * 2);
  ukMdT = NTLyk + (JPxqn * 2);
  Ukdeb = gkcZK + cnmtq + (JPxqn * 2);
  NGvir = bDFzZ * .001;
  mAgNE = gkcZK;
  jCHoz = mAgNE + (bDFzZ / 2) + JPxqn;
  DFJov = pWOwC - fUmqh - gkcZK / 2;
  ztKaf = 0.6;
  zAadL = (bDFzZ - ukMdT) + (ukMdT * (jYplO - 1) * ztKaf + ukMdT);
  rJMft = (FCwIP == 1 && index == 0) || (FCwIP == 2 && index % 2 == 0) || (FCwIP == 3);
  if (rJMft)
    gFrLM([-zAadL / 2 + GMgzm, 0])
      union() {
        gFrLM([0, 0, -JTsFD])
          ZQcgr([90, 0, 90])
            xfGvL(zAadL)
              dDNNX(
                YrUXn=[
                  [DFJov, 0],
                  [DFJov - Ukdeb * .66, Ukdeb],
                  [mAgNE, Ukdeb],
                  [mAgNE, gkcZK],
                  [jCHoz - NGvir, gkcZK],
                  [jCHoz - NGvir, 0],
                ]
              );
        for (i = [0:jYplO - 1])
          gFrLM([(bDFzZ / 2) + (i * (ukMdT * ztKaf)), jCHoz, -JTsFD])
            xfGvL(gkcZK)
              skoZn(LOoLr=ukMdT / 2, $fn=4);
      }
}
module MRVUd() {
  XccXV = ceil(dEDvS / JCgFu);
  jKFDA = XccXV % 2 == 1 ? 0 : 1;
  gQafS = XccXV + jKFDA;
  owCQv = gQafS - 1;
  ABksr = ceil(YAJtc / JCgFu);
  ZQdEW = ABksr % 2 == 1 ? 0 : 1;
  FeWrd = ABksr + ZQdEW;
  WlLJm = FeWrd - 1;
  SbaYO = owCQv + WlLJm;
  if (SbaYO > 0 && (kcJtw == 0 || kcJtw == 4)) {
    union()for (i = [0:SbaYO * 2 - 1])
      gFrLM([i * JTsFD, -Lfxra, -sGTXG - yjrSz])
        ZQcgr([90, 0, -90])
          tjxtv(pWOwC * 2, SOGbD, true);
  }
  if (SbaYO > 0 && kcJtw == 1) {
    union()for (i = [0:owCQv - 1])
      gFrLM([i * JTsFD, -Lfxra, -sGTXG - yjrSz])
        ZQcgr([90, 0, -90])
          tjxtv(pWOwC * 2, SOGbD, true);
  }
}
module YDpPw() {
  if (kcJtw == 0) {
    gFrLM([0, JTsFD, 0])
      ZQcgr([90, 0, 00])
        gFrLM([0, 0, JTsFD]) {
          CfdDZ(dEDvS, 0);
          gFrLM([0, 0, -(JTsFD + ztKaf) * 1])
            CfdDZ(YAJtc, 1);
          gFrLM([0, 0, -(JTsFD + ztKaf) * 2])
            CfdDZ(YAJtc, 3);
          gFrLM([0, 0, -(JTsFD + ztKaf) * 3])
            CfdDZ(dEDvS, 2);
        }
  }
  if (kcJtw == 1) {
    CfdDZ(dEDvS, 0);
  }
  if (kcJtw == 2) {
    difference() {
      CfdDZ(dEDvS, 0);
      gFrLM([0, 0, -JTsFD])
        xfGvL(JTsFD * 2)
          scale([dEDvS / 2, pWOwC + yjKLF, JTsFD + JXfgF])
            AJLXE();
    }
  }
  if (kcJtw == 3) {
    CfdDZ(dEDvS, 0);
    gFrLM([0, YAJtc, 0])
      ZQcgr([0, 0, -90])
        CfdDZ(YAJtc, 1);
    gFrLM([dEDvS, YAJtc, 0])
      ZQcgr([0, 0, 180])
        CfdDZ(dEDvS, 2);
    gFrLM([dEDvS, 0, 0])
      ZQcgr([0, 0, 90])
        CfdDZ(YAJtc, 3);
  }
  if (kcJtw == 4) {
    vBwiO = GrOXZ * 2;
    gFrLM([GrOXZ, 0, 0])
      CfdDZ(dEDvS, 0);
    gFrLM([0, YAJtc + GrOXZ, 0])
      ZQcgr([0, 0, -90])
        CfdDZ(YAJtc, 1);
    gFrLM([dEDvS + GrOXZ, YAJtc + vBwiO, 0])
      ZQcgr([0, 0, 180])
        CfdDZ(dEDvS, 2);
    gFrLM([dEDvS + vBwiO, GrOXZ, 0])
      ZQcgr([0, 0, 90])
        CfdDZ(YAJtc, 3);
  }
  if (kcJtw == 5) {
    ZQcgr([180, 0, 0])
      CfdDZ(dEDvS, 0);
  }
}
module ChwUQ() {
  YDpPw();
  MRVUd();
}
module PxUPl(width, TGegK) {
  if (omQsL) {
    fMGXy(TGegK, width);
  }
}
module fMGXy(width, height) {
  for (y = [0:UVeDK:height]) {
    njdeR = 16;
    gFrLM([0, y, 0])for (x = [0:njdeR:width]) {
      if (rands(0, 100, 1)[0] < Rmvyr * 100) {
        gFrLM([x, y, soCKU])
          ZQcgr([90, 0, rands(-2, 2, 1)[0]])
            gFrLM([0, (jsnsv / 2), 0])
              gFrLM([0, -soCKU * rands(.5, 1, 1)[0], 0])
                IAfJm(jsnsv + (rands(jsnsv, jsnsv * 10, 1)[0]), jsnsv);
      }
    }
  }
}
module IAfJm(width, height) {
  xfGvL(pZJbD=soCKU * rands(.6, 1.4, 1)[0]) {
    resize([width, height]) skoZn(d=10, $fn=100);
  }
}
module ArmeY(width) {
  ZRSXy = [
    [0, soCKU],
    [0, 0],
    [-width, 0],
    [-width, soCKU],
  ];
  dDNNX(YrUXn=ZRSXy);
}
module rFNHe(width){}
function _u(v) = v / norm(v);
module jDBam(pts, r) {
  let (
    mIfck = pts[0],
    p2 = pts[1],
    p3 = pts[2],
    mHSPE = _u(mIfck - p2),
    XCHIg = _u(p3 - p2),
    CcxpN = acos(mHSPE * XCHIg),
    LvLjx = r / tan(CcxpN / 2),
    aiEBz = r / sin(CcxpN / 2),
    YFqDy = p2 + LvLjx * mHSPE,
    FDzCC = p2 + LvLjx * XCHIg,
    oRvey = p2 + aiEBz * _u(mHSPE + XCHIg)
  )
  difference() {
    dDNNX([p2, YFqDy, FDzCC]);
    gFrLM(oRvey) skoZn(LOoLr=r);
  }
}
module zxWvy(pts, r, enabled = true) {
  difference() {
    children();
    if (enabled)
      jDBam(pts, r);
  }
}
module loGVd(pts, r, enabled = true) {
  union() {
    children();
    if (enabled)
      jDBam(pts, r);
  }
}
function check_corner(mIfck, p2, p3) =
  let (val = (p2.x - mIfck.x) * (p3.y - p2.y) - (p2.y - mIfck.y) * (p3.x - p2.x)) (val > 0) ? 1 : ( (val < 0) ? -1 : 0);
function get_corner_triplet(pts, i) =
  let (n = len(pts)) [
      pts[ (i - 1 + n) % n],
      pts[i % n],
      pts[ (i + 1) % n],
  ];
module enAsG(all_points, index, jmPGm) {
  ZRSXy = get_corner_triplet(all_points, index);
  YWiwD = check_corner(ZRSXy[0], ZRSXy[1], ZRSXy[2]);
  if (YWiwD < 0) {
    zxWvy(ZRSXy, jmPGm, true)
      children();
  } else if (YWiwD > 0) {
    loGVd(ZRSXy, jmPGm, true)
      children();
  } else {
    children();
  }
}
module nhoTE(w, l, density = 0.8, cutoff = 0.7) {
  wWRuO = 2;
  uEGHA = 5;
  for (x = [0:wWRuO:w]) {
    cAKqp = rands(-1, 1, 1)[0];
    for (y = [0:uEGHA:l]) {
      if (rands(0, 1, 1)[0] > cutoff) {
        eHNJS = rands(0, 0.5, 1)[0];
        wSLXn = rands(0, 0.5, 1)[0];
        KnyVP = rands(-0.5, 0.5, 1)[0];
        EpEqa = rands(-0.5, 0.5, 1)[0];
        hull() {
          gFrLM([x + cAKqp + KnyVP, y, 0])
            skoZn(LOoLr=eHNJS, $fn=8);
          gFrLM([x + cAKqp + EpEqa, y + uEGHA, 0])
            skoZn(LOoLr=wSLXn, $fn=8);
        }
      }
    }
  }
}
ChwUQ();
