bool phoneRegex({required String phone}) {
  final RegExp regex = RegExp(r'^(?=.*\d)\d+$');
  if (regex.hasMatch(phone.replaceAll(' ', ''))) {
    return true;
  } else {
    return false;
  }
}
