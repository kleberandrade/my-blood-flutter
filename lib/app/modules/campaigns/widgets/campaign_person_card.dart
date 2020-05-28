import 'package:flutter/material.dart';
import 'package:my_blood/app/modules/campaigns/models/campaign_person_model.dart';
import 'package:my_blood/app/shared/helpers/date_helper.dart';

class CampaignPersonCard extends StatelessWidget {
  final CampaignPersonModel campaign;

  const CampaignPersonCard({
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
