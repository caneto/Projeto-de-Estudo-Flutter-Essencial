
import 'dart:convert';

import 'package:contastrabalhistas/pages/login/model/usuario_model.dart';

import 'model/home_model.dart';
import 'package:http/http.dart' as http;

class TipoHome {  // Trocar depois com dados do contas trabalhistas
  static final String classicos = "classicos";
  static final String esportivos = "esportivos";
  static final String luxo = "luxo";
}

class HomeApi {
  static Future<List<Home>> getHome2() async {
    final List<Home> home = [];

    await Future.delayed(Duration(seconds: 2));

    home.add(Home(nome: "Conteudo teste 1", urlFoto: "https://statig2.akamaized.net/bancodeimagens/1q/mi/qg/1qmiqgdki9ltthfpb43tkx94p.jpg", tipo: '', descricao: ''));
    home.add(Home(nome: "Conteudo teste 2", urlFoto: "https://statig2.akamaized.net/bancodeimagens/82/66/gd/8266gdo8hdufo4tgy5tya2bka.jpg", tipo: '', descricao: ''));
    home.add(Home(nome: "Conteudo teste 3", urlFoto: "https://statig2.akamaized.net/bancodeimagens/ch/xs/xl/chxsxl9nxwizkx1j9u3hjrcpw.jpg", tipo: '', descricao: ''));

    return home;
  }

  static Future<List<Home>> getHome(String tipo) async {

    //String sTipo = tipo.toString().replaceAll("TipoHome.", "");

    Usuario? user = await Usuario.get();

    Map<String, String> headers = {
      "Content-Type":"application/json",
      "Authorization": "Bearer ${user!.token}"
    };

    var url = Uri.parse('https://carros-springboot.herokuapp.com/api/v2/carros/tipo/$tipo');

    print("GET > $url");

    var response = await http.get(url, headers: headers);

    String resp = response.body;
    print("status code: ${response.statusCode}");
    print(resp);

    try {
      List list = json.decode(response.body);
      print(list);

      //for(Map map in list) {
      //  Home h = Home.fromJson(map);
      //  homes.add(h);
      //}

      final homes = list.map<Home>((map) => Home.fromJson(map)).toList();

      return homes;
    } catch(error, exception) {
      print("$error = $exception");
      throw error;
    }

  }

}