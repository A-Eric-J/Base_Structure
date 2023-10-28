import 'package:base_structure_project/enums/appbar_state.dart';
import 'package:base_structure_project/enums/view_state.dart';
import 'package:base_structure_project/providers/search_provider.dart';
import 'package:base_structure_project/ui/shared/colors.dart';
import 'package:base_structure_project/ui/shared/text.dart';
import 'package:base_structure_project/ui/widgets/blog.dart';
import 'package:base_structure_project/ui/widgets/custom_appbar.dart';
import 'package:base_structure_project/ui/widgets/masked_text_controller.dart';
import 'package:base_structure_project/ui/widgets/search_bar.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var textController = MaskedTextController(mask: '*', length: 100);
  SearchProvider? searchProvider;

  @override
  void initState() {
    searchProvider = Provider.of(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Consumer<SearchProvider>(
            builder: (context, searchProvider, snapshot) {
          return Column(
            children: [
              const CustomAppBar(
                appBarState: AppBarState.backing,
                title: searchText,
              ),
              SearchBarWidget(
                textController: textController,
                borderColor: customTextFieldBorder,
                labelText: searchLabelText,
                onChanged: (text) {
                  searchProvider.searchClear();
                  searchProvider.setText(text);
                  if (text.isNotEmpty) {
                    /// your search api service
                  }
                },
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04, vertical: width * 0.0266),
              ),
              Expanded(
                child: Column(
                  children: [
                    if (searchProvider.searchModelState != ViewState.busy &&
                        searchProvider.searchModelList.isEmpty)
                      const PlaceHolderInEmptyState()
                    else
                      Expanded(
                        /// you should put your search result list here
                        child: Container(),
                      ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  @override
  void dispose() {
    textController.dispose();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      searchProvider!.searchClear();
    });
    super.dispose();
  }
}
