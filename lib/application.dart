import 'package:flutter/material.dart';
import 'package:id_379/router_controller.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  final router = RouterController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router.router,
      theme: ThemeData(fontFamily: 'Montserrat'),
    );
  }
}
