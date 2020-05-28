import 'package:flutter/material.dart';
import 'campaign_person_page.dart';
import 'campaign_location_page.dart';

class CampaignPage extends StatefulWidget {
  @override
  _CampaignPageState createState() => _CampaignPageState();
}

class _CampaignPageState extends State<CampaignPage> {

/*
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
*/

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Campanhas'),
          bottom: TabBar(
              labelColor: Colors.redAccent,
              unselectedLabelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: Colors.white),
              tabs: [
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("APPS"),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("MOVIES"),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("GAMES"),
                  ),
                ),
              ]),
        ),
        body: TabBarView(
          children: <Widget>[
            CampaignPersonPage(),
            CampaignLocationPage(),
          ],
        ),
      ),
    );
  }
}

/*

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

      */
