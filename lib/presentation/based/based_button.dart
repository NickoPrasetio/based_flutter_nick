import 'package:basedFlutter/util/font_families.dart';
import 'package:basedFlutter/util/palette.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BasedButton extends StatelessWidget {
  BasedButton({
    this.pressHandler,
    this.text,
    this.isEnabled = true,
    style,
  }) {
    _size = style['size'];
    _color = isEnabled ? style['color'] : Palette.red;
    _secondaryColor = isEnabled ? style['secondaryColor'] : null;
    _borderRadiusRectangle = style['borderRadiusRectangle'];
    _fontColor = isEnabled ? style['fontColor'] : Palette.blue;
    _borderColor = style['borderColor'];
    _borderWidth = style['borderWidth'];
    _fontStyle = style['fontStyle'];
    _gradient = style['gradient'];
    _contAlignment = style['contAlignment'];
    _margin = style['margin'];
    _endIcon = style['endIcon'];
    _startIcon = style['startIcon'];
    _iconSize = style['iconSize'];
    _isStartCircle = style['isStartCircle'];
  }

  final Function pressHandler;
  final String text;
  final bool isEnabled;
  bool _isStartCircle;
  String _endIcon, _startIcon;
  Size _size, _iconSize;
  Space _margin;
  FontStyle _fontStyle;
  OneGradient _gradient;
  Alignment _contAlignment;
  Color _fontColor, _color, _secondaryColor, _borderColor;
  double _borderWidth;
  num _borderRadiusRectangle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: _margin?.top?.toDouble() ?? 0,
          bottom: _margin?.bottom?.toDouble() ?? 0,
          left: _margin?.left?.toDouble() ?? 0,
          right: _margin?.right?.toDouble() ?? 0),
      child: Container(
        height: _size.height.toDouble(),
        width: _size.width.toDouble(),
        child: RaisedButton(
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: null != _borderColor
                ? BorderSide(
                    width: _borderWidth,
                    color: _borderColor,
                  )
                : BorderSide.none,
            borderRadius:
                BorderRadius.circular(_borderRadiusRectangle.toDouble()),
          ),
          onPressed: isEnabled ? pressHandler : null,
          padding: const EdgeInsets.all(0),
          child: Ink(
            decoration: BoxDecoration(
              color: _color,
              gradient: null != _secondaryColor
                  ? LinearGradient(
                      colors: [_color, _secondaryColor],
                      begin: _gradient.begin,
                      end: _gradient.end,
                    )
                  : null,
              borderRadius:
                  BorderRadius.circular(_borderRadiusRectangle.toDouble()),
            ),
            child: Container(
              width: _size.width.toDouble(),
              height: _size.height.toDouble(),
              alignment: _contAlignment,
              child: Container(
                child: Row(
                  mainAxisAlignment: _endIcon == null
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    if (_isStartCircle != null)
                      Container(
                        margin:
                            const EdgeInsets.only(left: 5, top: 5, bottom: 5),
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Palette.purple),
                      ),
                    if (_startIcon != null)
                      Container(
                        margin: const EdgeInsets.only(left: 15),
                        child: Image.asset(
                          _startIcon,
                          width: _iconSize.width.toDouble(),
                          height: _iconSize.height.toDouble(),
                        ),
                      ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 15, left: 15),
                        child: Text(
                          text,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: _fontStyle.family,
                              fontSize: _fontStyle.size,
                              color: _fontColor),
                        ),
                      ),
                    ),
                    if (_endIcon != null)
                      Container(
                        margin: const EdgeInsets.only(right: 15),
                        child: Image.asset(
                          _endIcon,
                          width: _iconSize.width.toDouble(),
                          height: _iconSize.height.toDouble(),
                        ),
                      )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
