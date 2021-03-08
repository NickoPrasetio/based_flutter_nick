import 'package:flutter/material.dart';

class OneRoute<T> extends MaterialPageRoute<T> {
  OneRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);
}