import 'package:flutter/material.dart';
import 'package:app_lista_mercado/provider/list.dart';
import 'package:app_lista_mercado/routes/app_routes.dart';
import 'package:app_lista_mercado/views/lista_form.dart';
import 'package:app_lista_mercado/views/lista_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Itemas(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter CRUD - Lista de Usuarios',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          AppRoutes.HOME: (_) => ItemList(),
          AppRoutes.USER_FORM: (_) => ListaForm()
        },
      ),
    );
  }
}