class UserModel {
  String? id;
  String? name;
  final String email;
  String? password;

  UserModel({this.id, this.name, required this.email, this.password});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String,
    );
  }
}
