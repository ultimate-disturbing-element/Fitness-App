import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnessapp/screens/exercise_hub.dart';
import 'package:fitnessapp/screens/exercise_start_screen.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final String apiUrl ="https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json";

  ExerciseHub? exercisehub;

  @override
  void initState(){

    getExercises();
    super.initState();
  }
  void getExercises()async{
    var response= await http.get(Uri.parse(apiUrl));
    var body= response.body;
    var decodedJson=jsonDecode(body);
    exercisehub=ExerciseHub.fromJson(decodedJson);
    setState((){});
    print(exercisehub);
    return decodedJson;
    }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fitness App"),),
       body: Container(
         child: exercisehub!=null ? 
         ListView(
           children: exercisehub?.exercises?.map((e) {
             return InkWell(
                onTap: (){

                  Navigator.push(
                    context,MaterialPageRoute(
                      builder:(context)=>ExerciseStartScreen(
                        exercises:e,
                      )
                    )

                  );

                },
                child:Hero(
                  tag: e.id,
                child:Container(
             margin: EdgeInsets.all(10),
             decoration: BoxDecoration(
               borderRadius:BorderRadius.circular(16),
             ),
             child:Stack(
               children: <Widget>[
             ClipRRect(
               borderRadius: BorderRadius.circular(16),
             //child: FadeInImage(placeholder: AssetImage("assets/image3.jpg"), 
           //image: NetworkImage(e.thumbnail),
           //width:MediaQuery.of(context).size.width,
           //height:250,
           //fit:BoxFit.cover,
           //)
           child: CachedNetworkImage(
             imageUrl:e.thumbnail,
             placeholder:(context,url)=>Image(
               image: AssetImage("assets/image3.jpeg"),
               fit:BoxFit.cover,
               height:250,
               width: MediaQuery.of(context).size.width,
             ),
             errorWidget:(context,url,error)=>
              Icon(Icons.error),
             fit:BoxFit.cover,
             height:250,
             width:MediaQuery.of(context).size.width,
           ),
             ),
             ClipRRect(
               borderRadius: BorderRadius.circular(16),
                            child: Container(
                 width:MediaQuery.of(context).size.width,
                 height:250,
                 decoration:BoxDecoration(
                   gradient:LinearGradient(colors: [
                     Color(0xff000000),
                     Color(0x00000000),
                   ],
                   begin: Alignment.bottomCenter,
                   end:Alignment.center,
                   )
                 )
               ),
             ),
             Container(
               height: 250,
               padding: EdgeInsets.only(left:10, bottom:10),
               alignment: Alignment.bottomLeft,
              child: Text(
                e.title,
                style:TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
             ),
               ],
             ),
           )
                )
             );
           }).toList() ?? [],

           )
         :LinearProgressIndicator(),
       )
    );
  }
}