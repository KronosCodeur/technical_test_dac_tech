import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technical_test_dac_tech/data/providers/data_provider.dart';
import 'package:technical_test_dac_tech/widgets/custom_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

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
          itemCount: dataProvider.users.where((user) => user.favorite==true).toList().length,
          itemBuilder: (context, index) {
            final user = dataProvider.users.where((user) => user.favorite==true).toList()[index];
            return CustomCard(user: user);
          },
        );
      }),
    );
  }
}
