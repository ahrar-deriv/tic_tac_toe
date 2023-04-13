import 'package:flutter/material.dart';
import 'package:tic_tac_toe/flutter/presentation/pages/landing_page.dart';
import 'package:tic_tac_toe/flutter/theme_helper/color_helper.dart';
import 'package:tic_tac_toe/flutter/theme_helper/dimention_helper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  darkGrey,
                  darkGrey,
                  red,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: side40,
                ),
                Hero(
                  tag: 'logo',
                  child: Image.asset(
                    'asset/images/logo.png',
                    height: 164,
                    width: 164,
                    // opacity: const AlwaysStoppedAnimation(0.15),
                  ),
                ),
                const SizedBox(
                  height: side10,
                ),
                const Text('Deriv BeSquare'),
                const SizedBox(
                  height: side50,
                ),
                const Text(
                  'Login to app inorder to access your previous game data',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: side30,
                ),
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: lightPink),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: lightPink),
                    ),
                    border: OutlineInputBorder(),
                    hintText: 'Username',
                    hintStyle: TextStyle(
                      color: Color(0xaaF6E9E9),
                    ),
                  ),
                  cursorColor: lightPink,
                ),
                const SizedBox(
                  height: side20,
                ),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: lightPink),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: lightPink),
                    ),
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Color(0xaaF6E9E9),
                    ),
                  ),
                  cursorColor: lightPink,
                ),
                const SizedBox(
                  height: side20,
                ),
                OutlinedButton(
                  onPressed: () {
                    /// Todo : Save username in sharedPreference and server
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: ((context) => const LandingPage()),
                      ),
                    );
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 0.8,
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
