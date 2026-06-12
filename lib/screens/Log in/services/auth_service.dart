import '../data/mock_login_data.dart';

class AuthService {
  static bool login(
      String email,
      String password,
      ) {
    return MockLoginData.users.any(
          (user) =>
      user["email"] == email &&
          user["password"] == password,
    );
  }

  static bool emailExists(
      String email,
      ) {
    return MockLoginData.users.any(
          (user) =>
      user["email"] == email,
    );
  }

  static bool verifyOtp(
      String otp,
      ) {
    return otp == MockLoginData.otp;
  }
}