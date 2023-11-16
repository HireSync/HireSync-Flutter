import 'package:flutter/material.dart';

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
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
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
            const SizedBox(height: 5),
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
              decoration : InputDecoration(
                hintText: 'Password',
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
                        decoration: InputDecoration(
                          hintText: 'New Password',
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
                        obscureText: !isVisible,
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
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
          ],
        ),
      ),
    );
  }
}