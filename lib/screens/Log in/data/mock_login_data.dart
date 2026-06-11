class UserModel {
  final String email;
  final String password;

  const UserModel({
    required this.email,
    required this.password,
  });
}

class MockLoginData {
  static const List<UserModel> users = [
    UserModel(
      email: "admin@gmail.com",
      password: "admin123",
    ),

    UserModel(
      email: "user@gmail.com",
      password: "user123",
    ),

    UserModel(
      email: "test@gmail.com",
      password: "test123",
    ),
  ];

  static const String otp = "1234";
}