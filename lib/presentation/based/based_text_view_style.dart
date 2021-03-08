import 'package:basedFlutter/util/font_families.dart';
import 'package:basedFlutter/util/palette.dart';
import 'package:flutter/material.dart';

abstract class BasedTextViewStyle {
  static var textViewStyle = {
    'fontColor': Palette.dark,
    'fontStyle': FontStyle.h1,
    'maxLines': 1,
    'overflow': TextOverflow.ellipsis,
    'textAlign': TextAlign.start,
    'lineSpacing': 1.5,
    'margin': Space(top: 0),
  };

  static var h1Style = {
    ...textViewStyle,
    'fontStyle': FontStyle.h1,
  };

  static var h1rStyle = {
    ...textViewStyle,
    'fontStyle': FontStyle.h1r,
  };

  static var h2Style = {
    ...textViewStyle,
    'fontStyle': FontStyle.h2,
  };

  static var h2rStyle = {
    ...textViewStyle,
    'fontStyle': FontStyle.h2r,
  };

  static var h3Style = {
    ...textViewStyle,
    'fontStyle': FontStyle.h3,
  };

  static var h3rStyle = {
    ...textViewStyle,
    'fontStyle': FontStyle.h3r,
  };

  static var h4Style = {
    ...textViewStyle,
    'fontStyle': FontStyle.h4,
  };

  static var h4rStyle = {
    ...textViewStyle,
    'fontStyle': FontStyle.h4r,
  };

  static var h5Style = {
    ...textViewStyle,
    'fontStyle': FontStyle.h5,
  };

  static var h5rStyle = {
    ...textViewStyle,
    'fontStyle': FontStyle.h5r,
  };

  static var h6Style = {
    ...textViewStyle,
    'fontStyle': FontStyle.h6,
  };

  static var h6rStyle = {
    ...textViewStyle,
    'fontStyle': FontStyle.h6r,
  };

  static var h7Style = {
    ...textViewStyle,
    'fontStyle': FontStyle.h7,
  };

  static var h7rStyle = {
    ...textViewStyle,
    'fontStyle': FontStyle.h7r,
  };

  static var h8Style = {
    ...textViewStyle,
    'fontStyle': FontStyle.h8,
  };

  static var h8rStyle = {
    ...textViewStyle,
    'fontStyle': FontStyle.h8r,
  };

  static var p1Style = {
    ...textViewStyle,
    'fontStyle': FontStyle.p1,
  };

  static var p1rStyle = {
    ...textViewStyle,
    'fontStyle': FontStyle.p1r,
  };

  static var p2Style = {
    ...textViewStyle,
    'fontStyle': FontStyle.p2,
  };

  static var p2rStyle = {
    ...textViewStyle,
    'fontStyle': FontStyle.p2r,
  };

  static var p3Style = {
    ...textViewStyle,
    'fontStyle': FontStyle.p3,
  };

  static var p3rStyle = {
    ...textViewStyle,
    'fontStyle': FontStyle.p3r,
  };

  static var p4Style = {
    ...textViewStyle,
    'fontStyle': FontStyle.p4,
  };

  static var p4rStyle = {
    ...textViewStyle,
    'fontStyle': FontStyle.p4r,
  };

  static var textAreaStyle = {
    ...textViewStyle,
    'fontStyle': FontStyle.h1,
    'maxLines': null,
    'overflow': null,
    'textAlign': TextAlign.start,
  };

  static var textAreaH1Style = {
    ...textAreaStyle,
    'fontStyle': FontStyle.h1,
  };

  static var textAreaH1rStyle = {
    ...textAreaStyle,
    'fontStyle': FontStyle.h1r,
  };

  static var textAreaH2Style = {
    ...textAreaStyle,
    'fontStyle': FontStyle.h2,
  };

  static var textAreaH2rStyle = {
    ...textAreaStyle,
    'fontStyle': FontStyle.h2r,
  };

  static var textAreaH3Style = {
    ...textAreaStyle,
    'fontStyle': FontStyle.h3,
  };

  static var textAreaH3rStyle = {
    ...textAreaStyle,
    'fontStyle': FontStyle.h3r,
  };

  static var textAreaH4Style = {
    ...textAreaStyle,
    'fontStyle': FontStyle.h4,
  };

  static var textAreaH4RStyle = {
    ...textAreaStyle,
    'fontStyle': FontStyle.h4r,
  };

  static var textAreaH5Style = {
    ...textAreaStyle,
    'fontStyle': FontStyle.h5,
  };

  static var textAreaH5RStyle = {
    ...textAreaStyle,
    'fontStyle': FontStyle.h5r,
  };

  static var textAreaH6Style = {
    ...textAreaStyle,
    'fontStyle': FontStyle.h6,
  };

  static var textAreaH6RStyle = {
    ...textAreaStyle,
    'fontStyle': FontStyle.h6r,
  };

  static var textAreaH7Style = {
    ...textAreaStyle,
    'fontStyle': FontStyle.h7,
  };

  static var textAreaH7RStyle = {
    ...textAreaStyle,
    'fontStyle': FontStyle.h7r,
  };

  static var textAreaH8Style = {
    ...textAreaStyle,
    'fontStyle': FontStyle.h8,
  };

  static var textAreaH8RStyle = {
    ...textAreaStyle,
    'fontStyle': FontStyle.h8r,
  };

  static var textAreaP1Style = {
    ...textAreaStyle,
    'fontStyle': FontStyle.p1,
  };

  static var textAreaP2Style = {
    ...textAreaStyle,
    'fontStyle': FontStyle.p2,
  };

  static var textAreaP2rStyle = {
    ...textAreaStyle,
    'fontStyle': FontStyle.p2r,
  };

  static var textAreaP3Style = {
    ...textAreaStyle,
    'fontStyle': FontStyle.p3,
  };

  static var textAreaP3rStyle = {
    ...textAreaStyle,
    'fontStyle': FontStyle.p3r,
  };

  static var textAreaP4rStyle = {
    ...textAreaStyle,
    'fontStyle': FontStyle.p4r,
  };
}
