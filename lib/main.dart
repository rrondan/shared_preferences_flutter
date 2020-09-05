import 'package:flutter/material.dart';
import 'package:preferencias_usuario_flutter/src/pages/home_page.dart';
import 'package:preferencias_usuario_flutter/src/pages/settings_page.dart';
import 'package:preferencias_usuario_flutter/src/shared_prefs/preferencias_usuario.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final prefs = PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prefencias',
      debugShowCheckedModeBanner: false,
      initialRoute: prefs.ultimaPagina,
      routes: {
        HomePage.routeName: (BuildContext context) => new HomePage(),
        SettingsPage.routeName: (BuildContext context) => new SettingsPage(),
      },
    );
  }
}
