import 'dart:convert';

class LocationModel {
  String name;
  String cep;
  String address;
  String city;
  String state;
  String uf;
  String neighborhood;
  String url;
  String phone;
  String number;
  String complemento;

  LocationModel({
    this.name,
    this.cep,
    this.address,
    this.city,
    this.state,
    this.uf,
    this.neighborhood,
    this.url,
    this.phone,
     this.number,
    this.complemento,
  });

  LocationModel copyWith({
    String name,
    String cep,
    String address,
    String city,
    String state,
    String uf,
    String neighborhood,
    String url,
    String phone,
    String number,
    String complemento,
  }) {
    return LocationModel(
      name: name ?? this.name,
      cep: cep ?? this.cep,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      uf: uf ?? this.uf,
      neighborhood: neighborhood ?? this.neighborhood,
      url: url ?? this.url,
      phone: phone ?? this.phone,
      number: number ?? this.number,
      complemento: complemento ?? this.complemento,
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
      'url': url,
      'phone': phone,
      'number': number,
      'complemento': complemento,
    };
  }

  static LocationModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return LocationModel(
      name: map['name'],
      cep: map['cep'],
      address: map['address'],
      city: map['city'],
      state: map['state'],
      uf: map['uf'],
      neighborhood: map['neighborhood'],
      url: map['url'],
      phone: map['phone'],
      number: map['number'],
      complemento: map['complemento'],
    );
  }

  String toJson() => json.encode(toMap());

  static LocationModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'LocationModel(name: $name, cep: $cep, address: $address, city: $city, state: $state, uf: $uf, neighborhood: $neighborhood, url: $url, phone: $phone, number: $number, complemento: $complemento)';
  }

  String getFullAddress({bool useUf = true}) {
    var completeAddress = address != null ? '${address ?? ''}' : '';
    completeAddress += number != null ? ', $number' : '';
    completeAddress += neighborhood != null ? ', $neighborhood' : '';
    completeAddress += cep != null ? ', $cep' : '';
    completeAddress += city != null ? ', $city' : '';
    if (useUf) completeAddress += uf != null ? ' / $uf' : '';
    return completeAddress;
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is LocationModel &&
        o.name == name &&
        o.cep == cep &&
        o.address == address &&
        o.city == city &&
        o.state == state &&
        o.uf == uf &&
        o.neighborhood == neighborhood &&
        o.url == url &&
        o.phone == phone &&
        o.number == number &&
        o.complemento == complemento;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        cep.hashCode ^
        address.hashCode ^
        city.hashCode ^
        state.hashCode ^
        uf.hashCode ^
        neighborhood.hashCode ^
        url.hashCode ^
        phone.hashCode ^
        number.hashCode ^
        complemento.hashCode;
  }
}
