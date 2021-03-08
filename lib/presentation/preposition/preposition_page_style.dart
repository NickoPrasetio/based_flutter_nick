import 'package:flutter/material.dart';
import 'package:ruangmom/presentation/base/textview/one_text_view_style.dart';
import 'package:ruangmom/util/palette.dart';

class PrepositionPageStyle {
  var textTitleStyle = {
    ...OneTextViewStyle.h4bStyle,
    'fontColor': Palette.orange,
    'textAlign': TextAlign.center,
    'maxLines': 2
  };

  var textDescStyle = {
    ...OneTextViewStyle.textAreaH3Style,
    'fontColor': Palette.deepGray,
    'textAlign': TextAlign.center,
    'maxLines': 3
  };
}
