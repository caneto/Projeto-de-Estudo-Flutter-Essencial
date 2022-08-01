
import 'dart:async';

import 'package:contastrabalhistas/pages/home/home_api.dart';
import 'package:contastrabalhistas/pages/home/model/home_model.dart';

class HomeBloc {
  final _streamControllerState = StreamController<List<Home>>();

  get stream => _streamControllerState.stream;

  fetch(String tipo) async {
    List<Home> homes = await HomeApi.getHome(tipo);
    _streamControllerState.add(homes);
  }

  @override
  void dispose() {
    _streamControllerState.close();
  }
}

