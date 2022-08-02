
import 'package:contastrabalhistas/pages/home/home_api.dart';
import 'package:contastrabalhistas/pages/home/home_bloc.dart';
import 'package:contastrabalhistas/pages/home/model/home_model.dart';
import 'package:mobx/mobx.dart';

part 'home_mobx.g.dart';

class HomeMobx = HomeMobxBase with _$HomeMobx;

abstract class HomeMobxBase with Store  {

  @observable
  List<Home>? homes;

  @observable
  Exception? error;

  @action
  fetch(String tipo) async {
    try {
      error = null;

      this.homes = await HomeApi.getHome(tipo);

    } catch (e) {
      error = e as Exception?;
    }
  }
}

