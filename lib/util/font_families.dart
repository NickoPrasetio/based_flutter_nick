import 'package:flutter/material.dart';

class FontFamilies {
  static const headerRegular = 'ProximaNovaRegular';
  static const headerBold = 'ProximaNovaBold';
  static const bodyRegular = 'SFProTextRegular';
  static const bodyBold = 'SFProTextBold';
}

class Space {
  num top = 0;
  num bottom = 0;
  num left = 0;
  num right = 0;

  Space({this.top = 0, this.bottom = 0, this.left = 0, this.right = 0, all,}) {
    if (null != all) {
      top = all;
      bottom = all;
      left = all;
      right = all;
    }
  }
}

class Size {
  num width = 0;
  num height = 0;

  Size({this.width, this.height});
}

class OneGradient {
  Alignment begin, end = Alignment.center;

  OneGradient({this.begin, this.end});
}

class FontStyle {
  String family;
  double size;

  FontStyle(Map<String, dynamic> font) {
    family = font['family'];
    size = font['size'];
  }

  static var h1 = FontStyle({
    'family': FontFamilies.headerBold,
    'size': 36.0,
  });

  static var h1r = FontStyle({
    'family': FontFamilies.headerRegular,
    'size': 36.0,
  });

  static var h2 = FontStyle({
    'family': FontFamilies.headerBold,
    'size': 28.0,
  });

  static var h2r = FontStyle({
    'family': FontFamilies.headerRegular,
    'size': 28.0,
  });

  static var h3 = FontStyle({
    'family': FontFamilies.headerBold,
    'size': 24.0,
  });

  static var h3r = FontStyle({
    'family': FontFamilies.headerRegular,
    'size': 24.0,
  });

  static var h4 = FontStyle({
    'family': FontFamilies.headerBold,
    'size': 20.0,
  });

  static var h4r = FontStyle({
    'family': FontFamilies.headerRegular,
    'size': 20.0,
  });

  static var h5 = FontStyle({
    'family': FontFamilies.headerBold,
    'size': 18.0,
  });

  static var h5r = FontStyle({
    'family': FontFamilies.headerRegular,
    'size': 18.0,
  });

  static var h6 = FontStyle({
    'family': FontFamilies.headerBold,
    'size': 16.0,
  });

  static var h6r = FontStyle({
    'family': FontFamilies.headerRegular,
    'size': 16.0,
  });

  static var h7 = FontStyle({
    'family': FontFamilies.headerBold,
    'size': 14.0,
  });

  static var h7r = FontStyle({
    'family': FontFamilies.headerRegular,
    'size': 14.0,
  });

  static var h8 = FontStyle({
    'family': FontFamilies.headerBold,
    'size': 12.0,
  });

  static var h8r = FontStyle({
    'family': FontFamilies.headerRegular,
    'size': 12.0,
  });

  static var p1 = FontStyle({
    'family': FontFamilies.bodyBold,
    'size': 16.0,
  });

  static var p1r = FontStyle({
    'family': FontFamilies.bodyRegular,
    'size': 16.0,
  });

  static var p2 = FontStyle({
    'family': FontFamilies.bodyBold,
    'size': 14.0,
  });

  static var p2r = FontStyle({
    'family': FontFamilies.bodyRegular,
    'size': 14.0,
  });

  static var p3 = FontStyle({
    'family': FontFamilies.bodyBold,
    'size': 12.0,
  });

  static var p3r = FontStyle({
    'family': FontFamilies.bodyRegular,
    'size': 12.0,
  });

  static var p4 = FontStyle({
    'family': FontFamilies.bodyBold,
    'size': 10.0,
  });

  static var p4r = FontStyle({
    'family': FontFamilies.bodyRegular,
    'size': 10.0,
  });
}

class LayoutSpace {
  static double space1 = 8;
  static double space2 = 16;
  static double space3 = 24;
  static double space4 = 32;
  static double space5 = 40;
  static double space6 = 48;
  static double space7 = 56;
  static double space8 = 64;
  static double space9 = 72;
  static double space10 = 80;
  static double space11 = 88;
  static double space16 = 128;
  static double space18 = 144;
}

class SmallSpace {
  static double space1 = 2;
  static double space2 = 4;
  static double space3 = 6;
  static double space4 = 8;
  static double space5 = 10;
  static double space6 = 12;
  static double space8 = 16;
  static double space9 = 18;
  static double space12 = 24;
  static double space16 = 32;
  static double space24 = 48;
}
