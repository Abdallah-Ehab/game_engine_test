import 'package:flutter_application_2/Entity/data/entity_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/game_scene/add_components.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EntityManager()),
        ChangeNotifierProvider(create: (context){
          final entityManager = Provider.of<EntityManager>(context, listen: false);
          return entityManager.activeEntity;
        })
      ],
      child: const MaterialApp(
        home: AddComponents(),
      ),
    );
  }
}
