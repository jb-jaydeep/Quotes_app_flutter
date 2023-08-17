// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// class LogInScreen extends StatefulWidget {
//   const LogInScreen({super.key});
//
//   @override
//   State<LogInScreen> createState() => _LogInScreenState();
// }
//
// class _LogInScreenState extends State<LogInScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           alignment: Alignment.center,
//           height: Get.height,
//           width: Get.width,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage("assets/images/wlog.jpg"),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "LogIn or SignUp",
//                 style: TextStyle(
//                   fontSize: 21,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoggedIn = false;
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    });
  }

  Future<void> _handleLogin() async {
    // Here you can perform actual login logic, e.g., sending data to a server.
    // For simplicity, we'll just assume successful login for now.

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('username', _usernameController.text);

    setState(() {
      _isLoggedIn = true;
    });
  }

  bool showPassword = false;
  bool pass = false;
  @override
  Widget build(BuildContext context) {
    if (_isLoggedIn) {
      return const HomePage();
    } else {
      // Return your login form.
      return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: Get.height * 0.2,
                  child: const Image(
                    image: AssetImage("assets/images/login.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  "Log In Now",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Get.height * 0.05,
                  ),
                ),
                Text(
                  "Please Login to Continue Using Our App",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: Get.height * 0.02,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                TextFormField(
                  controller: _usernameController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter your username Please...";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: !showPassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter your Password Please...";
                    } else if (val.length >= 8) {
                      return "Enter a Valid password length must be 8 ";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CheckboxListTile(
                  title: const Text("Show Password"),
                  value: pass,
                  onChanged: (newValue) {
                    setState(() {
                      pass = newValue!;
                      showPassword = newValue;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ), //  <-- leading Checkbox
                ElevatedButton(
                  onPressed: _handleLogin,
                  child: const Text("Login"),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Text("Don't have an Account?    ")),
                    Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        child: Image(
                          image: AssetImage("assets/images/fb.png"),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.05,
                      ),
                      const CircleAvatar(
                        radius: 20,
                        child: Image(
                          image: AssetImage("assets/images/g.png"),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.05,
                      ),
                      const CircleAvatar(
                        radius: 20,
                        child: Image(
                          image: AssetImage("assets/images/t.png"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
