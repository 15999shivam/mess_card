bool ValidateEmail(String email) {
  RegExp regExp = new RegExp(
    r"^[a-zA-Z0-9_.+-]+@(?:(?:[a-zA-Z0-9-]+\.)?[a-zA-Z]+\.)?(chitkara.edu|chitkarauniversity.edu)\.in$",
    caseSensitive: false,
    multiLine: false,
  );
  return !(regExp.stringMatch(email) == null);
}

bool ValidateUsername(String username) {
  return username.length == 10;
}

bool ValidatePassword(String password) {
  RegExp regExp = new RegExp(
    r"(?=.*[a-z])(?=.*[A-z])(?=.*[@$!%*#?&])(?=.*[0-9])[a-zA-Z0-9@$!%*#?&]{8,}",
    caseSensitive: false,
    multiLine: false,
  );
  return !(regExp.stringMatch(password) == null) && password.length >= 8;
}
