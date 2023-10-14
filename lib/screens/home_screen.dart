import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technical_test_dac_tech/data/providers/data_provider.dart';
import 'package:technical_test_dac_tech/themes/app_color_light.dart';
import 'package:technical_test_dac_tech/widgets/custom_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Consumer<DataProvider>(builder: (context, dataProvider, child) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20),
          itemCount: dataProvider.users.length,
          itemBuilder: (context, index) {
            final user =
                dataProvider.users[dataProvider.users.length - (index + 1)];
            return CustomCard(user: user);
          },
        );
      }),

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.googleRed,
        elevation: 5,
        child: Icon(
          Icons.add,
          color: AppColor.white,
          size: 40,
        ),
        onPressed: () {
          Navigator.pushNamed(context, "/add");
        },
      ),
    );
  }
}
