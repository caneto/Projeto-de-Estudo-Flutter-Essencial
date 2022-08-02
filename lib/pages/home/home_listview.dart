import 'dart:async';

import 'package:contastrabalhistas/pages/home/detalhes_page.dart';
//import 'package:contastrabalhistas/pages/home/home_api.dart';
//import 'package:contastrabalhistas/pages/home/home_bloc.dart';
import 'package:contastrabalhistas/pages/home/home_mobx.dart';
import 'package:contastrabalhistas/utils/nav.dart';
import 'package:contastrabalhistas/widgets/text_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'home_page.dart';
import 'model/home_model.dart';

class HomeListView extends StatefulWidget {
  String tipo;
  HomeListView(this.tipo);

  @override
  State<HomeListView> createState() => _HomeListViewState();
}

class _HomeListViewState extends State<HomeListView> with AutomaticKeepAliveClientMixin<HomeListView> {
  List<Home> homes = [];

  //final _bloc = HomeBloc();
  final _mobx = HomeMobx();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _mobx.fetch(widget.tipo);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Observer(
      builder: (context) {

        List<Home>? homes = _mobx.homes;

        if (_mobx.error != null) {
          return TextError("Não foi possivel buscar os dados");
        }
        if (homes == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return _listView(homes);
      },
    );
  }

  Container _listView(List<Home> homes) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
          itemCount: homes != null ? homes.length : 0,
          itemBuilder: (context, index) {
            Home home = homes[index];

            return Card(
              color: Colors.grey[100],
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Image.network(
                        home.urlFoto,
                        width: 250,
                      ),
                    ),
                    Text(
                      home.nome,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 22),
                    ),
                    const Text(
                      "descrição...",
                      style: TextStyle(fontSize: 22),
                    ),
                    ButtonBarTheme(
                      data: ButtonBarTheme.of(context),
                      child: ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            child: const Text('DETALHES'),
                            onPressed: () => _onClickHome(home),
                          ),
                          FlatButton(
                            child: const Text('SHARE'),
                            onPressed: () {
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  _onClickHome(Home home) {
    push(context, DetalhesPage(home));
  }

 // @override
 // void dispose() {
 //   super.dispose();
 //   _bloc.dispose();
 // }
}

