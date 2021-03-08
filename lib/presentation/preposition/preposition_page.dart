import 'package:basedFlutter/domain/model/preposition_model.dart';
import 'package:basedFlutter/presentation/based/based_text_view.dart';
import 'package:basedFlutter/presentation/preposition/preposition_page_style.dart';
import 'package:flutter/material.dart';

class PrepositionPage extends StatelessWidget {
  final PreposititonModel prepModel;

  const PrepositionPage({Key key, @required this.prepModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PrepositionPageStyle _prepositionPageStyle = PrepositionPageStyle();
    return Container(
        child: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          Container(
              margin: const EdgeInsets.only(bottom: 40, top: 10),
              child: Image.asset(prepModel.imagePath)),
          Container(
              margin: const EdgeInsets.only(left: 23, right: 23, bottom: 10),
              child: BasedTextView(
                style: _prepositionPageStyle.textTitleStyle,
                text: prepModel.title,
              )),
          Container(
              margin: const EdgeInsets.only(left: 40, right: 40),
              child: BasedTextView(
                style: _prepositionPageStyle.textDescStyle,
                text: prepModel.desc,
              ))
        ])));
  }
}
