import 'dart:io';
import 'dart:math';

import 'package:controle_de_frota/models/condutor.dart';
import 'package:controle_de_frota/models/controle.dart';
import 'package:controle_de_frota/models/veiculo.dart';
import 'package:controle_de_frota/utils/db_util.dart';
import 'package:controle_de_frota/utils/location_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ControleFrota with ChangeNotifier {
  List<Controle> _items = [];
  List<Condutor> _itemsC = [];
  List<Veiculo> _itemsV = [];

  Future<void> loadControles() async {
    final dataList = await DbUtil.getData('controles');
    _items = dataList
        .map(
          (item) => Controle(
            id: item['id'],
            title: item['title'],
            condutor: item['condutor'],
            image: File(item['image']),
            location: ControleLocation(
              latitude: item['latitude'],
              longitude: item['longitude'],
              address: item['address'],
            ),
          ),
        )
        .toList();
    notifyListeners();
  }

  List<Controle> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Controle itemByIndex(int index) {
    return _items[index];
  }

  Future<void> addControle(
    String title,
    String condutor,
    File image,
    LatLng position,
  ) async {
    String address = await LocationUtil.getAddressFrom(position);
    final newControle = Controle(
      id: Random().nextDouble().toString(),
      title: title,
      condutor: condutor,
      image: image,
      location: ControleLocation(
        latitude: position.latitude,
        longitude: position.longitude,
        address: address,
      ),
    );

    _items.add(newControle);
    DbUtil.insert('controles', {
      'id': newControle.id!,
      'title': newControle.title!,
      'condutor': newControle.condutor!,
      'image': newControle.image!.path,
      'latitude': position.latitude,
      'longitude': position.longitude,
      'address': address,
    });
    notifyListeners();
  }

  Future<void> loadCondutores() async {
    final dataListC = await DbUtil.getData('controles');
    _itemsC = dataListC
        .map(
          (item) => Condutor(
            id: item['id'],
            nome: item['nome'],
            email: item['email'],
            telefone: item['telefone'],
          ),
        )
        .toList();
    notifyListeners();
  }

  List<Condutor> get itemsC {
    return [..._itemsC];
  }

  int get itemsCountC {
    return _itemsC.length;
  }

  Condutor itemByIndexC(int index) {
    return _itemsC[index];
  }

  Future<void> addCondutor(
    String nome,
    String email,
    String telefone,
  ) async {
    final newCondutor = Condutor(
        id: Random().nextDouble().toString(),
        nome: nome,
        email: email,
        telefone: telefone);

    _itemsC.add(newCondutor);
    DbUtil.insert('condutores', {
      'id': newCondutor.id!,
      'nome': newCondutor.nome!,
      'email': newCondutor.email!,
      'telefone': newCondutor.telefone!,
    });
    notifyListeners();
  }

  Future<void> loadVeiculos() async {
    final dataListV = await DbUtil.getData('controles');
    _itemsV = dataListV
        .map(
          (item) => Veiculo(
            id: item['id'],
            modelo: item['modelo'],
            marca: item['marca'],
            placa: item['placa'],
          ),
        )
        .toList();
    notifyListeners();
  }

  List<Veiculo> get itemsV {
    return [..._itemsV];
  }

  int get itemsCountV {
    return _itemsV.length;
  }

  Veiculo itemByIndexV(int index) {
    return _itemsV[index];
  }

  Future<void> addVeiculo(
    String modelo,
    String marca,
    String placa,
  ) async {
    final newVeiculo = Veiculo(
        id: Random().nextDouble().toString(),
        modelo: modelo,
        marca: marca,
        placa: placa);

    _itemsV.add(newVeiculo);
    DbUtil.insert('veiculos', {
      'id': newVeiculo.id!,
      'modelo': newVeiculo.modelo!,
      'marca': newVeiculo.marca!,
      'placa': newVeiculo.placa!,
    });
    notifyListeners();
  }
}
