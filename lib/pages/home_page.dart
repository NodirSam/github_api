import 'package:flutter/material.dart';
import '../model/users.dart';
import '../services/http_service.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String login = "";
  int id = 0;
  late Users users;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiPostList();
  }

  void _apiPostList(){
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
      users = Network.parseUsers(response),
      _showResponse(response),
    });
  }
  void _showResponse(String response){
    setState(() {
      login = users.login;
      id = users.id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "GitHub Api",
          style: TextStyle(fontSize: 30),
        ),
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 300),
          child: Column(
            children: [
              Text(
                "login: $login",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20,),
              Text(
                "id : "+id.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

            ],
          ),
        ),
      )
    );
  }
}