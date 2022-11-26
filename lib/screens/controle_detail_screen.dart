import 'package:controle_de_frota/models/controle.dart';
import 'package:controle_de_frota/screens/map_screen.dart';
import 'package:flutter/material.dart';

class ControleDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Controle controle = ModalRoute.of(context)!.settings.arguments as Controle;
    return Scaffold(
      appBar: AppBar(
        title: Text(controle.title!),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 250,
            width: double.infinity,
            child: Image.file(
              controle.image!,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          SizedBox(height: 10),
          Text(
            controle.location!.address!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 10),
          TextButton.icon(
            icon: Icon(Icons.map),
            label: Text('Ver no Mapa'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (ctx) => MapScreen(
                    isReadOnly: true,
                    initialLocation: controle.location!,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
