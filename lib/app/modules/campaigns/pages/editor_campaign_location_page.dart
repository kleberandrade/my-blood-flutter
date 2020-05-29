import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_blood/app/modules/campaigns/controllers/campaign_location_controller.dart';
import 'package:my_blood/app/shared/helpers/validator.dart';
import 'package:my_blood/app/shared/widgets/forms/blood_type_input_field.dart';
import 'package:my_blood/app/shared/widgets/forms/custom_input_field.dart';
import 'package:my_blood/app/shared/widgets/forms/date_input_field.dart';
import 'package:my_blood/app/shared/widgets/forms/list_tile_header.dart';
import 'package:my_blood/app/shared/widgets/forms/submit_button.dart';
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

  CampaignLocationController _controller;

  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  final _bloodTypeController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller ??= Provider.of<CampaignLocationController>(context);
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    _bloodTypeController.dispose();
    super.dispose();
  }

  _save() {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      _controller.save();
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
          key: _formKey,
          child: Column(
            children: <Widget>[
              ListTileHeader('Dados da campanha', leftPadding: 0.0),
              Observer(builder: (_) {
                return CustomInputField(
                  busy: _controller.busy,
                  label: 'Nome da campanha',
                  onSaved: (value) {
                    _controller.campaign.name = value;
                  },
                  validator: Validator.isNotEmptyText,
                );
              }),
              Observer(builder: (_) {
                return CustomInputField(
                  busy: _controller.busy,
                  label: 'Descrição',
                  onSaved: (value) {
                    _controller.campaign.description = value;
                  },
                  validator: Validator.isNotEmptyText,
                );
              }),
              Observer(builder: (_) {
                return BloodTypeInputField(
                  busy: _controller.busy,
                  controller: _bloodTypeController,
                  label: 'Tipo sanguíneo',
                  onSaved: (value) {
                    _controller.campaign.bloodType = value;
                  },
                );
              }),
              Observer(builder: (_) {
                return CustomInputField(
                  busy: _controller.busy,
                  label: 'Local para doação',
                  onSaved: (value) {
                    _controller.campaign.location = value;
                  },
                  validator: Validator.isNotEmptyText,
                );
              }),
              ListTileHeader('Prazo', leftPadding: 0.0),
              Observer(builder: (_) {
                return DateInputField(
                  busy: _controller.busy,
                  controller: _startDateController,
                  textInputType: TextInputType.datetime,
                  label: 'Data de início',
                  onSaved: (value) {
                    _controller.campaign.startDate = value;
                  },
                );
              }),
              Observer(builder: (_) {
                return DateInputField(
                  busy: _controller.busy,
                  controller: _endDateController,
                  textInputType: TextInputType.datetime,
                  label: 'Data de término',
                  onSaved: (value) {
                    _controller.campaign.endDate = value;
                  },
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
