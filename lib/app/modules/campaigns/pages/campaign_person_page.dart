import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_blood/app/modules/campaigns/controllers/campaign_person_controller.dart';
import 'package:my_blood/app/modules/campaigns/pages/editor_campaign_person_page.dart';
import 'package:my_blood/app/modules/campaigns/widgets/campaign_person_card.dart';
import 'package:my_blood/app/shared/widgets/containers/busy_container.dart';
import 'package:provider/provider.dart';

class CampaignPersonPage extends StatefulWidget {
  @override
  _CampaignPersonPageState createState() => _CampaignPersonPageState();
}

class _CampaignPersonPageState extends State<CampaignPersonPage> {
  CampaignPersonController _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller ??= Provider.of<CampaignPersonController>(context);
    _controller.fetch();
  }


  _navigatorToNewCampaignPerson() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditorCampaignPersonPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _navigatorToNewCampaignPerson,
      ),
      body: Observer(
        builder: (_) {
          return BusyContainer(
            busy: _controller.busy,
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              shrinkWrap: true,
              itemCount: _controller.campaigns.length,
              itemBuilder: (context, index) {
                final campaign = _controller.campaigns[index];
                return CampaignPersonCard(campaign: campaign);
              },
            ),
            length: _controller.campaigns.length,
            icon: Icons.sentiment_dissatisfied,
          );
        },
      ),
    );
  }
}
