import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technical_test_dac_tech/controllers/api_data_controller.dart';
import 'package:technical_test_dac_tech/data/models/user.dart';
import 'package:technical_test_dac_tech/data/providers/data_provider.dart';
import 'package:technical_test_dac_tech/utils/helpers/database_helper.dart';
import 'package:technical_test_dac_tech/utils/helpers/share_preference_helper.dart';
import 'package:technical_test_dac_tech/widgets/custom_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _getData();
  }
  _getData() async {
    var isNew = await SharedPreferencesHelper.getBoolValue("is_New_User") ?? true;
    if(isNew){
      List<User> apiData = await APIDataController.getApiData();
      for (var item in apiData) {
        await DatabaseHelper().insert("users", item.toJson());
      }
      await SharedPreferencesHelper.setBoolValue("is_New_User", false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Consumer<DataProvider>(builder: (context, dataProvider, child){
        return  GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20
          ),
          itemCount: dataProvider.users.length,
          itemBuilder: (context, index) {
            final user = dataProvider.users[index];
            return CustomCard(user: user);
          },
        );
      }),
    );
  }
}
