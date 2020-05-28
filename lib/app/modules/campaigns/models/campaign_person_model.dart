import 'dart:convert';

class CampaignPersonModel {
  String name;
  String bloodType;
  String endDate;
  String localization;
  String hospitalization;

  CampaignPersonModel({
    this.name,
    this.bloodType,
    this.endDate,
    this.localization,
    this.hospitalization,
  });

  CampaignPersonModel copyWith({
    String name,
    String bloodType,
    String endDate,
    String localization,
    String hospitalization,
  }) {
    return CampaignPersonModel(
      name: name ?? this.name,
      bloodType: bloodType ?? this.bloodType,
      endDate: endDate ?? this.endDate,
      localization: localization ?? this.localization,
      hospitalization: hospitalization ?? this.hospitalization,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'bloodType': bloodType,
      'endDate': endDate,
      'localization': localization,
      'hospitalization': hospitalization,
    };
  }

  static CampaignPersonModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CampaignPersonModel(
      name: map['name'],
      bloodType: map['bloodType'],
      endDate: map['endDate'],
      localization: map['localization'],
      hospitalization: map['hospitalization'],
    );
  }

  String toJson() => json.encode(toMap());

  static CampaignPersonModel fromJson(String source) =>
      fromMap(json.decode(source));

  @override
  String toString() {
    return 'CampaignPersonModel(name: $name, bloodType: $bloodType, endDate: $endDate, localization: $localization, hospitalization: $hospitalization)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CampaignPersonModel &&
        o.name == name &&
        o.bloodType == bloodType &&
        o.endDate == endDate &&
        o.localization == localization &&
        o.hospitalization == hospitalization;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        bloodType.hashCode ^
        endDate.hashCode ^
        localization.hashCode ^
        hospitalization.hashCode;
  }
}
