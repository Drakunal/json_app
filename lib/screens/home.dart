import 'package:flutter/material.dart';
import 'package:json_app/services/network.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future? data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data =
        Network(url: "https://jsonplaceholder.typicode.com/posts").fetchData();
    data!.then((value) {
      // print(value[0]);//for the whole json object
      print(value[0]['title']); //for a key of json object
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Json"),
        ),
        body: Center(
          child: FutureBuilder(
              future: data,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data[0]['title']);
                } else {
                  return CircularProgressIndicator();
                }
              }),
        ));
  }
}
