import 'package:flutter/material.dart';
import './pages/character.dart';

class CharacDetail extends StatelessWidget {
  final Results results;
  CharacDetail({this.results});

  bodyWidget(BuildContext context)=>Stack(
    children: <Widget>[
      Positioned(
        height: MediaQuery.of(context).size.height/1.5,
        width: MediaQuery.of(context).size.width -20,
        left: 10.0,
        top:  MediaQuery.of(context).size.height *0.1,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                  height: 70.0,
                  ),
              Text("${results.name}",style: TextStyle(fontSize: 20.0,fontWeight:FontWeight.bold),),
              Text("Estado: ${results.status}"),
              Text("Especie: ${results.species}"),
              Text("Genero: ${results.gender}"),
              Text("Origen: ${results.origin.name}"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),

            ],
          ),
        ),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: Hero(tag: results.image, child: Container(
          height: 150.0,
          width: 150.0,
          
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            image: DecorationImage(
              fit: BoxFit.cover,
                image: NetworkImage(results.image))
          ),
        )),
      )
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.cyan,
        title: Text(results.name),
      ),
      body: bodyWidget(context),
    );
  }
}
