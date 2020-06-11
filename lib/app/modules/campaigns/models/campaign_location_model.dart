import 'dart:convert';

class CampaignLocationModel {
  String name;
  String description;
  String bloodType;
  String location;
  String startDate;
  String endDate;
  String photoPath;
  String imagePath;

  CampaignLocationModel({
    this.name,
    this.description,
    this.bloodType,
    this.location,
    this.startDate,
    this.endDate,
    this.photoPath,
    this.imagePath,
  });

  CampaignLocationModel copyWith({
    String name,
    String description,
    String bloodType,
    String location,
    String startDate,
    String endDate,
    String photoPath,
    String imagePath,
  }) {
    return CampaignLocationModel(
      name: name ?? this.name,
      description: description ?? this.description,
      bloodType: bloodType ?? this.bloodType,
      location: location ?? this.location,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      photoPath: photoPath ?? this.photoPath,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'bloodType': bloodType,
      'location': location,
      'startDate': startDate,
      'endDate': endDate,
      'photoPath': photoPath,
      'imagePath': imagePath,
    };
  }

  static CampaignLocationModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CampaignLocationModel(
      name: map['name'],
      description: map['description'],
      bloodType: map['bloodType'],
      location: map['location'],
      startDate: map['startDate'],
      endDate: map['endDate'],
      photoPath: map['photoPath'],
      imagePath: map['imagePath'],
    );
  }

  String toJson() => json.encode(toMap());

  static CampaignLocationModel fromJson(String source) =>
      fromMap(json.decode(source));

  @override
  String toString() {
    return 'CampaignLocationModel(name: $name, description: $description, bloodType: $bloodType, location: $location, startDate: $startDate, endDate: $endDate, photoPath: $photoPath, imagePath: $imagePath)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CampaignLocationModel &&
        o.name == name &&
        o.description == description &&
        o.bloodType == bloodType &&
        o.location == location &&
        o.startDate == startDate &&
        o.endDate == endDate &&
        o.photoPath == photoPath &&
        o.imagePath == imagePath;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        bloodType.hashCode ^
        location.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        photoPath.hashCode ^
        imagePath.hashCode;
  }
}
