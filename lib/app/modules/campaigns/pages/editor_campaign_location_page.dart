import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_blood/app/modules/campaigns/controllers/campaign_controller.dart';
import 'package:my_blood/app/shared/helpers/validator.dart';
import 'package:my_blood/app/shared/widgets/custom_input_field.dart';
import 'package:my_blood/app/shared/widgets/date_input_field.dart';
import 'package:my_blood/app/shared/widgets/list_tile_header.dart';
import 'package:my_blood/app/shared/widgets/submit_button.dart';
import 'package:my_blood/app/themes/app_theme.dart';
import 'package:provider/provider.dart';

class EditorCampaignLocationPage extends StatefulWidget {
  @override
  _EditorCampaignLocationPageState createState() =>
      _EditorCampaignLocationPageState();
}

class _EditorCampaignLocationPageState
    extends State<EditorCampaignLocationPage> {
  final _formKey = new GlobalKey<FormState>();

  CampaignController _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller ??= Provider.of<CampaignController>(context);
  }

  _save() {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      //_controller.save();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova campanha'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Form(
          child: Column(
            children: <Widget>[
              ListTileHeader('Dados da campanha', leftPadding: 0.0),
              Observer(builder: (_) {
                return CustomInputField(
                  busy: _controller.busy,
                  label: 'Nome da campanha',
                  onSaved: (value) {},
                  validator: Validator.isNotEmptyText,
                );
              }),
              Observer(builder: (_) {
                return CustomInputField(
                  busy: _controller.busy,
                  label: 'Descrição',
                  onSaved: (value) {},
                  validator: Validator.isNotEmptyText,
                );
              }),
              Observer(builder: (_) {
                return CustomInputField(
                  busy: _controller.busy,
                  label: 'Tipo sanguíneo',
                  onSaved: (value) {},
                  validator: Validator.isNotEmptyText,
                );
              }),
              Observer(builder: (_) {
                return CustomInputField(
                  busy: _controller.busy,
                  label: 'Local para doação',
                  onSaved: (value) {},
                  validator: Validator.isNotEmptyText,
                );
              }),
              ListTileHeader('Prazo', leftPadding: 0.0),
              Observer(builder: (_) {
                return DateInputField(
                  busy: _controller.busy,
                  label: 'Data de início',
                  onSaved: (value) {},
                  validator: Validator.isNotEmptyText,
                );
              }),
              Observer(builder: (_) {
                return DateInputField(
                  busy: _controller.busy,
                  label: 'Data de término',
                  onSaved: (value) {},
                  validator: Validator.isNotEmptyText,
                );
              }),
              SizedBox(height: 20),
              Observer(
                builder: (_) {
                  return SubmitButton(
                    label: 'Registrar',
                    busy: _controller.busy,
                    firstColor: accentColor,
                    secondColor: primaryColor,
                    onTap: _save,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
