import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_blood/app/modules/faq/controllers/faq_controller.dart';
import 'package:my_blood/app/modules/faq/widgets/faq_card.dart';
import 'package:my_blood/app/shared/widgets/busy_container.dart';
import 'package:provider/provider.dart';

class FaqPage extends StatefulWidget {
  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  FaqController _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller ??= Provider.of<FaqController>(context);
    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dúvidas frequentes'),
      ),
      body: Observer(
        builder: (_) {
          return BusyContainer(
            busy: _controller.busy,
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              shrinkWrap: true,
              itemCount: _controller.faqList.length,
              itemBuilder: (context, index) {
                final faq = _controller.faqList[index];
                return FaqCard(faq: faq);
              },
            ),
            length: _controller.faqList.length,
            icon: Icons.sentiment_dissatisfied,
          );
        },
      ),
    );
  }
}
