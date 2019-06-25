import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './pages/character.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';


import 'characterdetail.dart';

void main() => runApp(MaterialApp(
title: "Rick And Morty",
  home: Rickfinal(),
  debugShowCheckedModeBanner: false,
));

class Rickfinal extends StatefulWidget {
  @override
  _RickfinalState createState(){
    return new _RickfinalState();
  }
}

class _RickfinalState extends State<Rickfinal> {
  var url="https://rickandmortyapi.com/api/character/";
  CharacterList characterList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();

  }
  fetchData( )async{
    var res= await http.get(url);
   var decodedJson= jsonDecode(res.body);
   characterList=CharacterList.fromJson(decodedJson);
   setState(() {
     
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rick and Morty app"),
        backgroundColor: Colors.cyan,
      ),
      body: characterList ==null?Center(child: CircularProgressIndicator(),): GridView.count(
          crossAxisCount: 2,
          children: characterList.results.map((morty)=>Padding(
              padding:const EdgeInsets.all(2.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CharacDetail(
                  results: morty,
                )));
              },
              child: Hero(
                tag:  morty.image,
                child: Card(
                  elevation: 5.0,
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image:NetworkImage(morty.image))
                        ),

                      ),
                      Container(
                        height: 40,
                        width: 150,
                        child: Text(morty.name,style: TextStyle(fontSize: 14.0,fontWeight:FontWeight.bold),),
                        padding: EdgeInsets.fromLTRB(40, 10, 0, 0),
                      )
                    ],
                  ),

                ),
              ),
            ),
          )).toList()
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the Drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Image.network("http://assets.stickpng.com/thumbs/58f37720a4fa116215a9240f.png"),

            ),
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(60, 0, 0, 0),
              title: Text('Cerrar sesión'),
              leading: Icon(Icons.close),
              onTap: () {
                SystemNavigator.pop();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed:(){},
      backgroundColor: Colors.cyan,
        child:Icon(Icons.refresh),
      ),
    );
  }
}