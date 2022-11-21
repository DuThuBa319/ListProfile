class Validators {
  static bool IsValidUsername(String Username) =>
      (Username.length > 6 && Username.contains('@'));
  static bool IsValidPassword(String Password) => (Password.length > 6);
}
