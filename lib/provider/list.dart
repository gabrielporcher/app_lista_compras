import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:app_lista_mercado/data/dummy_lists.dart';
import 'package:app_lista_mercado/models/lista.dart';

class Itemas with ChangeNotifier {
  
  final Map<String, Lista> _items = {...dummy_lists};
  
  List<Lista> get all {
  
    return [..._items.values];
  } //all

  int get count {
     return _items.length;
  } //count

  Lista byIndex(i) {
    return _items.values.elementAt(i);
  } //byIndex

  void put(Lista lista)  {
    //Altera ou adiciona usuarios
    if (lista == null) {
      return;
    } //if

    //alterar
    if (lista.id != null &&
        lista.id.trim().isNotEmpty &&
        _items.containsKey(lista.id)) {
        
      _items.update(
          lista.id,
          (_) => Lista(
                id: lista.id,
                name: lista.name,
                qtd: lista.qtd,
              ));
    } //if
    else {
      // adicionar
      final id = Random().nextDouble().toString();

      _items.putIfAbsent(
          id,
          () => Lista(
                id: id,
                name: lista.name,
                qtd: lista.qtd
              ));
    } //else

    notifyListeners();
  } //put

  void remove(Lista lista) {
    if (lista != null && lista.id != null) {
      _items.remove(lista.id);
      notifyListeners();
    } //if
  } //remove

} // class
