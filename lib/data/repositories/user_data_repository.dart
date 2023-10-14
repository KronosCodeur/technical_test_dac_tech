import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:technical_test_dac_tech/controllers/api_data_controller.dart';
import 'package:technical_test_dac_tech/data/models/user.dart';
import 'package:technical_test_dac_tech/utils/helpers/database_helper.dart';

class UserRepository {
  static getDataFromDatabase() async {
    await DatabaseHelper().run();
    List<User> users = [];
    List<Map<String, dynamic>> usersData =
        await DatabaseHelper().query('users');
    debugPrint(usersData.length.toString());
    if (usersData.isEmpty || usersData.length<10) {
      List<User> apiData = await APIDataController.getApiData();
      for (var item in apiData) {
        await DatabaseHelper().insert("users", item.toJson());
      }
    }
    usersData = await DatabaseHelper().query('users');
    debugPrint(usersData.length.toString());
    for (var user in usersData) {
      users.add(User.fromMap(user));
    }
    return users;
  }
  static Future getImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    return pickedFile!.path;
  }
}
