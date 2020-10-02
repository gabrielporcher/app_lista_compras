import 'package:flutter/material.dart';

class Lista {
  final String id;
  final String name;
  final String qtd;

  const Lista({
    this.id,
    @required this.name,
    @required this.qtd
  });
}