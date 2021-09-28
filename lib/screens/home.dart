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
      print(value[0]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json"),
      ),
    );
  }
}
