import 'dart:convert';

class CampaignPersonModel {
  String name;
  String bloodType;
  String endDate;
  String location;
  String hospitalization;
  String photoPath;
  String imagePath;

  CampaignPersonModel({
    this.name,
    this.bloodType,
    this.endDate,
    this.location,
    this.hospitalization,
    this.photoPath,
    this.imagePath
  });

  CampaignPersonModel copyWith({
    String name,
    String bloodType,
    String endDate,
    String localization,
    String hospitalization,
    String photoPath,
    String imagePath,
  }) {
    return CampaignPersonModel(
      name: name ?? this.name,
      bloodType: bloodType ?? this.bloodType,
      endDate: endDate ?? this.endDate,
      location: localization ?? this.location,
      hospitalization: hospitalization ?? this.hospitalization,
      photoPath: photoPath ?? this.photoPath,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'bloodType': bloodType,
      'endDate': endDate,
      'localization': location,
      'hospitalization': hospitalization,
      'photoPath': photoPath,
      'imagePath': imagePath,
    };
  }

  static CampaignPersonModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CampaignPersonModel(
      name: map['name'],
      bloodType: map['bloodType'],
      endDate: map['endDate'],
      location: map['localization'],
      hospitalization: map['hospitalization'],
      photoPath: map['photoPath'],
      imagePath: map['imagePath'],
    );
  }

  String toJson() => json.encode(toMap());

  static CampaignPersonModel fromJson(String source) =>
      fromMap(json.decode(source));

  @override
  String toString() {
    return 'CampaignPersonModel(name: $name, bloodType: $bloodType, endDate: $endDate, localization: $location, hospitalization: $hospitalization, photoPath: $photoPath, imagePath: $imagePath)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CampaignPersonModel &&
        o.name == name &&
        o.bloodType == bloodType &&
        o.endDate == endDate &&
        o.location == location &&
        o.hospitalization == hospitalization &&
        o.photoPath == photoPath && 
        o.imagePath == imagePath;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        bloodType.hashCode ^
        endDate.hashCode ^
        location.hashCode ^
        hospitalization.hashCode ^
        photoPath.hashCode ^
        imagePath.hashCode;
  }
}
