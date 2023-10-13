import 'package:flutter/material.dart';
import 'package:technical_test_dac_tech/data/models/user.dart';
import 'package:technical_test_dac_tech/utils/helpers/database_helper.dart';

class UserDataRepository {
  static getDataFromDatabase() async {
    List<User> users = [];
    final List<Map<String, dynamic>> usersData =
        await DatabaseHelper().query('users');
    debugPrint(usersData.length.toString());

    for (var user in usersData) {
      users.add(User.fromMap(user));
    }
    return users;
  }
}
