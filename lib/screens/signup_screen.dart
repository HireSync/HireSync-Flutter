import 'package:flutter/material.dart';
import 'package:flutter_app/screens/login_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final username = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  
  bool isVisible = false;
  bool isButton1Selected = false;
  bool isButton2Selected = false;
  final formkey = GlobalKey<FormState>();

  @override

 
  Widget build(BuildContext context) {
    return  Scaffold(
      body : Container(
        alignment: Alignment.center,
        child:  SingleChildScrollView (
          child: Form(
            key:formkey,
            child: Column( 
              mainAxisAlignment: MainAxisAlignment.center,
              
            children: [

               Image.asset("lib/assets/logo_2.png",width: 100,
                ),
                const SizedBox(height: 5),

                  const ListTile(
                    
                   title: Text(
                    textAlign : TextAlign.center,
                     "Sign up",
                    style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                  
                ),
                 
              ),
            ),

           


                 const SizedBox(height: 20),

                  // Fila con dos botones
                   // Fila con dos botones
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 195, // Ancho fijo para los botones
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isButton1Selected = true;
                          isButton2Selected = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary:isButton1Selected ==true ? Colors.blue : null,
                      ),
                      child: const Text(
                        "Reclutador",
                        style: TextStyle(fontSize: 16), // Tamaño del texto
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    width: 195, // Ancho fijo para los botones
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isButton1Selected = false;
                          isButton2Selected = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: isButton2Selected ? Colors.blue : null,
                      ),
                      child:const Text(
                        "Postulante",
                        style: TextStyle(fontSize: 16), // Tamaño del texto
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
          
              Container(
               
                    margin: EdgeInsets.all(8),
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                    decoration:
                    BoxDecoration(
                        
                      borderRadius:BorderRadius.circular(8),
                      color:Colors.deepPurple.withOpacity(.3)),
                     child: TextFormField(
                    controller: username,
                      validator: (value) {
                        if(value!.isEmpty){
                          return "username is required";
                        }
                        return null;
                      } ,
                     decoration:const InputDecoration(
                      icon: Icon(Icons.person),
                      border: InputBorder.none,
                      hintText: "Username",
                               ),
                             ),
                   ),
                 
                 //passsword
                    Container(
                      margin: const EdgeInsets.all(8),
                    padding:
                     const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                    decoration:
                    BoxDecoration(
                      
                      borderRadius:BorderRadius.circular(8),
                      color:Colors.deepPurple.withOpacity(.3)),
                     child: TextFormField(

                      controller: password,
                       validator: (value) {
                        if(value!.isEmpty){
                          return "password is required";
                        }
                        return null;
                      } ,
                      obscureText: !isVisible,
                     decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      border: InputBorder.none,
                      hintText: "Password",
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisible=!isVisible;
                          });
                 
                        },
                         icon: Icon(isVisible
                          ? Icons.visibility
                          : Icons.visibility_off))),
                             ),
                   ),

                    Container(
                      margin: const EdgeInsets.all(8),
                    padding:
                     const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                    decoration:
                    BoxDecoration(
                      
                      borderRadius:BorderRadius.circular(8),
                      color:Colors.deepPurple.withOpacity(.3)),
                     child: TextFormField(

                      controller:  confirmPassword,
                       validator: (value) {
                        if(value!.isEmpty){
                          return "newpassword is required";
                        }else if(confirmPassword.text !=  password.text )
                        
                       {
                        return "Passwords don't match";

                        }

                        return null;
                    
                      } ,
                      obscureText: !isVisible,
                     decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      border: InputBorder.none,
                      hintText: "Newpassword",
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisible=!isVisible;
                          });
                 
                        },
                         icon: Icon(isVisible
                          ? Icons.visibility
                          : Icons.visibility_off))),
                             ),
                   ),
                  const  SizedBox(height: 10,),
                         //login button
             Container(
                height: 60,
                width: MediaQuery.of(context).size.width *0.96,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.blue
                ),
                 child: TextButton(
                  onPressed: (){
                    if (formkey.currentState!.validate()){

                    }
                  },
                  child: const Text("LOGIN", 
                  style: TextStyle(color: Colors.white),
                  )),
               ),
             
               //sing up botton
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const Text("Don't have an account ?"),
                TextButton(onPressed: (
                  
                ) {
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>const LoginScreen()));
                }, child: Text("LOGIN"))
                ],)
          
                
            ],
            
                
                
              ),
          ),

        ),
      ),
        
      );
  }
}