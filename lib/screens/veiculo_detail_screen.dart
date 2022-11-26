import 'package:controle_de_frota/models/veiculo.dart';
import 'package:flutter/material.dart';

class VeiculoDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Veiculo veiculo = ModalRoute.of(context)!.settings.arguments as Veiculo;
    return Scaffold(
      appBar: AppBar(
        title: Text(veiculo.modelo!),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 250,
            width: double.infinity,
          ),
          SizedBox(height: 10),
          Text(
            veiculo.modelo!,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
          Text(
            veiculo.marca!,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
          Text(
            veiculo.placa!,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, color: Colors.black),
          )
        ],
      ),
    );
  }
}
