import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/Component/component.dart';

class Entity{

  Offset position;
  double rotation;
  double scale;
  String name;
  Map<Type,Component> components;
  Entity({required this.name, required this.position, required this.rotation, required this.scale, this.components = const {}});

  Entity copyWith({
    Offset? position,
    double? rotation,
    double? scale,
    String? name,
    Map<Type,Component>? components,
  }) {
    return Entity(
      name: name ?? this.name,
      position: position ?? this.position,
      rotation: rotation ?? this.rotation,
      scale: scale ?? this.scale,
      components: components ?? this.components,
    );
  }

  Entity addComponent(Component component) {
    return copyWith(components: {...components,component.runtimeType : component});
  }

  Entity removeComponent(Component component) {
    return copyWith(components: Map.from(components)..removeWhere((key, value) => value == component));
  }

  Entity update( Duration dt) {
    Map<Type,Component> updatedComponents = {};
    for(var entry in components.entries){
      updatedComponents[entry.key] = entry.value.update(dt);
    }
    return copyWith(components: updatedComponents);
  }

 T? getComponent<T extends Component>() {
  final component = components[T];
  if (component is T) return component;
  return null;
}

}