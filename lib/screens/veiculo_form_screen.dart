// ignore_for_file: deprecated_member_use

import 'package:controle_de_frota/providers/controle_frota.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VeiculoFormScreen extends StatefulWidget {
  @override
  State<VeiculoFormScreen> createState() => _VeiculoFormScreenState();
}

class _VeiculoFormScreenState extends State<VeiculoFormScreen> {
  final _modeloController = TextEditingController();
  final _marcaController = TextEditingController();
  final _placaController = TextEditingController();

  bool _isValidForm() {
    return _modeloController.text.isNotEmpty != null;
  }

  void _submitForm() {
    if (!_isValidForm()) return;
    Provider.of<ControleFrota>(context, listen: false).addVeiculo(
        _modeloController.text, _marcaController.text, _placaController.text);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Veículo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.10),
                child: Column(
                  children: <Widget>[
                    TextField(
                        controller: _modeloController,
                        decoration: InputDecoration(labelText: 'Modelo'),
                        onChanged: (text) {
                          setState(() {});
                        }),
                    TextField(
                        controller: _marcaController,
                        decoration: InputDecoration(labelText: 'Marca'),
                        onChanged: (text) {
                          setState(() {});
                        }),
                    TextField(
                        controller: _placaController,
                        decoration: InputDecoration(labelText: 'Placa'),
                        onChanged: (text) {
                          setState(() {});
                        }),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            icon: Icon(Icons.add, color: Colors.white),
            label: Text('Adicionar', style: TextStyle(color: Colors.white)),
            style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                  (states) => Theme.of(context).accentColor),
              elevation: MaterialStateProperty.resolveWith((states) => 0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: _isValidForm() ? _submitForm : null,
          ),
        ],
      ),
    );
  }
}
