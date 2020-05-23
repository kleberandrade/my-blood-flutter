import 'package:flutter/material.dart';
import 'package:my_blood/app/modules/campaigns/models/campaign_model.dart';

class CampaignCard extends StatelessWidget {
  final CampaignModel campaign;

  const CampaignCard({
    Key key,
    this.campaign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.local_hospital),
        title: Text(campaign.name ?? ''),
        subtitle: Text('${campaign.address} - ${campaign.neighborhood}'),
        isThreeLine: true,
      ),
    );
  }
}
