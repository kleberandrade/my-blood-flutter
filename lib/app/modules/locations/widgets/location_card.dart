import 'package:flutter/material.dart';
import 'package:my_blood/app/modules/locations/models/location_model.dart';
import 'package:my_blood/app/shared/helpers/services_helper.dart';

class LocationCard extends StatelessWidget {
  final LocationModel location;

  const LocationCard({
    Key key,
    this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(location.name ?? ''),
              subtitle: Text(location.getFullAddress()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildButton(
                  visible: location.url != null,
                  label: 'SITE',
                  icon: Icons.public,
                  onPressed: () {
                    ServicesHelper.openUrl(location.url);
                  },
                ),
                _buildButton(
                  visible: location.phone != null,
                  label: 'LIGAR',
                  icon: Icons.call,
                  onPressed: () {
                    ServicesHelper.call(location.phone);
                  },
                ),
                _buildButton(
                  visible: location.address != null,
                  label: 'ROTA',
                  icon: Icons.directions,
                  onPressed: () {
                    ServicesHelper.directions(
                        location.getFullAddress(useUf: false));
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
