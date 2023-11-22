import 'package:flutter/material.dart';
import 'package:flutter_app/screens/login_screen.dart';
import 'package:flutter_app/services/user_service.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final UserService _userService = UserService(); // Instancia del servicio

  bool isVisible = false;
  bool isVisible1 = false;
  bool isButton1Selected = false;
  bool isButton2Selected = false;
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "lib/assets/logo_2.png",
                  width: 100,
                ),
                const SizedBox(height: 5),

                const ListTile(
                  title: Text(
                    textAlign: TextAlign.center,
                    "Sign up",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.all(8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.deepPurple.withOpacity(.3)),
                  child: TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "email is required";
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

                Container(
                  margin: EdgeInsets.all(8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.deepPurple.withOpacity(.3)),
                  child: TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "First Name is required";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      border: InputBorder.none,
                      hintText: "First Name",
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

                Container(
                  margin: const EdgeInsets.all(8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.deepPurple.withOpacity(.3)),
                  child: TextFormField(
                    controller: _confirmPasswordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "newpassword is required";
                      } else if (_confirmPasswordController.text !=
                          _passwordController.text) {
                        return "Passwords don't match";
                      }

                      return null;
                    },
                    obscureText: !isVisible1,
                    decoration: InputDecoration(
                        icon: Icon(Icons.lock),
                        border: InputBorder.none,
                        hintText: "Confirm Password",
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isVisible1 = !isVisible1;
                              });
                            },
                            icon: Icon(isVisible1
                                ? Icons.visibility
                                : Icons.visibility_off))),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    margin: const EdgeInsets.all(8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.deepPurple.withOpacity(.3)),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      maxLength: 9,
                      decoration: InputDecoration(
                        icon: Icon(Icons.phone),
                        border: InputBorder.none,
                        hintText: "Phone Number",
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                //login button
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.96,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.blue),
                  child: TextButton(
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          bool registered = await _userService.registerUser(
                              _emailController.text,
                              _nameController.text,
                              _passwordController.text);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Error'),
                                content: Text('Success registration'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: const Text(
                        "SIGN UP",
                        style: TextStyle(color: Colors.white),
                      )),
                ),

                //sing up botton
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account ?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: Text("LOGIN"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
