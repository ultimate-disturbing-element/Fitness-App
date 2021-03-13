import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnessapp/screens/exercise_hub.dart';
import 'package:fitnessapp/screens/exercise_screen.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';


class ExerciseStartScreen extends StatefulWidget {
final Exercises exercises;

ExerciseStartScreen({this.exercises});
  @override
  _ExerciseStartScreenState createState() => _ExerciseStartScreenState();
}

class _ExerciseStartScreenState extends State<ExerciseStartScreen> {

  int seconds=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       width: MediaQuery.of(context).size.width,
       height: MediaQuery.of(context).size.height,
       child: Hero(
         tag:widget.exercises.id, 
          child: Stack(
            children: <Widget>[
              CachedNetworkImage(
                 imageUrl:widget.exercises.thumbnail,
                 placeholder:(context,url  )=>Image(
                   image: AssetImage("assets/image3.jpeg"),
                   fit:BoxFit.cover,
                   height:MediaQuery.of(context).size.height,
                   width: MediaQuery.of(context).size.width,
                 ),
                 errorWidget:(context,url,error)=>
                  Icon(Icons.error),
                 fit:BoxFit.cover,
                 height:MediaQuery.of(context).size.height,
                 width:MediaQuery.of(context).size.width,
               ),

               Container(
                 height:MediaQuery.of(context).size.height,
                 width:MediaQuery.of(context).size.width,
                 decoration: BoxDecoration(
                   gradient:LinearGradient(colors: [
                     Color(0xFFE83350),
                     Color(0x00E83350),
                   ],
                   begin: Alignment.bottomCenter,
                   end:Alignment.center
                   ),
                 ),
               ),
               Positioned(
                 bottom:0,
                 left: 0,
                 right: 0,
                 child: Container(
                   height: 200,
                   width: 200,
                   child: SleekCircularSlider(appearance: CircularSliderAppearance(),
                   onChange: (double value){
                     seconds= value.toInt();
                   },
                   initialValue: 30,
                   min:10,
                   max:60,
                   innerWidget: (v){
                     return Container(
                       alignment: Alignment.center,
                     child: Text(
                       "${v.toInt()} S",
                       style: TextStyle(
                         color: Colors.white,
                         fontSize: 20,
                       ),
                     )
                    );
                   },
                   ),
               ),
               ),
               Container(
                 alignment:Alignment.center,
                 child:RaisedButton(child: Text("Start Exercise"),
                 onPressed: (){
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context)=>ExerciseScreen(
                       exercises:widget.exercises,
                       seconds:seconds,
                     ))
                   );
                 },
                 color: Color(0xFFe83350),
                 textColor: Colors.white,
                 shape: RoundedRectangleBorder(
                   borderRadius:BorderRadius.circular(20)
                 ),
                 )
               )
            ],
          ),
      ),
      )
    );
  }
}