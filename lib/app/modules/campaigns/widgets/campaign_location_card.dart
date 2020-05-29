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
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(campaign.name ?? ''),
              subtitle: Text(campaign.location),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildButton(
                  visible: true,
                  label: 'COMPARTILHAR',
                  icon: Icons.share,
                  onPressed: () {
                    //ServicesHelper.directions(campaign.getFullAddress(useUf: false));
                  },
                ),
                _buildButton(
                  visible: true,
                  label: 'DOAR',
                  icon: Icons.favorite,
                  onPressed: () {
                    //ServicesHelper.directions(campaign.getFullAddress(useUf: false));
                  },
                ),
                _buildButton(
                  visible: true,
                  label: 'ROTA',
                  icon: Icons.directions,
                  onPressed: () {
                    //ServicesHelper.directions(campaign.getFullAddress(useUf: false));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildButton(
      {bool visible, String label, IconData icon, Function onPressed}) {
    return Visibility(
      visible: visible,
      child: FlatButton.icon(
        icon: Icon(
          icon,
          size: 18.0,
        ),
        label: Text(
          label,
          style: TextStyle(fontSize: 12.0),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
