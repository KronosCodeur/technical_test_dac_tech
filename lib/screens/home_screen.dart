import 'package:flutter/material.dart';
import 'package:technical_test_dac_tech/controllers/api_data_controller.dart';
import 'package:technical_test_dac_tech/data/models/user.dart';
import 'package:technical_test_dac_tech/utils/helpers/database_helper.dart';
import 'package:technical_test_dac_tech/utils/helpers/share_preference_helper.dart';
import 'package:technical_test_dac_tech/widgets/custom_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List dataFromAPI = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }
  List<User> users = [];
  _getData() async {

    var isNew = await SharedPreferencesHelper.getBoolValue("is_New_User") ?? true;
    if(isNew){
      List<User> apiData = await APIDataController.getApiData();
      setState(() {
        dataFromAPI = apiData;
      });
      for (var item in apiData) {
        await DatabaseHelper().insert("users", item.toJson());
      }
      await SharedPreferencesHelper.setBoolValue("is_New_User", false);
    }
    final List<Map<String, dynamic>> usersData =
    await DatabaseHelper().query('users');
    debugPrint(usersData.length.toString());
    setState(() {
      for(var user in usersData) {
        users.add(User.fromMap(user));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.65,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20
          ),
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return CustomCard(user: user,);
          },
        ),
      ),
    );
  }
}
