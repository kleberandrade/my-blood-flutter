import 'package:flutter/material.dart';
import 'package:my_blood/app/shared/widgets/avatar_network.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String pictureUrl;
  final String email;
  final String lastDate;
  final String nextDate;
  final Function onTapImage;
  final bool editable;

  const ProfileHeader({
    Key key,
    this.editable,
    this.name,
    this.pictureUrl,
    this.email,
    this.lastDate,
    this.nextDate,
    this.onTapImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      color: Theme.of(context).primaryColor,
      height: 220.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(child: SizedBox()),
          GestureDetector(
            onTap: editable ? onTapImage : null,
            child: AvatarNetwork(
              initials: name ?? '?',
              pictureUrl: pictureUrl ?? '',
              size: 80.0,
              leftPadding: 0.0,
            ),
          ),
          Expanded(child: SizedBox()),
          Text(
            name ?? '?',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).canvasColor,
            ),
          ),
          Text(
            email ?? '?',
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w300,
              color: Theme.of(context).canvasColor,
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            color: Theme.of(context).primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildDonationDate(context, label: 'Última doação', date: lastDate),
                Icon(Icons.favorite, color: Theme.of(context).canvasColor),
                _buildDonationDate(context, label: 'Próxima doação', date: nextDate),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildDonationDate(BuildContext context, {String label, String date}) {
    return Expanded(
      child: ListTile(
        title: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).canvasColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          date,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).canvasColor,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
