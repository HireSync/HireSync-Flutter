import 'package:flutter/material.dart';

class PostulationCard extends StatefulWidget {
  const PostulationCard({Key? key}) : super(key: key);

  @override
  State<PostulationCard> createState() => _PostulationCardState();
}

class _PostulationCardState extends State<PostulationCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.all(8.0),
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.newspaper),
                    Text(
                      "Today Schedule",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
                  Align (alignment: Alignment.centerLeft,
                    child:Icon(Icons.arrow_left),),
                  Align (alignment: Alignment.centerRight,
                    child:Icon(Icons.arrow_right),),
    ]
                ),
                SizedBox(height: 8.0),
                // Envuelve el Container con Center para centrarlo
                Center(
                  child: Container(

                    color: Colors.red,
                    padding: EdgeInsets.all(8.0),
                    child:
                    Text(
                      "Make new test for software developer candidates\n9am-1pm",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
