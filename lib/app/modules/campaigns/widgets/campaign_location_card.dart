import 'package:flutter/material.dart';
import 'package:my_blood/app/modules/campaigns/models/campaign_location_model.dart';

class CampaignLocationCard extends StatelessWidget {
  final CampaignLocationModel campaign;

  const CampaignLocationCard({
    Key key,
    this.campaign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(campaign.name ?? ''),
        subtitle: Text(campaign.location ?? ''),
        trailing: Text(campaign.endDate ?? ''),
      ),
    );
  }
}
