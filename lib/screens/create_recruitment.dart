import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:flutter_app/services/organization_service.dart';

class CreateRecruitment extends StatefulWidget {
  final Map<String, dynamic>? organization;

  const CreateRecruitment({Key? key, this.organization}) : super(key: key);

  @override
  State<CreateRecruitment> createState() => _CreateRecruitmentState();
}

class _CreateRecruitmentState extends State<CreateRecruitment> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();
  final TextEditingController _contractTypeController = TextEditingController();
  final TextEditingController _requirementsController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _jobpostController = TextEditingController();
  final TextEditingController _organizerController = TextEditingController();

  final OrganizationService _organizationService = OrganizationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create Recruitment'),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Name:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(controller: _nameController),
              const SizedBox(height: 10),
              const Text(
                'Position:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(controller: _positionController),
              const SizedBox(height: 10),
              const Text(
                'Description:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(controller: _descriptionController),
              const SizedBox(height: 10),
              const Text(
                'Location:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(controller: _locationController),
              const SizedBox(height: 10),
              const Text(
                'Salary:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(controller: _salaryController),
              const SizedBox(height: 10),
              const Text(
                'Contract Type:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(controller: _contractTypeController),
              const SizedBox(height: 10),
              const Text(
                'Requirements:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(controller: _requirementsController),
              const SizedBox(height: 10),
              const Text(
                'Status:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(controller: _statusController),
              const SizedBox(height: 10),
              const Text(
                'Job Post:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(controller: _jobpostController),
              const SizedBox(height: 10),
              const Text(
                'Organizer:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextField(controller: _organizerController),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  // Obtén los datos del controlador
                  final String name = _nameController.text;
                  final String position = _positionController.text;
                  final String description = _descriptionController.text;
                  final String location = _locationController.text;
                  final String salary = _salaryController.text;
                  final String contractType = _contractTypeController.text;
                  final String requirements = _requirementsController.text;
                  final String status = _statusController.text;
                  final String jobpost = _jobpostController.text;
                  final String organizer = _organizerController.text;
                  // Crea un mapa con los datos del reclutamiento
                  final Map<String, dynamic> recruitmentData = {
                    'name': name,
                    'position': position,
                    'description': description,
                    'location': location,
                    'salary': salary,
                    'contractType': contractType,
                    'requirements': requirements,
                    'status': status,
                    'jobpost': jobpost,
                    'organizer': organizer,
                    // Puedes agregar más campos según sea necesario
                  };
                  final bool success =
                      await _organizationService.addRecruitmentToOrganization(
                    widget.organization?['id'],
                    recruitmentData,
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue.shade900,
                ),
                child: const Text(
                  'CREATE RECRUITMENT',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        )));
  }
}
