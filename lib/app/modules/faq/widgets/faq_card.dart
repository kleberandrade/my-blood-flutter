import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:my_blood/app/modules/faq/models/faq_model.dart';

class FaqCard extends StatelessWidget {
  final FaqModel faq;

  const FaqCard({
    Key key,
    this.faq,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTileCard(
        elevation: 0.0,
        title: Text(faq.question ?? ''),
        children: <Widget>[
          Divider(
            thickness: 1.0,
            height: 1.0,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Text(
                faq.answer,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
