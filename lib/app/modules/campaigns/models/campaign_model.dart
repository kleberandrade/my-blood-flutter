import 'dart:convert';

class CampaignModel {
  String name;
  String cep;
  String address;
  String city;
  String state;
  String uf;
  String neighborhood;

  CampaignModel({
    this.name,
    this.cep,
    this.address,
    this.city,
    this.state,
    this.uf,
    this.neighborhood,
  });

  CampaignModel copyWith({
    String name,
    String cep,
    String address,
    String city,
    String state,
    String uf,
    String neighborhood,
  }) {
    return CampaignModel(
      name: name ?? this.name,
      cep: cep ?? this.cep,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      uf: uf ?? this.uf,
      neighborhood: neighborhood ?? this.neighborhood,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'cep': cep,
      'address': address,
      'city': city,
      'state': state,
      'uf': uf,
      'neighborhood': neighborhood,
    };
  }

  static CampaignModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CampaignModel(
      name: map['name'],
      cep: map['cep'],
      address: map['address'],
      city: map['city'],
      state: map['state'],
      uf: map['uf'],
      neighborhood: map['neighborhood'],
    );
  }

  String toJson() => json.encode(toMap());

  static CampaignModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'CampaignModel(name: $name, cep: $cep, address: $address, city: $city, state: $state, uf: $uf, neighborhood: $neighborhood)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CampaignModel &&
        o.name == name &&
        o.cep == cep &&
        o.address == address &&
        o.city == city &&
        o.state == state &&
        o.uf == uf &&
        o.neighborhood == neighborhood;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        cep.hashCode ^
        address.hashCode ^
        city.hashCode ^
        state.hashCode ^
        uf.hashCode ^
        neighborhood.hashCode;
  }
}
