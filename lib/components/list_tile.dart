import 'package:flutter/material.dart';
import 'package:app_lista_mercado/models/lista.dart';
import 'package:app_lista_mercado/provider/list.dart';
import 'package:app_lista_mercado/routes/app_routes.dart';
import 'package:provider/provider.dart';

class ListaTile extends StatelessWidget {
  final Lista lista;
  //USERTILE, LIST É PALAVRA RESERVADA
  const ListaTile(this.lista);

  @override
  Widget build(BuildContext context) {
    
    return ListTile(
      leading: Text(lista.qtd),
      title: Text(lista.name),
      trailing: Container(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.edit),
                color: Colors.orange,
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.USER_FORM,
                    arguments: lista,
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {
                  //Metodo que mostra avisos na tela;
                  showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                            title: Text('Excluir Item'),
                            content: Text('Tem certeza?'),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('Não'),
                                onPressed: () => Navigator.of(context).pop(false),
                              ),
                              FlatButton(
                                child: Text('Sim'),
                                onPressed: () => Navigator.of(context).pop(true),
                                
                              ),
                            ],
                          )
                        ).then((confirmed) {
                          if(confirmed){
                              Provider.of<Itemas>(context, listen: false)
                                      .remove(lista);
                          }//if
                        });
                }, //onPressed
              ),
            ],
          )),
    );
  }
}
