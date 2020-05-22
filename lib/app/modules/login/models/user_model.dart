import 'dart:convert';

class UserModel {
  String id;
  String name;
  String email;
  String picture;
  String role;
  String token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.picture,
    this.role,
    this.token,
  });

  UserModel copyWith({
    String id,
    String name,
    String email,
    String picture,
    String role,
    String token,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      picture: picture ?? this.picture,
      role: role ?? this.role,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'picture': picture,
      'role': role,
      'token': token,
    };
  }

  static UserModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      picture: map['picture'],
      role: map['role'],
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  static UserModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, picture: $picture, role: $role, token: $token)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UserModel &&
        o.id == id &&
        o.name == name &&
        o.email == email &&
        o.picture == picture &&
        o.role == role &&
        o.token == token;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        picture.hashCode ^
        role.hashCode ^
        token.hashCode;
  }
}
