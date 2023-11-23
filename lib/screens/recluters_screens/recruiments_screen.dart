import 'package:flutter/material.dart';

class RecruitmentScreen extends StatefulWidget {
  const RecruitmentScreen({super.key, this.recruitment});
  final Map<String, dynamic>? recruitment;

  @override
  State<RecruitmentScreen> createState() => _RecruitmentScreenState();
}

class _RecruitmentScreenState extends State<RecruitmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.recruitment?['name'] ?? '',
          style: const TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.blue.shade700,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Scaffold.of(context).openDrawer();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.95,
            child: Column(
              children: [
                RecruitmentCard(
                    position: widget.recruitment!['position'] ?? "",
                    description: widget.recruitment?['description'] ?? "",
                    applicationDate:
                        widget.recruitment?['applicationDate'] ?? "",
                    location: widget.recruitment?['location'] ?? "",
                    salary: widget.recruitment?['salary'] ?? "",
                    contractType: widget.recruitment?['contractType'] ?? "",
                    requirements: widget.recruitment?['requirements'] ?? "",
                    email: widget.recruitment?['email'] ?? "",
                    phone: widget.recruitment?['phone'] ?? "",
                    status: widget.recruitment?['status'] ?? "",
                    jobpost: widget.recruitment?['jobpost'] ?? "",
                    organizer: widget.recruitment?['organizer'] ?? ""),
                const RecruitmentButtons(),
                RecruitmentPostulation(recruitment: widget.recruitment),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RecruitmentCard extends StatelessWidget {
  const RecruitmentCard(
      {super.key,
      required this.position,
      required this.description,
      required this.applicationDate,
      required this.location,
      required this.salary,
      required this.contractType,
      required this.requirements,
      required this.email,
      required this.phone,
      required this.status,
      required this.jobpost,
      required this.organizer});

  final String position;
  final String description;
  final String applicationDate;
  final String location;
  final String salary;
  final String contractType;
  final String requirements;
  final String email;
  final String phone;
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
                RichText(
                  text: TextSpan(
                    text: 'Position: ',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight
                          .bold, // Color azul para la palabra "Organizer"
                      fontSize: 15,
                    ),
                    children: [
                      TextSpan(
                        text: position,
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
                    text: 'Description: ',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight
                          .bold, // Color azul para la palabra "Organizer"
                      fontSize: 15,
                    ),
                    children: [
                      TextSpan(
                        text: description,
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
                    text: 'Location: ',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight
                          .bold, // Color azul para la palabra "Organizer"
                      fontSize: 15,
                    ),
                    children: [
                      TextSpan(
                        text: location,
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
                    text: 'Salary: ',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight
                          .bold, // Color azul para la palabra "Organizer"
                      fontSize: 15,
                    ),
                    children: [
                      TextSpan(
                        text: salary,
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
                    text: 'Contract Type: ',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight
                          .bold, // Color azul para la palabra "Organizer"
                      fontSize: 15,
                    ),
                    children: [
                      TextSpan(
                        text: contractType,
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
                    text: 'Requirements: ',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight
                          .bold, // Color azul para la palabra "Organizer"
                      fontSize: 15,
                    ),
                    children: [
                      TextSpan(
                        text: requirements,
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
                    text: 'Job Post: ',
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

class RecruitmentButtons extends StatelessWidget {
  const RecruitmentButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: null,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              padding: const EdgeInsets.all(3),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          child: const Text("Team Staff"),
        ),
        ElevatedButton(
          onPressed: null,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              padding: const EdgeInsets.all(3),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          child: const Text("Candidates"),
        ),
        ElevatedButton(
          onPressed: null,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              padding: const EdgeInsets.all(3),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          child: const Text("Jop: Open"),
        ),
      ],
    );
  }
}

class RecruitmentPostulation extends StatelessWidget {
  const RecruitmentPostulation({super.key, required this.recruitment});
  final Map<String, dynamic>? recruitment;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ListTile(
          title: Text(
            "Applied",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: Icon(Icons.email_outlined),
        ),
        for (var postulator in recruitment?['postulators'] ?? [])
          Card(
            child: ListTile(
              title: Text(postulator['firstName'] ?? ""),
              subtitle: Text(postulator?['phone']?.toString() ?? ""),
              trailing: ElevatedButton(
                onPressed: null,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: const EdgeInsets.all(3),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: const Text("See Profile"),
              ),
            ),
          ),
        const ListTile(
          title: Text(
            "Reviewing Candidates",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: Icon(Icons.list_alt_outlined),
        ),
        const ListTile(
          title: Text(
            "Testing",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: Icon(Icons.fact_check_outlined),
        ),
        const ListTile(
          title: Text(
            "Intervies",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: Icon(Icons.comment_outlined),
        ),
      ],
    );
  }
}
