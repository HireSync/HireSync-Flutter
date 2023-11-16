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

      body: AppBar (
        title: const Text('Home'),
        backgroundColor: Colors.blue.shade700,
      
      ),
      drawer:  NavigationDrawer() ,
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

