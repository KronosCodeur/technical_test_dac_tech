bool passwordIsValid({required String password}) {
  final RegExp passwordRegex = RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$");
  return passwordRegex.hasMatch(password);
}
