bool emailIsValid({required String email}) {
  final RegExp emailRegex = RegExp(r"^.+@[a-zA-Z]+\.[a-zA-Z]+(\.?[a-zA-Z]+)$");
  return emailRegex.hasMatch(email);
}
