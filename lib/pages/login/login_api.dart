import 'dart:convert';
import 'package:contastrabalhistas/pages/api_response.dart';
import 'package:contastrabalhistas/pages/login/model/usuario_model.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<ApiResponse<Usuario>?> login(String login, String senha) async {
   try {
     var url = Uri.parse('https://carros-springboot.herokuapp.com/api/v2/login');

     Map<String, String> headers = {
       "Content-Type":"application/json"
     };

     final params = {
       'username': login,
       'password': senha,
     };

     String s = json.encode(params);

     var response = await http.post(url, body: s, headers: headers);
     print('Response status: ${response.statusCode}');
     print('Response body: ${response.body}');

     Map mapResponse = json.decode(response.body);

     if(response.statusCode == 200) {
       final user = Usuario.fromJson(mapResponse);

       user.sava();

       return ApiResponse.ok(user);
     }

     return ApiResponse.error(mapResponse["error"]);
   } catch(error, exception) {
     print("Erro no login $error > $exception");

     return ApiResponse.error("não foi possivel fazer login.");
   }
  }
}
