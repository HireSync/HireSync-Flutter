import 'package:flutter/material.dart';
import 'package:flutter_app/screens/signup_screen.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:flutter_app/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isVisible = false;

  initialize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');

    if (email != null) {
      _emailController.text = email;
    }
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  navigateTo() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const HomePage();
    }));
  }

  authenticate() async {
    final isLogged = await UserService()
        .authenticate(_emailController.text, _passwordController.text);
    if (isLogged) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', _emailController.text);
      await prefs.setBool('isLogged', true);
      navigateTo();
    }
  }

  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Image.asset(
                "lib/assets/logo_2.png",
                width: 210,
              ),
              const SizedBox(height: 15),

              //username
              Container(
                margin: const EdgeInsets.all(8),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.deepPurple.withOpacity(.3)),
                child: TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "username is required";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    border: InputBorder.none,
                    hintText: "Email",
                  ),
                ),
              ),

              //passsword
              Container(
                margin: const EdgeInsets.all(8),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.deepPurple.withOpacity(.3)),
                child: TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "password is required";
                    }
                    return null;
                  },
                  obscureText: !isVisible,
                  decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      border: InputBorder.none,
                      hintText: "Password",
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          icon: Icon(isVisible
                              ? Icons.visibility
                              : Icons.visibility_off))),
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              //login button
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width * .9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: Colors.blue),
                child: TextButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        authenticate();
                      }
                    },
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(color: Colors.white),
                    )),
              ),

              //sing up botton
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account ?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()));
                      },
                      child: Text("SIGN UP"))
                ],
              )
            ],
          ),
        ),
      ),
    )));
  }
}
