import 'package:flutter/material.dart';

import '../screens/creations_page.dart';
import '../screens/favourite_page.dart';

class LibraryComponent extends StatefulWidget {
  const LibraryComponent({Key? key}) : super(key: key);

  @override
  State<LibraryComponent> createState() => _LibraryComponentState();
}

class _LibraryComponentState extends State<LibraryComponent>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 0,
        bottom: TabBar(
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 3,
          controller: tabController,
          tabs: const [
            Tab(
              text: "Favourites",
            ),
            Tab(
              text: "Creations",
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 18,
            child: TabBarView(
              controller: tabController,
              children: const [
                FavouritePage(),
                CreationsPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
