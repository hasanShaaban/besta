class UserEntity {
  final String name;
  final String email;
  final String uID;

  UserEntity({required this.name, required this.email, required this.uID});

  toMap() => {'name': name, 'email': email, 'uID': uID};
}
