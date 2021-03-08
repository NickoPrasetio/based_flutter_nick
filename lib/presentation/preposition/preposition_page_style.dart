import 'package:basedFlutter/presentation/based/based_text_view_style.dart';
import 'package:basedFlutter/util/palette.dart';
import 'package:flutter/material.dart';

class PrepositionPageStyle {
  var textTitleStyle = {
    ...BasedTextViewStyle.h4rStyle,
    'fontColor': Palette.gray,
    'textAlign': TextAlign.center,
    'maxLines': 2
  };

  var textDescStyle = {
    ...BasedTextViewStyle.textAreaH3Style,
    'fontColor': Palette.gray,
    'textAlign': TextAlign.center,
    'maxLines': 3
  };
}
