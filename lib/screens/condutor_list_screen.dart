import 'package:controle_de_frota/providers/controle_frota.dart';
import 'package:controle_de_frota/utils/app_routes.dart';
import 'package:controle_de_frota/widgets/main_drower.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CondutorListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Condutores'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person_add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.CONDUTOR_FORM);
            },
          )
        ],
      ),
      drawer: MainDrower(),
      body: FutureBuilder(
        future:
            Provider.of<ControleFrota>(context, listen: false).loadCondutores(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(child: CircularProgressIndicator())
            : Consumer<ControleFrota>(
                child: Center(
                  child: Text('Nenhum  Condutor cadastrado!'),
                ),
                builder: (context, controleFrota, child) => controleFrota
                            .itemsCountC ==
                        0
                    ? child!
                    : ListView.builder(
                        itemCount: controleFrota.itemsCountC,
                        itemBuilder: (context, index) => ListTile(
                          title: Text(controleFrota.itemByIndexC(index).nome!,
                              style: TextStyle(fontSize: 30)),
                          subtitle:
                              Text(controleFrota.itemByIndexC(index).email!),
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              AppRoutes.CONDUTOR_DETAIL,
                              arguments: controleFrota.itemByIndexC(index),
                            );
                          },
                        ),
                      ),
              ),
      ),
    );
  }
}
