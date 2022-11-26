import 'dart:io';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ControleLocation {
  final double? latitude;
  final double? longitude;
  final String? address;

  const ControleLocation({
    required this.latitude,
    required this.longitude,
    this.address,
  });

  LatLng toLatLang() {
    return LatLng(this.latitude!, this.longitude!);
  }
}

class Controle {
  final String? id;
  final String? title;
  final String? condutor;
  final ControleLocation? location;

  final File? image;

  Controle({
    required this.id,
    required this.title,
    required this.condutor,
    required this.location,
    this.image,
  });
}
