import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_blood/app/modules/campaigns/controllers/campaign_location_controller.dart';
import 'package:my_blood/app/shared/widgets/containers/busy_container.dart';
import 'package:provider/provider.dart';

class CampaignLocationPage extends StatefulWidget {
  @override
  _CampaignLocationPageState createState() => _CampaignLocationPageState();
}

class _CampaignLocationPageState extends State<CampaignLocationPage> {
  CampaignLocationController _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller ??= Provider.of<CampaignLocationController>(context);
    _controller.fetch();
  }
/*
  _navigatorToNewLocation() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditorLocationsPage()),
    );
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
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
                //final location = _controller.locations[index];
                //1return LocationCard(location: location);
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
