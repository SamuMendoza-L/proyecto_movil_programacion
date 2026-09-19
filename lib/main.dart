import 'package:flutter/material.dart';
import 'package:proyecto_movil_navegacion/Layout/login.dart';

void main() => runApp(const MercadoApp());

class MercadoApp extends StatelessWidget {
  const MercadoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mercado Campesino',
      home: Login()
      ,
    );
  }
}