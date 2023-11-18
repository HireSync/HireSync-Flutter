import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home_screen.dart';
import '../../models/organization.dart';

class OrganizationScreen extends StatefulWidget {
  const OrganizationScreen({Key? key, required this.organization})
      : super(key: key);
  final Organization organization;

  @override
  State<OrganizationScreen> createState() => _OrganizationScreenState();
}

class _OrganizationScreenState extends State<OrganizationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.organization.name),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Scaffold.of(context).openDrawer();
          },
        ),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.95, // Ancho del 70%
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                // Primera Sección
                flex: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: ElevatedButton(
                        onPressed: null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        child: const Text("+ New Recruitment"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: ElevatedButton(
                        onPressed: null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        child: const Text("See past recruitments"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: ElevatedButton(
                        onPressed: null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        child: const Text("See candidates history"),
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                // Segunda Sección
                flex: 0,
                child: Card(
                  elevation: 4.0,
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.work_outline),
                        title: const Text('Todays chedule'),
                      ),
                      Card(
                        margin: EdgeInsets.all(10),
                        child: ListTile(
                          title: const Text(
                              'Make new test for sofware developer candidates'),
                          subtitle: Text("9 am - 1 pm "),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Expanded(
                // Tercera Sección
                flex: 0,
                child: Column(
                  children: [
                    Card(
                      elevation: 4.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Text(
                              '2023-Business Administration UPC Interniship',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.0),
                            ),
                            subtitle: Text(
                              "Program Recruitment",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(1.0),
                            child: Text("Start date: 2023/04/12"),
                          ),
                          Padding(
                            padding: EdgeInsets.all(1.0),
                            child: Text("Status: Reviewing candidates"),
                          ),
                          Padding(
                            padding: EdgeInsets.all(1.0),
                            child: Text("Job post: Hiring open"),
                          ),
                          Padding(
                            padding: EdgeInsets.all(1.0),
                            child: Text("Organaizer: Jeffrey Ocampos"),
                          ),
                        ],
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
