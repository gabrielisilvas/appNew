import 'package:controle_de_frota/providers/controle_frota.dart';
import 'package:controle_de_frota/utils/app_routes.dart';
import 'package:controle_de_frota/widgets/main_drower.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ControleListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controle de Frota'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.CONTROLE_FORM);
            },
          )
        ],
      ),
      drawer: MainDrower(),
      body: FutureBuilder(
        future:
            Provider.of<ControleFrota>(context, listen: false).loadControles(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(child: CircularProgressIndicator())
            : Consumer<ControleFrota>(
                child: Center(
                  child: Text('Nenhum local cadastrado!'),
                ),
                builder: (context, controleFrota, child) =>
                    controleFrota.itemsCount == 0
                        ? child!
                        : ListView.builder(
                            itemCount: controleFrota.itemsCount,
                            itemBuilder: (context, index) => ListTile(
                              leading: CircleAvatar(
                                backgroundImage: FileImage(
                                    controleFrota.itemByIndex(index).image!),
                              ),
                              title:
                                  Text(controleFrota.itemByIndex(index).title!),
                              subtitle: Text(controleFrota
                                  .itemByIndex(index)
                                  .location!
                                  .address!),
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  AppRoutes.CONTROLE_DETAIL,
                                  arguments: controleFrota.itemByIndex(index),
                                );
                              },
                            ),
                          ),
              ),
      ),
    );
  }
}
