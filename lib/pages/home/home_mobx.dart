
import 'package:contastrabalhistas/pages/home/home_api.dart';
import 'package:contastrabalhistas/pages/home/model/home_model.dart';
import 'package:mobx/mobx.dart';

class HomeMobx  {

  @observable
  late List<Home> homes;

  @observable
  late Exception? error;

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

