import 'package:flutter/material.dart';
import 'package:preferencias_usuario_flutter/src/pages/settings_page.dart';
import 'package:preferencias_usuario_flutter/src/shared_prefs/preferencias_usuario.dart';
import 'package:preferencias_usuario_flutter/src/utils/image_util.dart';
import 'package:preferencias_usuario_flutter/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {

  static final String routeName = "home";
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {

    prefs.ultimaPagina = routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text("Preferencias de Usuario"),
        backgroundColor: prefs.colorSecundario ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Color secundario: ${prefs.colorSecundario}"),
          Divider(),
          Text("Genero: ${prefs.genero}"),
          Divider(),
          Text("Nombre usuario: ${prefs.nombre}"),
          Divider(),
        ],
      ),
    );
  }

}
