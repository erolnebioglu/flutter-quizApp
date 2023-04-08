import 'package:flutter/material.dart';
import 'package:quizapp/data/question_list.dart';
import 'package:quizapp/resultscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 
 Color mainColor = Color.fromARGB(255, 255, 247, 220);
 Color secondColor = Color.fromARGB(255, 148, 207, 255);
 PageController? _controller = PageController(initialPage: 0);
 bool isPressed = false;
 Color trueAnswer = Colors.green;
 Color wrongAnswer = Colors.red;
 Color btnColor = Color.fromARGB(255, 148, 207, 255) ;
 int score=0;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Padding(padding: EdgeInsets.all(18.0),
      child: PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      controller:_controller! ,
      onPageChanged:(page){
        setState(() {
          isPressed=false;
        });
      } ,
      itemCount: questions.length,
      itemBuilder: (context,index){
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Text("Questions ${index+1}/${questions.length}",style: TextStyle(color: Colors.blue,
              fontWeight: FontWeight.w600,
              fontSize:18,
               ),
              ),
            ),
            Divider(
              color: Colors.black,
              height: 3.0,
              thickness: 1.0,
              
            ),
            const SizedBox(height: 10.0,),

            Text(questions[index].question!, style:const TextStyle(color: Color.fromARGB(255, 14, 129, 2),
            fontSize: 20,
            fontWeight: FontWeight.w700

            ),),
            SizedBox(height: 35.0,),
            for(int i=0;i<questions[index].answer!.length;i++)
              Container(

                width: double.infinity,
                margin: EdgeInsets.only(bottom: 15.0),
                

                child: MaterialButton(
                  
                  shape: StadiumBorder(),
                  color: isPressed?questions[index].answer!.entries.toList()[i].value?trueAnswer:wrongAnswer:secondColor,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  onPressed:isPressed?(){}:() {
                    setState(() {
                      isPressed=true;
                    });
                    if(questions[index].answer!.entries.toList()[i].value){
                      score++;
                      print(score);
                    }

                  },
                  child: Text(questions[index].answer!.keys.toList()[i],
                  style:TextStyle(
                    color: Colors.white,
                  ) ,
                  
                  ),
                  
                  ),
              ),
              SizedBox(height: 30,),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    style:OutlinedButton.styleFrom(
                      shadowColor: Colors.black,
                      elevation: 10,
                      shape: StadiumBorder(),
                      backgroundColor: Color.fromARGB(255, 148, 207, 255),
                      side: BorderSide(color: Colors.green,width: 3)
                    ) ,
                    onPressed: isPressed?index+1==questions.length ?(){
                      Navigator.push(context, MaterialPageRoute(builder:(context)=>ResultScreen(score) ));
                    }:(){
                      _controller!.nextPage(duration: Duration(milliseconds: 500), curve: Curves.linear);
                      setState(() {
                        isPressed=false;
                      });
                    }
                    :null, 
                    child: Text(
                      index+1==questions.length?"See Grade":"Next",
                    style: TextStyle(color: Colors.black),
                    ),
                    
                    ),
                ],
              ),
            

          ],
        );
      },
      ),
      ),

    );
  }
}
