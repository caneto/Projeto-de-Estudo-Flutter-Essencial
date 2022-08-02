
import 'package:contastrabalhistas/pages/home/home_api.dart';
import 'package:contastrabalhistas/pages/home/model/home_model.dart';
import 'package:contastrabalhistas/utils/simple_bloc.dart';

class HomeBloc extends SimpleBloc<List<Home>> {


  fetch(String tipo) async {
    try {
      List<Home> homes = await HomeApi.getHome(tipo);
      add(homes);
    } catch (e) {
      addError(e);
    }
  }


}

