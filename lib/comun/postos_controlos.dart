// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class PostoController extends ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  String erro = '';

  PostoController() {
    getPosicao();
  }

  getPosicao() async {
    try {
      Position posicao = await _posicaoActual();
      lat = posicao.latitude;
      long = posicao.longitude;
    } catch (e) {
      erro = e.toString();
    }
    notifyListeners();
  }

  Future<Position> _posicaoActual() async {
    LocationPermission permissao;
    bool activado = await Geolocator.isLocationServiceEnabled();
    if (!activado) {
      return Future.error('por favor habilita a localizacao no celular');
    }

    permissao = await Geolocator.checkPermission();

    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();
      if (permissao == LocationPermission.denied) {
        return Future.error('Voçê precisa autorizar p acesso a localização');
      }
    }

    if (permissao == LocationPermission.deniedForever) {
      return Future.error('voçê precisa autorizar o acesso á localização');
    }

    return await Geolocator.getCurrentPosition();
  }
}
