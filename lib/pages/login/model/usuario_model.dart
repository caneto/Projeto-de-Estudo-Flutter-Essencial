import 'dart:convert';

import 'package:contastrabalhistas/utils/prefs.dart';

class Usuario {
  int? id;
  String? login;
  String? nome;
  String? email;
  String? urlFoto;
  String? token;
  List<String>? roles;

  Usuario(
      {this.id,
        this.login,
        this.nome,
        this.email,
        this.urlFoto,
        this.token,
        this.roles});

  Usuario.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    login = json['login'];
    nome = json['nome'];
    email = json['email'];
    urlFoto = json['urlFoto'];
    token = json['token'];
    roles = json['roles'].cast<String>();
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['id'] = this.id;
    data['login'] = this.login;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['urlFoto'] = this.urlFoto;
    data['token'] = this.token;
    data['roles'] = this.roles;
    return data;
  }

  void sava() {
    Map map = toJson();

    String json = jsonEncode(map);

    Prefs.setString("user.pref", json);
  }

  static void clear() {
    Prefs.setString("user.pref", "");
  }

  static Future<Usuario?> get() async {
    String json = await Prefs.getString("user.pref");
    if(json.isEmpty) return null;
    Map map = jsonDecode(json);
    Usuario user = Usuario.fromJson(map);
    return user;
  }

  @override
  String toString() {
    return 'Usuario{id: $id, login: $login, nome: $nome, email: $email, urlFoto: $urlFoto, token: $token, roles: $roles}';
  }
}