// ignore_for_file: unused_field, unnecessary_null_comparison, deprecated_member_use

import 'package:controle_de_frota/providers/controle_frota.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CondutorFormScreen extends StatefulWidget {
  @override
  State<CondutorFormScreen> createState() => _CondutorFormScreenState();
}

class _CondutorFormScreenState extends State<CondutorFormScreen> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefoneController = TextEditingController();

  bool _isValidForm() {
    return _nomeController.text.isNotEmpty != null;
  }

  void _submitForm() {
    if (!_isValidForm()) return;
    Provider.of<ControleFrota>(context, listen: false).addCondutor(
        _nomeController.text, _emailController.text, _telefoneController.text);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Novo Condutor'),
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
                        controller: _nomeController,
                        decoration: InputDecoration(labelText: 'Nome completo'),
                        onChanged: (text) {
                          setState(() {});
                        },
                      ),
                      TextField(
                        controller: _emailController,
                        decoration: InputDecoration(labelText: 'E-mail'),
                        onChanged: (text) {
                          setState(() {});
                        },
                      ),
                      TextField(
                        controller: _telefoneController,
                        decoration: InputDecoration(labelText: 'Telefone'),
                        onChanged: (text) {
                          setState(() {});
                        },
                      ),
                      SizedBox(height: 10),
                      SizedBox(height: 10),
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
        ));
  }
}
