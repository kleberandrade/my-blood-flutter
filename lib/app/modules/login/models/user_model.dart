import 'dart:convert';

class UserModel {
  String uid;
  String name;
  String email;
  String picture;
  
  UserModel({
    this.uid,
    this.name,
    this.email,
    this.picture,
  });

  UserModel copyWith({
    String uid,
    String name,
    String email,
    String picture,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      picture: picture ?? this.picture,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'picture': picture,
    };
  }

  static UserModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserModel(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      picture: map['picture'],
    );
  }

  String toJson() => json.encode(toMap());

  static UserModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(uid: $uid, name: $name, email: $email, picture: $picture)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UserModel &&
        o.uid == uid &&
        o.name == name &&
        o.email == email &&
        o.picture == picture;
  }

  @override
  int get hashCode {
    return uid.hashCode ^ name.hashCode ^ email.hashCode ^ picture.hashCode;
  }
}
