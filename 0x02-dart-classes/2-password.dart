class Password {
  String password = '';

  bool isValid() {
    if (password.length < 8 || password.length > 16) {
      return false;
    }

    bool hasUpperCase = password.contains(RegExp(r'[A-Z]'));
    bool hasLowerCase = password.contains(RegExp(r'[a-z]'));
    bool hasNumbers = password.contains(RegExp(r'[0-9]'));

    return hasUpperCase && hasLowerCase && hasNumbers;
  }

  @override
  String toString() {
    return 'Your password is: $password';
  }
}
