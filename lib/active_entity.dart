import 'dart:ui';

import 'package:flutter_application_2/Entity/entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final activeEntityProvider =
    StateNotifierProvider<ActiveEntityNotifier, Entity>((ref) {
  return ActiveEntityNotifier();
});

class ActiveEntityNotifier extends StateNotifier<Entity> {
  ActiveEntityNotifier()
      : super(
          Entity(
              name: "goku",
              position: const Offset(0, 100),
              rotation: 0,
              scale: 1),
        );

  Entity get activeEntity => state;

  void setActiveEntity(Entity entity) {
    state = entity;
  }
}
