import 'package:flutter/material.dart';
import 'package:my_blood/app/modules/profile/controllers/profile_controller.dart';
import 'package:provider/provider.dart';

class ProfileHistoricPage extends StatefulWidget {
  @override
  _ProfileHistoricPageState createState() => _ProfileHistoricPageState();
}

class _ProfileHistoricPageState extends State<ProfileHistoricPage> {
  ProfileController _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller ??= Provider.of<ProfileController>(context);
    //_controller.();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico de doações'),
      ),
      body: Container(),
    );
  }
}
