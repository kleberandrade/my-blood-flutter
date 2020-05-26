import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_blood/app/modules/locations/controllers/location_controller.dart';
import 'package:my_blood/app/shared/helpers/snackbar_helper.dart';
import 'package:my_blood/app/shared/helpers/validator.dart';
import 'package:my_blood/app/shared/widgets/button_input_field.dart';
import 'package:my_blood/app/shared/widgets/custom_input_field.dart';
import 'package:my_blood/app/shared/widgets/list_tile_header.dart';
import 'package:my_blood/app/shared/widgets/submit_button.dart';
import 'package:my_blood/app/themes/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:search_cep/search_cep.dart';

class EditorLocationsPage extends StatefulWidget {
  @override
  _EditorLocationsPageState createState() => _EditorLocationsPageState();
}

class _EditorLocationsPageState extends State<EditorLocationsPage> {
  final _formKey = new GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _cepController = TextEditingController();
  final _addressController = TextEditingController();
  final _neighborhoodController = TextEditingController();
  final _stateController = TextEditingController();
  final _cityController = TextEditingController();
  final _ufController = TextEditingController();
  final _urlController = TextEditingController();
  final _phoneController = TextEditingController();

  LocationController _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller ??= Provider.of<LocationController>(context);
    _controller.clearLocation();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ufController.dispose();
    _urlController.dispose();
    _phoneController.dispose();
    _cepController.dispose();
    _addressController.dispose();
    _neighborhoodController.dispose();
    _stateController.dispose();
    _cityController.dispose();
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

  _onSearchCep(text) async {
    final infoCepJSON = await ViaCepSearchCep.searchInfoByCep(cep: text);
    if (infoCepJSON.searchCepError == null) {
      _addressController.text = infoCepJSON.logradouro;
      _neighborhoodController.text = infoCepJSON.bairro;
      _stateController.text = infoCepJSON.uf;
      _cityController.text = infoCepJSON.localidade;
    } else {
      SnackBarHelper.showFailureMessage(
        context,
        title: 'Erro',
        message: infoCepJSON.searchCepError.errorMessage ?? '',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo local de doação'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Observer(builder: (_) {
                return CustomInputField(
                  busy: _controller.busy,
                  controller: _nameController,
                  label: 'Nome do local de doação',
                  onSaved: (value) {
                    _controller.location.name = value;
                  },
                  validator: Validator.isNotEmptyText,
                );
              }),
              ListTileHeader('Contato', leftPadding: 0.0),
              Observer(builder: (_) {
                return CustomInputField(
                  busy: _controller.busy,
                  controller: _phoneController,
                  label: 'Telefone',
                  onSaved: (value) {
                    _controller.location.phone = value;
                  },
                );
              }),
              Observer(builder: (_) {
                return CustomInputField(
                  busy: _controller.busy,
                  controller: _urlController,
                  label: 'Site',
                  onSaved: (value) {
                    _controller.location.url = value;
                  },
                );
              }),
              ListTileHeader('Localização', leftPadding: 0.0),
              Observer(builder: (_) {
                return ButtonInputField(
                  busy: _controller.busy,
                  controller: _cepController,
                  label: 'CEP',
                  onSaved: (value) {
                    _controller.location.cep = value;
                  },
                  onPressed: _onSearchCep,
                );
              }),
              Observer(builder: (_) {
                return CustomInputField(
                  busy: _controller.busy,
                  controller: _addressController,
                  label: 'Endereço',
                  onSaved: (value) {
                    _controller.location.address = value;
                  },
                  validator: Validator.isNotEmptyText,
                );
              }),
              Observer(builder: (_) {
                return CustomInputField(
                  busy: _controller.busy,
                  controller: _neighborhoodController,
                  label: 'Bairro',
                  onSaved: (value) {
                    _controller.location.neighborhood = value;
                  },
                  validator: Validator.isNotEmptyText,
                );
              }),
              Observer(builder: (_) {
                return CustomInputField(
                  busy: _controller.busy,
                  controller: _cityController,
                  label: 'Cidade',
                  onSaved: (value) {
                    _controller.location.city = value;
                  },
                  validator: Validator.isNotEmptyText,
                );
              }),
              Observer(builder: (_) {
                return CustomInputField(
                  busy: _controller.busy,
                  controller: _stateController,
                  label: 'Estado',
                  onSaved: (value) {
                    _controller.location.state = value;
                  },
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
