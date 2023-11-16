import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 200,
              child: Image.asset(
                "lib/assets/perfil.jpg",
                width: 100,
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
