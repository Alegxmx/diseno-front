import 'package:flutter/material.dart';

class DashPage extends StatelessWidget {
  const DashPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(body: Container(child: Center(child: Text("Eres un usuario en la aplicación"))));
  }
}