import 'dart:convert';

import 'package:my_blood/app/shared/helpers/date_helper.dart';

class UserModel {
  String uid;
  String name;
  String email;
  String picture;
  String bloodType;
  String phone;
  String gender;
  String cep;
  String address;
  String city;
  String state;
  String neighborhood;
  String birthDate;
  String lastDonationDate;
  String number;
  String complemento;

  String dateToNextDonation() {
    if (lastDonationDate == null) return DateHelper.format(DateTime.now());

    final lastDate = DateHelper.parse(lastDonationDate);
    if (gender == null)
      return DateHelper.format(lastDate.add(Duration(days: 90)));

    if (gender == 'Masculino')
      return DateHelper.format(lastDate.add(Duration(days: 60)));
    else
      return DateHelper.format(lastDate.add(Duration(days: 90)));
  }

  UserModel({
    this.uid,
    this.name,
    this.email,
    this.picture,
    this.bloodType,
    this.phone,
    this.gender,
    this.cep,
    this.address,
    this.city,
    this.state,
    this.neighborhood,
    this.birthDate,
    this.lastDonationDate,
    this.number,
    this.complemento,
  });

  UserModel copyWith({
    String uid,
    String name,
    String email,
    String picture,
    String bloodType,
    String phone,
    String gender,
    String cep,
    String address,
    String city,
    String state,
    String neighborhood,
    String birthDate,
    String lastDonationDate,
    String number,
    String complemento,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      picture: picture ?? this.picture,
      bloodType: bloodType ?? this.bloodType,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      cep: cep ?? this.cep,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      neighborhood: neighborhood ?? this.neighborhood,
      birthDate: birthDate ?? this.birthDate,
      lastDonationDate: lastDonationDate ?? this.lastDonationDate,
      number: number ?? this.number,
      complemento: complemento ?? this.complemento,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'picture': picture,
      'bloodType': bloodType,
      'phone': phone,
      'gender': gender,
      'cep': cep,
      'address': address,
      'city': city,
      'state': state,
      'neighborhood': neighborhood,
      'birthDate': birthDate,
      'lastDonationDate': lastDonationDate,
      'number': number,
      'complemento': complemento,
    };
  }

  static UserModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserModel(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      picture: map['picture'],
      bloodType: map['bloodType'],
      phone: map['phone'],
      gender: map['gender'],
      cep: map['cep'],
      address: map['address'],
      city: map['city'],
      state: map['state'],
      neighborhood: map['neighborhood'],
      birthDate: map['birthDate'],
      lastDonationDate: map['lastDonationDate'],
      number: map['number'],
      complemento: map['complemento'],
    );
  }

  String toJson() => json.encode(toMap());

  static UserModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(uid: $uid, name: $name, email: $email, picture: $picture, bloodType: $bloodType, phone: $phone, gender: $gender, cep: $cep, address: $address, city: $city, state: $state, neighborhood: $neighborhood, birthDate: $birthDate, lastDonationDate: $lastDonationDate, number: $number, complemento: $complemento)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UserModel &&
        o.uid == uid &&
        o.name == name &&
        o.email == email &&
        o.picture == picture &&
        o.bloodType == bloodType &&
        o.phone == phone &&
        o.gender == gender &&
        o.cep == cep &&
        o.address == address &&
        o.city == city &&
        o.state == state &&
        o.neighborhood == neighborhood &&
        o.birthDate == birthDate &&
        o.lastDonationDate == lastDonationDate &&
        o.number == number &&
        o.complemento == complemento;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        name.hashCode ^
        email.hashCode ^
        picture.hashCode ^
        bloodType.hashCode ^
        phone.hashCode ^
        gender.hashCode ^
        cep.hashCode ^
        address.hashCode ^
        city.hashCode ^
        state.hashCode ^
        neighborhood.hashCode ^
        birthDate.hashCode ^
        lastDonationDate.hashCode ^
        number.hashCode ^
        complemento.hashCode;
  }
}
