class UserModel {
  String? userId;
  String? username;
  String? email;

  UserModel({this.userId, this.username ,this.email});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        userId: map['userId'],
        username: map['username'],
        email: map['email']
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'username': username,
      'email': email,
    };
  }
}