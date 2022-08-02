import 'dart:async';

import 'package:contastrabalhistas/pages/home/detalhes_page.dart';
import 'package:contastrabalhistas/pages/home/home_api.dart';
import 'package:contastrabalhistas/pages/home/home_bloc.dart';
import 'package:contastrabalhistas/utils/nav.dart';
import 'package:contastrabalhistas/widgets/text_error.dart';
import 'package:flutter/material.dart';

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

  final _bloc = HomeBloc();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _bloc.fetch(widget.tipo);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return StreamBuilder(
      stream: _bloc.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return TextError("Não foi possivel buscar os dados");
        }
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        List<Home> homes = snapshot.data as List<Home>;

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
                        home.urlFoto ?? "https://statig2.akamaized.net/bancodeimagens/1q/mi/qg/1qmiqgdki9ltthfpb43tkx94p.jpg",
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

  @override
  void dispose() {
    super.dispose();

    _bloc.dispose();
  }
}
