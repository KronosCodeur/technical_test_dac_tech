bool dateIsValid({required String date}) {
  final RegExp dateRegex =
      RegExp(r"^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/\d{4}$");
  return dateRegex.hasMatch(date);
}
