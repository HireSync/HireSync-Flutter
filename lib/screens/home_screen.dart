import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/profile.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Good Morning Natalia'),
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
            ScheduleCard(
              title: 'SCHEDULE',
              events: [
                EventCard(title: 'Entrevista con Inkafarma: 5:00pm', color: Colors.orange),
                EventCard(title: 'Test Pendiente con Mercado Libre: 11:00am', color: Colors.purple),
              ],
            ),
            SizedBox(height: 10,),
            ScheduleCard(
              title: 'Active Jobs Recruitments',
              events: [
                EventCard(title: 'Inkafarma', color: const Color.fromARGB(255, 255, 153, 0)),
                EventCard(title: 'Mercado Libre', color: Colors.purple),
              ],
            ),
          ],
        ),
      ),
      drawer: NavigationDrawer(),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final String title;
  final List<EventCard> events;

  const ScheduleCard({required this.title, required this.events});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: events,
            ),
          ],
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String title;
  final Color color;

  const EventCard({required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      margin: EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}): super(key: key);

  @override
  Widget build (BuildContext context) =>  Drawer(
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
  
  Widget buildHearder(BuildContext context )=> Material(
    color :Colors.blue.shade700,
    child:InkWell(
      onTap: (){
        Navigator.pop(context);
        Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const Profile()));




      },
      child: Container(
      
        padding: EdgeInsets.only(
        top:24 + MediaQuery.of(context).padding.top,
        bottom: 24,
        ),
        child: Column(children: const[
          CircleAvatar(
            radius: 52,
            backgroundImage: AssetImage("lib/assets/perfil.jpg"),
            
          ),
          SizedBox(height: 12,),
          Text(
            ' Testigos de Vue',
            style:TextStyle(fontSize: 25,color:Colors.white)
          ),
          Text(
            'Jeffrey Ocampos ',
            style:TextStyle(fontSize: 25,color:Colors.white)
          )
        ]),
          
        ),
      ),
    );
  
  Widget buildMenu(BuildContext context )=> Container(
    padding: const EdgeInsets.all(24),
    child: Wrap(
      runSpacing: 16,
      children: [
      ListTile(
        leading: const Icon(Icons.home_outlined),
        title: const Text('Home'),
        onTap: () =>
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>const HomePage())),
    
      ),
      ListTile(
        leading: const Icon(Icons.work_outline),
        title: const Text('Recruitments'),
        onTap: () {},
    
      ),
      ListTile(
        leading: const Icon(Icons.business_outlined),
        title: const Text('Organizations'),
        onTap: () {},
    
      ),
      ListTile(
        leading: const Icon(Icons.settings_outlined),
        title: const Text('Settings'),
        onTap: () {},
    
      )
    
    
    
    
      ],
      ),
    );

  
}

