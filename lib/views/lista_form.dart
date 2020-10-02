import 'package:flutter/material.dart';
import 'package:app_lista_mercado/models/lista.dart';
import 'package:app_lista_mercado/provider/list.dart';
import 'package:provider/provider.dart';

class ListaForm extends StatefulWidget {
  @override
  _ListaFormState createState() => _ListaFormState();
}

class _ListaFormState extends State<ListaForm> {
  final _form = GlobalKey<FormState>();
  bool _isLoading = false;
  final Map<String, String> _formData = {};

  void _loadFormData(Lista lista) {
    if(lista != null) {
      _formData['id'] = lista.id;
      _formData['name'] = lista.name;
      _formData['qtd'] = lista.qtd;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    final Lista lista = ModalRoute.of(context).settings.arguments;
    _loadFormData(lista);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário item'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () async {
              final isValid = _form.currentState.validate();

              //Validações para campos do formulario
             
              if (isValid) {
                _form.currentState.save();

                setState(() {
                  _isLoading = true;
                });

                Provider.of<Itemas>(context, listen: false).put(
                  Lista(
                    id: _formData['id'],
                    name: _formData['name'],
                    qtd: _formData['qtd'],
                  ),
                );

                setState(() {
                  _isLoading = false;
                });

                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: _isLoading
        ? Center(child: CircularProgressIndicator())
        : Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nome inválido';
                  }

                  if (value.trim().length < 2) {
                    return 'Nome pequeno';
                  }

                  return null;
                },
                onSaved: (value) => _formData['name'] = value,
              ),
              TextFormField(
                initialValue: _formData['qtd'],
                decoration: InputDecoration(labelText: 'qtd'),
                onSaved: (value) => _formData['qtd'] = value,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}