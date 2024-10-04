class Password {
  String _password = '';

  Password({required String password}) {
    _password = password;
  }

  bool isValid() {
    if (_password.length < 8 || _password.length > 16) {
      return false;
    }

    bool hasUpperCase = _password.contains(RegExp(r'[A-Z]'));
    bool hasLowerCase = _password.contains(RegExp(r'[a-z]'));
    bool hasNumbers = _password.contains(RegExp(r'[0-9]'));

    return hasUpperCase && hasLowerCase && hasNumbers;
  }

    @override
  String toString() {
    return 'Your password is: $_password';
  }
}
