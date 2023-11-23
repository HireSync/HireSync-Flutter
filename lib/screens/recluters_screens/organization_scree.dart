import 'package:flutter/material.dart';
import 'package:flutter_app/screens/create_recruitment.dart';
import 'package:flutter_app/screens/home_screen.dart';
import '../../models/organization.dart';

//import 'package:flutter_app/screens/home_screen.dart' as home;

import 'package:flutter/material.dart';

import 'recruiments_screen.dart';

class OrganizationScreen extends StatefulWidget {
  const OrganizationScreen({
    Key? key,
    this.organization,
  }) : super(key: key);
  final Map<String, dynamic>? organization;

  @override
  State<OrganizationScreen> createState() => _OrganizationScreenState();
}

class _OrganizationScreenState extends State<OrganizationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.organization?['name'] ?? '',
          //"Organization",
          style: const TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.blue.shade700,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.95,
            child: Column(
              children: [
                FirstSectionWidget(organization: widget.organization),
                const SecondSectionWidget(
                    title: "Make new test for software developer candidates",
                    time: "9am - 1pm"),
                Column(
                  children: [
                    for (var recruitment
                        in widget.organization?['recruitments'] ?? [])
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  RecruitmentScreen(recruitment: recruitment),
                            ),
                          );
                        },
                        child: ThirdSectionCardWidget(
                          date: recruitment['startdate'] ?? "",
                          title: recruitment['name'] ?? "",
                          status: recruitment['status'] ?? "",
                          jobpost: recruitment['jobpost'] ?? "",
                          organizer: recruitment['organizer'] ?? "",
                        ),
                      ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      drawer: const NavigationDrawerHome(),
    );
  }
}

class FirstSectionWidget extends StatelessWidget {
  final Map<String, dynamic>? organization;
  const FirstSectionWidget({Key? key, required this.organization})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateRecruitment(
                    organization: organization,
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              side: const BorderSide(color: Color(0xFF3066BE), width: 2),
            ),
            child: const Text(
              "+ New Recruitment",
              style: TextStyle(color: Color(0xFF3066BE)),
            ),
          ),
          ElevatedButton(
            onPressed: null,
            style: ElevatedButton.styleFrom(
              side: const BorderSide(color: Color(0xFF3066BE), width: 2),
            ),
            child: const Text(
              "See past recruitments",
              style: TextStyle(color: Color(0xFF3066BE)),
            ),
          ),
          ElevatedButton(
            onPressed: null,
            style: ElevatedButton.styleFrom(
              side: const BorderSide(color: Color(0xFF3066BE), width: 2),
            ),
            child: const Text(
              "See candidates history",
              style: TextStyle(color: Color(0xFF3066BE)),
            ),
          ),
        ],
      ),
    );
  }
}

class SecondSectionWidget extends StatelessWidget {
  const SecondSectionWidget(
      {super.key, required this.title, required this.time});
  final String title;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
            child: const ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 100.0, vertical: 3.0),
              leading: Icon(Icons.work_outline),
              title: Text(
                'Todays chedule',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.13,
            width: MediaQuery.of(context).size.width * 0.78,
            child: Card(
              margin: const EdgeInsets.all(3),
              color: Colors.red,
              child: ListTile(
                title: Text(title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    )),
                subtitle: Text(time,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ThirdSectionCardWidget extends StatelessWidget {
  const ThirdSectionCardWidget(
      {super.key,
      required this.title,
      required this.date,
      required this.status,
      required this.jobpost,
      required this.organizer});

  final String title;
  final String date;
  final String status;
  final String jobpost;
  final String organizer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.left,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Status: ',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight
                          .bold, // Color azul para la palabra "Organizer"
                      fontSize: 15,
                    ),
                    children: [
                      TextSpan(
                        text: status,
                        style: const TextStyle(
                          color: Colors
                              .black, // Color negro para el resto del texto
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Start date: ',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight
                          .bold, // Color azul para la palabra "Organizer"
                      fontSize: 15,
                    ),
                    children: [
                      TextSpan(
                        text: date,
                        style: const TextStyle(
                          color: Colors
                              .black, // Color negro para el resto del texto
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Job post: ',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight
                          .bold, // Color azul para la palabra "Organizer"
                      fontSize: 15,
                    ),
                    children: [
                      TextSpan(
                        text: jobpost,
                        style: const TextStyle(
                          color: Colors
                              .black, // Color negro para el resto del texto
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Organizer: ',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight
                          .bold, // Color azul para la palabra "Organizer"
                      fontSize: 15,
                    ),
                    children: [
                      TextSpan(
                        text: organizer,
                        style: const TextStyle(
                          color: Colors
                              .black, // Color negro para el resto del texto
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
