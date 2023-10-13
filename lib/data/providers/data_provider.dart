import 'package:flutter/material.dart';
import 'package:technical_test_dac_tech/data/models/user.dart';
import 'package:technical_test_dac_tech/data/repositories/user_data_repository.dart';
import 'package:technical_test_dac_tech/utils/helpers/database_helper.dart';

class DataProvider extends ChangeNotifier{
  List<User> users = [];
  setUsersData()async{
    users = await UserDataRepository.getDataFromDatabase();
    notifyListeners();
  }
  removeUser(User user)async{
    users.remove(user);
    await DatabaseHelper().delete('users', where: 'id = ?', whereArgs: [user.id]);
    notifyListeners();
  }
  likeUser(User user)async{
    user.favorite = !user.favorite;
    await DatabaseHelper().update("users", user.toJson(),where: 'id = ?', whereArgs: [user.id]);
    notifyListeners();
  }
}