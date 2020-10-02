import 'package:app_lista_mercado/components/list_tile.dart';
import 'package:app_lista_mercado/data/dummy_lists.dart';
import 'package:app_lista_mercado/provider/list.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:app_lista_mercado/routes/app_routes.dart';

import 'package:flutter/material.dart';

class  ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Itemas lista = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de items'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.USER_FORM
              );
            },

          ),
        ],
      ),
      body: ListView.builder(
        itemCount: lista.count,
        itemBuilder: (ctx, i) => ListaTile(lista.byIndex(i)),
        ),
    );
  }
}