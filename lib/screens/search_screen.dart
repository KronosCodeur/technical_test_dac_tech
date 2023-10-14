import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:technical_test_dac_tech/data/providers/data_provider.dart';
import 'package:technical_test_dac_tech/data/providers/search_provider.dart';
import 'package:technical_test_dac_tech/themes/app_color_light.dart';
import 'package:technical_test_dac_tech/utils/helpers/radius_helper.dart';
import 'package:technical_test_dac_tech/utils/helpers/screen_size_helper.dart';
import 'package:technical_test_dac_tech/utils/helpers/text_helper.dart';
import 'package:technical_test_dac_tech/utils/input_decoration.dart';
import 'package:technical_test_dac_tech/widgets/search_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.background,
        body: Consumer2<DataProvider, SearchProvider>(
            builder: (context, dataProvider, searchProvider, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: TextFormField(
                        decoration: inputDecorationGrey(
                            hint: "Search",
                            context: context,
                            radius: AppRadius.radius50),
                        onChanged: (value) {
                          searchProvider.setParameter(value);
                          searchProvider.setResults(dataProvider.users
                              .where((user) => user
                                  .toJson()[searchProvider.filter]
                                  .toString()
                                  .toLowerCase()
                                  .contains(
                                      searchProvider.parameter.toLowerCase()))
                              .toList());
                        },
                        initialValue: searchProvider.parameter,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: () {
                          final RenderBox overlay = Overlay.of(context)
                              .context
                              .findRenderObject() as RenderBox;
                          final RenderBox cardBox =
                              context.findRenderObject() as RenderBox;
                          final Offset position = cardBox
                              .localToGlobal(Offset.zero, ancestor: overlay);
                          showMenu(
                              position: RelativeRect.fromLTRB(
                                position.dx + 50,
                                position.dy,
                                position.dx + cardBox.size.width - 500,
                                position.dy + cardBox.size.height,
                              ),
                              color: AppColor.white.withOpacity(0.9),
                              elevation: 3,
                              constraints: const BoxConstraints(
                                  maxWidth: 120, minHeight: 120),
                              context: context,
                              items: searchProvider.listOfSearchFilters.map((filter) {
                                return PopupMenuItem(
                                  onTap: () {
                                    searchProvider.setFilter(filter);
                                  },
                                  child: Text(
                                    filter,
                                    style: GoogleFonts.poppins(
                                      fontSize: AppText.titre4(context),
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.googleBlue,
                                    ),
                                  ),
                                );
                              }).toList());
                        },
                        child: Icon(
                          Icons.filter_list,
                          size: 30,
                          color: AppColor.googleRed,
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(Device.getDeviceScreenHeight(context, 90)),
                SizedBox(
                  width: Device.getScreenWidth(context),
                  height: Device.getScreenHeight(context) * 0.65,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        for (var item in searchProvider.searchResults)
                          SearchCard(user: item)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },),);
  }
}
