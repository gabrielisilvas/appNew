// ignore_for_file: deprecated_member_use

import 'package:controle_de_frota/providers/controle_frota.dart';
import 'package:controle_de_frota/screens/condutor_detail_screen.dart';
import 'package:controle_de_frota/screens/condutor_form_screen.dart';
import 'package:controle_de_frota/screens/condutor_list_screen.dart';
import 'package:controle_de_frota/screens/controle_detail_screen.dart';
import 'package:controle_de_frota/screens/controle_form_screen.dart';
import 'package:controle_de_frota/screens/controle_list_screen.dart';
import 'package:controle_de_frota/screens/settings_screen.dart';
import 'package:controle_de_frota/screens/teste_screen.dart';
import 'package:controle_de_frota/screens/veiculo_detail_screen.dart';
import 'package:controle_de_frota/screens/veiculo_form_screen.dart';
import 'package:controle_de_frota/screens/veiculo_list_screen.dart';
import 'package:controle_de_frota/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => ControleFrota(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Controle de Frota',
        theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.black,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ControleListScreen(),
        routes: {
          AppRoutes.CONTROLE_FORM: (ctx) => ControleFormScreen(),
          AppRoutes.CONTROLE_DETAIL: (ctx) => ControleDetailScreen(),
          AppRoutes.CONDUTOR_LIST: (ctx) => CondutorListScreen(),
          AppRoutes.CONDUTOR_FORM: (ctx) => CondutorFormScreen(),
          AppRoutes.CONDUTOR_DETAIL: (ctx) => CondutorDetailScreen(),
          AppRoutes.VEICULO_LIST: (ctx) => VeiculoListScreen(),
          AppRoutes.VEICULO_FORM: (ctx) => VeiculoFormScreen(),
          AppRoutes.VEICULO_DETAIL: (ctx) => VeiculoDetailScreen(),
          AppRoutes.HOME: (ctx) => ControleListScreen(),
          AppRoutes.SETTINGS: (ctx) => Settings(),
          AppRoutes.TESTE: (ctx) => Teste(),
        },
      ),
    );
  }
}
