import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/organization.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/screens/create_organization_screen.dart';
import 'package:flutter_app/screens/login_screen.dart';
import 'package:flutter_app/screens/profile.dart';
import 'package:flutter_app/screens/recluters_screens/organization_scree.dart';
import 'package:flutter_app/services/organization_service.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final OrganizationService _organizationService = OrganizationService();
  late User currentUser;
 

  List<Map<String, dynamic>>? organizations;

  @override
  void initState() {
    super.initState();
    _loadOrganizations();
  }

  Future<void> _loadOrganizations() async {
    final List<Map<String, dynamic>>? orgs =
        await _organizationService.getAllOrganizations();
    if (orgs != null) {
      setState(() {
        organizations = orgs;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Good Morning'),
        backgroundColor: Colors.blue.shade700,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              "LET'S START!",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            const Text(
              "CHOOSE YOUR ORGANIZATION",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateOrganization()));
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue.shade900,
              ),
              child: const Text(
                'CREATE NEW ORGANIZATION',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            if (organizations != null)
              Column(
                children: organizations!.map((organization) {
                  return Card(
                    color: Colors.blue.shade900,
                    child: ListTile(
                      title: Text(
                        organization['name'] ?? '',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }).toList(),
              )
            else
              const CircularProgressIndicator(),
          ],
        ),
      ),
      drawer: NavigationDrawer(),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHearder(context),
              buildMenu(context),
            ],
          ),
        ),
      );

  Widget buildHearder(BuildContext context) => Material(
        color: Colors.blue.shade700,
        child: InkWell(
          onTap: () {
             Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Profile(user:User(id: 0,email: '', firstName: '', password: '', phone: 1))),
            );
          },
          child: Container(
            padding: EdgeInsets.only(
              top: 24 + MediaQuery.of(context).padding.top,
              bottom: 24,
            ),
            child: Column(children: const [
              CircleAvatar(
                radius: 52,
                backgroundImage: AssetImage("lib/assets/avatar.jpg"),
              ),
              SizedBox(
                height: 12,
              ),
              Text(' Testigos de Vue',
                  style: TextStyle(fontSize: 25, color: Colors.white)),
              Text('Jeffrey Ocampos ',
                  style: TextStyle(fontSize: 25, color: Colors.white))
            ]),
          ),
        ),
      );

  Widget buildMenu(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16,
          children: [
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Home'),
              onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomePage())),
            ),
            ListTile(
              leading: const Icon(Icons.business_outlined),
              title: const Text('Organizations'),
              onTap:  () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const OrganizationScreen(organization: Organization(id:1,name:'organizacion'),))),
            ),
            ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Log Out'),
                onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen())))
          ],
        ),
      );
}
