import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_blood/app/modules/profile/controllers/profile_controller.dart';
import 'package:my_blood/app/modules/profile/widgets/profile_header.dart';
import 'package:my_blood/app/shared/helpers/date_helper.dart';
import 'package:my_blood/app/shared/helpers/firebase_image_helper.dart';
import 'package:my_blood/app/shared/helpers/snackbar_helper.dart';
import 'package:my_blood/app/shared/widgets/custom_input_field.dart';
import 'package:my_blood/app/shared/widgets/button_input_field.dart';
import 'package:my_blood/app/shared/widgets/selector_input_field.dart';
import 'package:my_blood/app/shared/widgets/date_input_field.dart';
import 'package:provider/provider.dart';
import 'package:my_blood/app/shared/widgets/list_tile_header.dart';
import 'package:search_cep/search_cep.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = new GlobalKey<FormState>();

  final _birthDateController = TextEditingController();
  final _genderController = TextEditingController();
  final _bloodTypeController = TextEditingController();
  final _phoneController = TextEditingController();
  final _cepController = TextEditingController();
  final _addressController = TextEditingController();
  final _neighborhoodController = TextEditingController();
  final _stateController = TextEditingController();
  final _cityController = TextEditingController();

  ProfileController _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller ??= Provider.of<ProfileController>(context);
    _controller.getCurrentUser().then((user) {
      _birthDateController.text = user.birthDate;
      _genderController.text = user.gender;
      _bloodTypeController.text = user.bloodType;
      _phoneController.text = user.phone;
      _cepController.text = user.cep;
      _addressController.text = user.address;
      _neighborhoodController.text = user.neighborhood;
      _stateController.text = user.state;
      _cityController.text = user.city;
    });
  }

  @override
  void dispose() {
    _birthDateController.dispose();
    _genderController.dispose();
    _bloodTypeController.dispose();
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

  Future _changeImage() async {
    File image = await FirebaseImageHelper.getImage();
    if (image != null) {
      FirebaseImageHelper.uploadImage(
        image: image,
        onSuccess: (pictureUrl) {
          SnackBarHelper.showSuccessMessage(
            context,
            title: 'Sucesso',
            message: 'Upload da imagem concluído.',
          );

          print(pictureUrl);
          _controller.setPicture(pictureUrl);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil do doador'),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.history),
            onPressed: (){},
          ),
        ],
      ),
    
      floatingActionButton: Observer(builder: (_) {
        return FloatingActionButton(
          child: Icon(_controller.editable ? Icons.save : Icons.edit),
          onPressed: () {
            if (_controller.editable) {
              _save();
            } else {
              _controller.setEditable(true);
            }
          },
        );
      }),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Observer(builder: (_) {
                return ProfileHeader(
                  name: _controller.user.name,
                  email: _controller.user.email,
                  pictureUrl: _controller.user.picture,
                  lastDate: _controller.user.lastDonationDate ?? '--/--/----',
                  nextDate: _controller.user.lastDonationDate ??
                      DateHelper.format(DateTime.now()),
                  editable: _controller.editable,
                  onTapImage: _changeImage,
                );
              }),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Observer(builder: (_) {
                  return SelectorInputField(
                    busy: !_controller.editable,
                    controller: _bloodTypeController,
                    label: 'Tipo Sanguíneo',
                    items: ['A+', 'A-', 'B+', 'B-', 'AB-', 'AB+', 'O-', 'O+'],
                    onSaved: (value) {
                      _controller.user.bloodType = value;
                    },
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Observer(builder: (_) {
                  return DateInputField(
                    busy: !_controller.editable,
                    controller: _birthDateController,
                    textInputType: TextInputType.datetime,
                    label: 'Data de nascimento',
                    onSaved: (value) {
                      _controller.user.birthDate = value;
                    },
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Observer(builder: (_) {
                  return SelectorInputField(
                    busy: !_controller.editable,
                    controller: _genderController,
                    label: 'Sexo',
                    items: ['Feminino', 'Masculino'],
                    onSaved: (value) {
                      _controller.user.gender = value;
                    },
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Observer(builder: (_) {
                  return CustomInputField(
                    busy: !_controller.editable,
                    controller: _phoneController,
                    textInputType: TextInputType.phone,
                    label: 'Telefone',
                    onSaved: (value) {
                      _controller.user.phone = value;
                    },
                  );
                }),
              ),
              ListTileHeader('Localização'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Observer(builder: (_) {
                  return ButtonInputField(
                    busy: !_controller.editable,
                    controller: _cepController,
                    label: 'CEP',
                    textInputType: TextInputType.number,
                    onSaved: (value) {
                      _controller.user.cep = value;
                    },
                    onPressed: _onSearchCep,
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Observer(builder: (_) {
                  return CustomInputField(
                    busy: !_controller.editable,
                    controller: _addressController,
                    textInputType: TextInputType.text,
                    label: 'Endereço',
                    onSaved: (value) {
                      _controller.user.address = value;
                    },
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Observer(builder: (_) {
                  return CustomInputField(
                    busy: !_controller.editable,
                    controller: _neighborhoodController,
                    textInputType: TextInputType.text,
                    label: 'Bairro',
                    onSaved: (value) {
                      _controller.user.neighborhood = value;
                    },
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Observer(builder: (_) {
                  return CustomInputField(
                    busy: !_controller.editable,
                    controller: _stateController,
                    textInputType: TextInputType.text,
                    label: 'Estado',
                    onSaved: (value) {
                      _controller.user.state = value;
                    },
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Observer(builder: (_) {
                  return CustomInputField(
                    busy: !_controller.editable,
                    controller: _cityController,
                    label: 'Cidade',
                    textInputType: TextInputType.text,
                    onSaved: (value) {
                      _controller.user.city = value;
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
