import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_blood/app/modules/locations/controllers/location_controller.dart';
import 'package:my_blood/app/modules/locations/widgets/location_card.dart';
import 'package:my_blood/app/shared/widgets/busy_container.dart';
import 'package:provider/provider.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  LocationController _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller ??= Provider.of<LocationController>(context);
    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hemocentros'),
      ),
      body: Observer(
        builder: (_) {
          return BusyContainer(
            busy: _controller.busy,
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              shrinkWrap: true,
              itemCount: _controller.locations.length,
              itemBuilder: (context, index) {
                final location = _controller.locations[index];
                return LocationCard(location: location);
              },
            ),
            length: _controller.locations.length,
            icon: Icons.sentiment_dissatisfied,
          );
        },
      ),
    );
  }
}
