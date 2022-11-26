import 'package:controle_de_frota/models/condutor.dart';
import 'package:flutter/material.dart';

class CondutorDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Condutor condutor = ModalRoute.of(context)!.settings.arguments as Condutor;
    return Scaffold(
      appBar: AppBar(
        title: Text(condutor.nome!),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 250,
            width: double.infinity,
          ),
          SizedBox(height: 10),
          Text(
            condutor.nome!,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
          Text(
            condutor.email!,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
          Text(
            condutor.telefone!,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, color: Colors.black),
          )
        ],
      ),
    );
  }
}
