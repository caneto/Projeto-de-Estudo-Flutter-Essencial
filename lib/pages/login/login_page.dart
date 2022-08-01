import 'package:contastrabalhistas/pages/api_response.dart';
import 'package:contastrabalhistas/pages/home/home_page.dart';
import 'package:contastrabalhistas/pages/login/login_api.dart';
import 'package:contastrabalhistas/pages/login/model/usuario_model.dart';
import 'package:contastrabalhistas/utils/alert.dart';
import 'package:contastrabalhistas/widgets/app_button.dart';
import 'package:contastrabalhistas/widgets/app_text.dart';
import 'package:flutter/material.dart';

import '../../utils/nav.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();

  final _focusSenha = FocusNode();

  bool _showProgress = false;

  //String? Function(String? val)? validator;

  @override
  void initState() {
    super.initState();

    Future<Usuario?> future = Usuario.get();

    future.then((Usuario? user) {
      if(user!=null) {
 //       setState(() {
 //         _tLogin.text = user.login!;
 //       });

        push(context,HomePage(),replace: true);
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ContasTrabalhistas"),
      ),
      body: _body(),
    );
  }

  _body() {

    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            AppText("Login", "Digite seu Login, com até 30 caracteres",
                controller: _tLogin,
                validator: _validateLogin,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                nextFocus: _focusSenha),
            SizedBox(
              height: 10,
            ),
            AppText("Senha",
                "Digite sua Senha, com no minimo 8 e no maximo 20 caracteres",
                password: true,
                controller: _tSenha,
                validator: _validateSenha,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.none,
                focusNode: _focusSenha),
            SizedBox(
              height: 22,
            ),
             AppButton(
              "Login",
              onPressed: _onClickLogin,
              showProgress: _showProgress,
            )
          ],
        ),
      ),
    );
  }

  Future<void> _onClickLogin() async {
    bool? formOk = _formKey.currentState?.validate();
    if (!formOk!) {
      return;
    }
    String? login = _tLogin.text;
    String? senha = _tSenha.text;

    print("Login: $login, Senha: $senha");

    setState(() {
      _showProgress = true;
    });

    ApiResponse response = (await LoginApi.login(login, senha)) as ApiResponse;

    if (response.ok) {
      Usuario user = response.result;

      print(">>>>> $user");

      push(context, HomePage());
    } else {
      alert(context, response.msg);
    }

    setState(() {
      _showProgress = false;
    });
  }

  String? _validateLogin(String? text) {
    if (text != null) {
      if (text.isEmpty) {
        return "Digite o login";
      }
    }
    return null;
  }

  String? _validateSenha(String? text) {
    if (text != null) {
      if (text.isEmpty) {
        return "Digite sua senha";
      }
      if (text.length < 3) {
        return "A senha precisa ter pelo menos 3 nùmeros.";
      }
    }
    return null;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
