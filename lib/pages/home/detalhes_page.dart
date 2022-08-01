import 'package:flutter/material.dart';
import 'model/home_model.dart';

class DetalhesPage extends StatelessWidget {
  Home? homes;
    DetalhesPage(this.homes);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(homes!.nome),
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
        padding: EdgeInsets.all(16),
        child: Image.network(homes!.urlFoto));
  }
}


