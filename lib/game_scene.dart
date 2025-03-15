import 'package:flutter/material.dart';
import 'package:flutter_application_2/Entity/entity_manager.dart';
import 'package:flutter_application_2/active_entity.dart';
import 'package:flutter_application_2/entity_renderer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameScene extends ConsumerWidget {
  const GameScene({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var entities = ref.watch(entityManagerProvider);
    var activeEntity = ref.read(activeEntityProvider.notifier).activeEntity;
    return Stack(
      children: [
        Container(
          color: Colors.grey,
          width: double.infinity,
          height: double.infinity,
        ),
        ...entities.map((entity) => Transform(
              transform: Matrix4.identity()
                ..translate(entity.position.dx, entity.position.dy)
                ..rotateZ(entity.rotation)
                ..scale(entity.scale * 3.0,3.0,10.0),
              child: EntityRenderer(entity: entity),
            )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              ElevatedButton(onPressed: (){
                
                ref.read(entityManagerProvider.notifier).changeTrackNameToBePlayed(activeEntity, "idle");
              }, child: const Text("idle")),
              const SizedBox(width: 20,),
              ElevatedButton(onPressed: (){
                ref.read(entityManagerProvider.notifier).changeTrackNameToBePlayed(activeEntity, "walk");
              }, child: const Text("walk"))
            ],
          ),
        )
      ],
    );
  }
}
