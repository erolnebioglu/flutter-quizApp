import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:quizapp/main.dart';

class ResultScreen extends StatefulWidget {
  final int score;
  const ResultScreen(this.score,{super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
  Color mainColor = Color.fromARGB(255, 255, 247, 220);
  Color secondColor = Color.fromARGB(255, 148, 207, 255);
  Color thirdColor = Color.fromARGB(255, 47, 0, 255);
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Hey",
            style: TextStyle(color:thirdColor,fontSize:50,fontWeight: FontWeight.bold ),
            ),
            SizedBox(height: 15,),
            Text("Grade is:",
            style: TextStyle(color: Color.fromARGB(238, 250, 131, 67),fontSize:30,fontWeight: FontWeight.w500 ),
            ),
            SizedBox(height: 15,),
            Text("${widget.score}",style: TextStyle(color: Color.fromARGB(255, 2, 255, 133),fontSize: 70,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            SizedBox(
              width: 200,
              height: 50,
              child: MaterialButton(onPressed: 
              (){
               Navigator.push(context, 
               MaterialPageRoute(builder: (context)=>HomePage())); 
              },
              shape: StadiumBorder(),
              color: Color.fromARGB(238, 250, 131, 67),
              textColor: Colors.white,
              child:Text("Try Again"),),
            ),


          ],
        ),
      ),

    );
  }
}