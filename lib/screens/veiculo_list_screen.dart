import 'package:controle_de_frota/providers/controle_frota.dart';
import 'package:controle_de_frota/utils/app_routes.dart';
import 'package:controle_de_frota/widgets/main_drower.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VeiculoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Veículos'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.car_repair),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.VEICULO_FORM);
              })
        ],
      ),
      drawer: MainDrower(),
      body: FutureBuilder(
          future: Provider.of<ControleFrota>(context, listen: false)
              .loadCondutores(),
          builder: (ctx, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? Center(child: CircularProgressIndicator())
              : Consumer<ControleFrota>(
                  child: Center(
                    child: Text('Nenhum Veículo Cadastrado'),
                  ),
                  builder: (context, ControleFrota, child) => ControleFrota
                              .itemsCountV ==
                          0
                      ? child!
                      : ListView.builder(
                          itemCount: ControleFrota.itemsCountV,
                          itemBuilder: (context, index) => ListTile(
                            title: Text(
                                ControleFrota.itemByIndexV(index).modelo!,
                                style: TextStyle(fontSize: 30)),
                            subtitle:
                                Text(ControleFrota.itemByIndexV(index).placa!),
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  AppRoutes.VEICULO_DETAIL,
                                  arguments: ControleFrota.itemByIndexV(index));
                            },
                          ),
                        ))),
    );
  }
}
