import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/screens/home_screen.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _newpasswordController = TextEditingController();
  TextEditingController _confirmpasswordController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  bool isVisible = false;
  bool isVisible1 = false;
  bool isVisible2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            CircleAvatar(
              radius: 52,
              backgroundImage: AssetImage("lib/assets/perfil.jpg")
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Acción cuando se presiona el botón
              },
              child: Text('Cambiar Foto de Perfil'),
            ),
            const SizedBox(height: 5),
            Text(
              'Jeffrey Ocampos',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              )
            ),
            const SizedBox(height: 15),
            Text('Name'),
            const SizedBox(height: 10),
            TextField(
              controller: _nameController,
              decoration : InputDecoration(
                hintText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text('Email'),            
            TextField(
              controller: _emailController,
              decoration : InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text('Password'),
            TextField(
              controller: _passwordController,
              obscureText: !isVisible2,
              decoration : InputDecoration(
                hintText: 'Password',
                suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      isVisible2=!isVisible2;
                    });
                  },
                  icon: Icon(
                   isVisible2 ? Icons.visibility : Icons.visibility_off
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('New Password'),
                      TextField(
                        controller: _newpasswordController,
                        obscureText: !isVisible,
                        decoration: InputDecoration(
                          hintText: 'New Password',
                          suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                isVisible=!isVisible;
                              });
                            },
                            icon: Icon(
                              isVisible ? Icons.visibility : Icons.visibility_off
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Confirm Password'),
                      TextField(
                        controller: _confirmpasswordController,
                        obscureText: !isVisible1,
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                isVisible1=!isVisible1;
                              });
                            },
                            icon: Icon(
                              isVisible1 ? Icons.visibility : Icons.visibility_off
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),
            Text('Phone Number'),
            const SizedBox(height: 10),
            TextField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLength: 9,
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
            ),
            const SizedBox(height: 20),
            Row(children: [
              Expanded(
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
                }, child: Text('Go Back Home')),
              ),
              SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(onPressed: (){
                }, child: Text('Save Changes')),
              )
            ],)
          ],
        ),
      ),
    );
  }
}