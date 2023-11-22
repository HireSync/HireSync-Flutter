import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:flutter_app/services/organization_service.dart';

class CreateOrganization extends StatefulWidget {
  const CreateOrganization({Key? key}) : super(key: key);

  @override
  State<CreateOrganization> createState() => _CreateOrganizationState();
}

class _CreateOrganizationState extends State<CreateOrganization> {
  final _companyController = TextEditingController();
  String selectedPlan = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Organization'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Company Name:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _companyController,
              decoration: InputDecoration(
                hintText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Choose Plan:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedPlan = 'Premium';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: selectedPlan == 'Premium'
                        ? Colors.blue.shade900
                        : Colors.white,
                  ),
                  child: Text(
                    'Premium',
                    style: TextStyle(
                      color: selectedPlan == 'Premium'
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedPlan = 'Free';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: selectedPlan == 'Free'
                        ? Colors.blue.shade900
                        : Colors.white,
                  ),
                  child: Text(
                    'Free',
                    style: TextStyle(
                      color:
                          selectedPlan == 'Free' ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (_companyController.text.isNotEmpty &&
                      selectedPlan.isNotEmpty) {
                    await OrganizationService()
                        .createOrganization(_companyController.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Success:'),
                          content: const Text('Organization Created'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Error:'),
                          content: const Text(
                              'Please enter a name and choose a plan.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue.shade900,
                ),
                child: const Text(
                  'CREATE ORGANIZATION',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
