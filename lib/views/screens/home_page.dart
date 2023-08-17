import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Components/add_component.dart';
import '../Components/home_component.dart';
import '../Components/library_component.dart';
import '../Components/menu_component.dart';
import '../Components/quotes_component.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadUsername();
  }

  String _username = "";
  PageController pageController = PageController();
  Future<void> _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? "";
    });
  }

  int initialval = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const Text(''),
        title: FutureBuilder<String>(
          future: getUsername(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final username = snapshot.data;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Welcome  "),
                    Text(
                      "$username",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
              );
            }
          },
        ),
        elevation: 0,
      ),
      body: PageView(
        controller: pageController,
        pageSnapping: true,
        scrollDirection: Axis.horizontal,
        onPageChanged: (val) {
          setState(() {
            initialval = val;
          });
        },
        children: const [
          HomeComponent(),
          QuotesComponent(),
          AddComponent(),
          LibraryComponent(),
          MenuComponent(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          const NavigationDestination(
            icon: Icon(Icons.add_to_photos),
            label: "Quotes",
          ),
          NavigationDestination(
            icon: ElevatedButton(
              onPressed: () {
                Get.toNamed('/add_component');
              },
              child: const Icon(Icons.add),
            ),
            label: "",
          ),
          const NavigationDestination(
            icon: Icon(Icons.library_books),
            label: "Library",
          ),
          const NavigationDestination(
            icon: Icon(Icons.menu),
            label: "Menu",
          ),
        ],
        selectedIndex: initialval,
        onDestinationSelected: (val) {
          setState(() {
            initialval = val;
            pageController.animateToPage(
              initialval,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          });
        },
      ),
    );
  }
}

Future<String> getUsername() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('username') ?? '';
}
