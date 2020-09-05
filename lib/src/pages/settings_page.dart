import 'package:flutter/material.dart';
import 'package:preferencias_usuario_flutter/src/shared_prefs/preferencias_usuario.dart';
import 'package:preferencias_usuario_flutter/src/widgets/menu_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName = "settings";

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _colorSecundario = false;
  int _genero = 1;
  String _nombre = "Juan";

  TextEditingController _textController;
  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();
    prefs.ultimaPagina = SettingsPage.routeName;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _nombre = prefs.nombre;
    _textController = new TextEditingController(text: _nombre);
  }

  @override
  void dispose() {
    super.dispose();
    _textController?.dispose();
  }

  _setSelectedRadio( int valor ) async {
    prefs.genero = valor;
    _genero = valor;
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajustes"),
        backgroundColor: prefs.colorSecundario ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            child: Text("Settings",
              style: TextStyle(
                fontSize: 45.0,
                fontWeight: FontWeight.bold
              )),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: Text("Color secundario"),
            onChanged: (value){
              setState(() {
                prefs.colorSecundario = value;
                _colorSecundario = value;
              });
            },
          ),
          RadioListTile(
            value: 1,
            title: Text("Masculino"),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
            value: 2,
            title: Text("Femenino"),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: "Nombre",
                helperText: "Nombre de la persona usando el teléfono"
              ),
              onChanged: (value){
                prefs.nombre = value;
              },
            ),
          )
        ],
      )
    );
  }
}
