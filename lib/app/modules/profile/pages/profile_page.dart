import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_blood/app/modules/profile/controllers/profile_controller.dart';
import 'package:my_blood/app/modules/profile/widgets/profile_header.dart';
import 'package:my_blood/app/shared/helpers/date_helper.dart';
import 'package:my_blood/app/shared/widgets/custom_input_field.dart';
import 'package:provider/provider.dart';
import 'package:my_blood/app/shared/widgets/list_tile_header.dart';

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
      _birthDateController..text = user.birthDate;
      _genderController..text = user.gender;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil do doador'),
        elevation: 0,
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
                );
              }),
              ListTileHeader('Informações importantes'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Observer(builder: (_) {
                  return CustomInputField(
                    busy: !_controller.editable,
                    controller: TextEditingController(
                      text: _controller.user.birthDate,
                    ),
                    label: 'Data de nascimento',
                    onSaved: (value) {
                      _controller.user.birthDate = value;
                    },
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Observer(builder: (_) {
                  return CustomInputField(
                    busy: !_controller.editable,
                    controller: TextEditingController(
                      text: _controller.user.gender,
                    ),
                    label: 'Sexo',
                    onSaved: (value) {
                      _controller.user.gender = value;
                    },
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Observer(builder: (_) {
                  return CustomInputField(
                    busy: !_controller.editable,
                    controller: TextEditingController(
                      text: _controller.user.bloodType,
                    ),
                    label: 'Tipo Sanguíneo',
                    onSaved: (value) {
                      _controller.user.bloodType = value;
                    },
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Observer(builder: (_) {
                  return CustomInputField(
                    busy: !_controller.editable,
                    controller: TextEditingController(
                      text: _controller.user.phone,
                    ),
                    label: 'Telefone',
                    onSaved: (value) {
                      _controller.user.phone = value;
                    },
                  );
                }),
              ),
              ListTileHeader('Informações opcionais'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Observer(builder: (_) {
                  return CustomInputField(
                    busy: !_controller.editable,
                    controller: TextEditingController(
                      text: _controller.user.cep,
                    ),
                    label: 'CEP',
                    onSaved: (value) {
                      _controller.user.cep = value;
                    },
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Observer(builder: (_) {
                  return CustomInputField(
                    busy: !_controller.editable,
                    controller: TextEditingController(
                      text: _controller.user.address,
                    ),
                    label: 'Endereço',
                    onSaved: (value) {
                      _controller.user.address = value;
                    },
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Observer(builder: (_) {
                  return CustomInputField(
                    busy: !_controller.editable,
                    controller: TextEditingController(
                      text: _controller.user.neighborhood,
                    ),
                    label: 'Bairro',
                    onSaved: (value) {
                      _controller.user.neighborhood = value;
                    },
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Observer(builder: (_) {
                  return CustomInputField(
                    busy: !_controller.editable,
                    controller: TextEditingController(
                      text: _controller.user.state,
                    ),
                    label: 'Estado',
                    onSaved: (value) {
                      _controller.user.state = value;
                    },
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Observer(builder: (_) {
                  return CustomInputField(
                    busy: !_controller.editable,
                    controller: TextEditingController(
                      text: _controller.user.city,
                    ),
                    label: 'Cidade',
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