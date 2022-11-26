// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:controle_de_frota/providers/controle_frota.dart';
import 'package:controle_de_frota/widgets/image_input.dart';
import 'package:controle_de_frota/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class ControleFormScreen extends StatefulWidget {
  @override
  _ControleFormScreenState createState() => _ControleFormScreenState();
}

class _ControleFormScreenState extends State<ControleFormScreen> {
  final _titleController = TextEditingController();
  final _condutorController = TextEditingController();
  File? _pickedImage;
  LatLng? _pickedPosition;

  void _selectImage(File pickedImage) {
    setState(() {
      _pickedImage = pickedImage;
    });
  }

  void _selectPosition(LatLng position) {
    setState(() {
      _pickedPosition = position;
    });
  }

  bool _isValidForm() {
    return _titleController.text.isNotEmpty &&
        _pickedImage != null &&
        _pickedPosition != null;
  }

  void _submitForm() {
    if (!_isValidForm()) return;

    // ignore: unnecessary_statements
    Provider.of<ControleFrota>(context, listen: false).addControle(
      _titleController.text,
      _condutorController.text,
      _pickedImage!,
      _pickedPosition!,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Viagem'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _condutorController,
                      decoration: InputDecoration(
                        labelText: 'Condutor',
                      ),
                      onChanged: (text) {
                        setState(() {});
                      },
                    ),
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: 'Veículo',
                      ),
                      onChanged: (text) {
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 10),
                    ImageInput(this._selectImage),
                    SizedBox(height: 10),
                    LocationInput(this._selectPosition),
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
