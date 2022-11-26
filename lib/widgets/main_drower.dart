import 'package:flutter/material.dart';
import '../utils/app_routes.dart';

class MainDrower extends StatelessWidget {
  Widget _createItem(IconData icon, String label, Function() onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(
        label,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 25,
            fontWeight: FontWeight.bold),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.white,
            alignment: Alignment.center,
            child: Text(
              "CONTROLE DE FROTA - MENU",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 20),
          _createItem(
            Icons.pageview_rounded,
            'Página Inicial',
            () => Navigator.of(context).pushNamed(AppRoutes.HOME),
          ),
          _createItem(Icons.person, "Condutores",
              () => Navigator.of(context).pushNamed(AppRoutes.CONDUTOR_LIST)),
          _createItem(Icons.car_rental, "Veículos",
              () => Navigator.of(context).pushNamed(AppRoutes.VEICULO_LIST)),
          _createItem(
            Icons.settings,
            "Configurações",
            () => Navigator.of(context).pushNamed(AppRoutes.SETTINGS),
          ),
          _createItem(
            Icons.add_reaction_sharp,
            "Teste",
            () => Navigator.of(context).pushNamed(AppRoutes.TESTE),
          ),
        ],
      ),
    );
  }
}
