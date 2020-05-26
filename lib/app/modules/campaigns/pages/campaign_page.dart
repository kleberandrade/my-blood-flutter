import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_blood/app/modules/campaigns/controllers/campaign_controller.dart';
import 'package:my_blood/app/modules/campaigns/widgets/campaign_card.dart';
import 'package:my_blood/app/shared/widgets/busy_container.dart';
import 'package:my_blood/app/themes/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

import 'editor_campaign_location_page.dart';
import 'editor_campaign_person_page.dart';

class CampaignPage extends StatefulWidget {
  @override
  _CampaignPageState createState() => _CampaignPageState();
}

class _CampaignPageState extends State<CampaignPage> {
  CampaignController _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller ??= Provider.of<CampaignController>(context);
    _controller.getCampaigns();
  }

  _navigatorToNewCampaignLocation() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditorCampaignLocationPage()),
    );
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
      appBar: AppBar(
        title: Text('Campanhas'),
      ),
      floatingActionButton: SpeedDial(
        child: Icon(Icons.add),
        speedDialChildren: <SpeedDialChild>[
          SpeedDialChild(
            child: Icon(Icons.person_add),
            foregroundColor: canvasColor,
            backgroundColor: accentColor,
            label: 'Solicitar doação',
            onPressed: _navigatorToNewCampaignPerson,
          ),
          SpeedDialChild(
            child: Icon(Icons.group_add),
            foregroundColor: canvasColor,
            backgroundColor: accentColor,
            label: 'Nova campanha',
            onPressed: _navigatorToNewCampaignLocation,
          ),
        ],
        closedForegroundColor: canvasColor,
        closedBackgroundColor: accentColor,
        openForegroundColor: accentColor,
        openBackgroundColor: canvasColor,
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
                return CampaignCard(campaign: campaign);
              },
            ),
            length: _controller.campaigns.length,
            message: 'Sem campanhas',
            icon: Icons.sentiment_dissatisfied,
          );
        },
      ),
    );
  }
}
