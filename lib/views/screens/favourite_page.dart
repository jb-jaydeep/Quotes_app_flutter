import 'package:flutter/material.dart';
import 'package:quotes_app_adv_flutter/utils/dbHelper.dart';

import '../../models/quotes_model.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  List<QuotesModel> allQuotes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: (favoritequotes.isNotEmpty)
          ? ListView.builder(
              itemBuilder: (context, i) => ListTile(
                title: Text("${favoritequotes[i]}"),
              ),
              itemCount: favoritequotes.length,
            )
          : Column(
              children: [
                Container(
                  height: 400,
                  width: 400,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/favourite.png",
                      ),
                    ),
                  ),
                ),
                const Text(
                  "This is where you will see your \n                 liked quotes.",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
    );
  }
}
