import 'package:flutter/material.dart';
import 'package:flutter_application_2/Entity/data/entity.dart';
import 'package:flutter_application_2/Entity/data/entity_manager.dart';
import 'package:flutter_application_2/animation_editor_scene/presentation/animation_editor_screen.dart';
import 'package:flutter_application_2/animation_feature/data/animation_controller_component.dart';
import 'package:flutter_application_2/blocks_feature/data/block_component.dart';
import 'package:flutter_application_2/blocks_feature/presentation/block_test_screen.dart';
import 'package:provider/provider.dart';



class ControlPanel extends StatelessWidget {
  const ControlPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<EntityManager>(
      builder: (context, entityManager, child) {
        final entity = entityManager.activeEntity;

        return ChangeNotifierProvider.value(
          value: entity,
          child: Consumer<Entity>(

            builder: (context, entity, child) =>  SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Entity Properties
                  _buildEntityProperties(context, entity),
                  const Divider(),
                  // Component Panels
                  _buildComponentPanels(context, entity),
                  const Divider(),
                  // Variables Display
                  _buildVariablesDisplay(context, entity),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildEntityProperties(BuildContext context, Entity entity) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Entity: ${entity.name}', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 10),
        // Name Editor
        TextField(
          decoration: const InputDecoration(labelText: 'Name'),
          controller: TextEditingController(text: entity.name),
          onChanged: (value) => entity.setName(value),
        ),
        // Position Editors
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: const InputDecoration(labelText: 'X'),
                keyboardType: TextInputType.number,
                controller: TextEditingController(text: entity.position.dx.toString()),
                onChanged: (value) => entity.move(x: double.tryParse(value) ?? entity.position.dx),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: const InputDecoration(labelText: 'Y'),
                keyboardType: TextInputType.number,
                controller: TextEditingController(text: entity.position.dy.toString()),
                onChanged: (value) => entity.move(y: double.tryParse(value) ?? entity.position.dy),
              ),
            ),
          ],
        ),
        // Rotation Editor
        Slider(
          value: entity.rotation,
          min: 0,
          max: 10,
          divisions: 10,
          label: 'Rotation: ${entity.rotation.toStringAsFixed(0)}°',
          onChanged: (value) => entity.rotate(value),
        ),
        // Scale Editor
        Slider(
          value: entity.scale,
          min: 0.1,
          max: 2.0,
          divisions: 19,
          label: 'Scale: ${entity.scale.toStringAsFixed(1)}',
          onChanged: (value) => entity.scaleEntity(value),
        ),
      ],
    );
  }

  Widget _buildComponentPanels(BuildContext context, Entity entity) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Components', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 10),
        // Animation Component Panel
        if (entity.getComponent<AnimationControllerComponent>() != null)
          _buildAnimationComponentPanel(context, entity),
        // Block Component Panel
        if (entity.getComponent<BlockComponent>() != null)
          _buildBlockComponentPanel(context, entity),
      ],
    );
  }

  Widget _buildAnimationComponentPanel(BuildContext context, Entity entity) {
    final animationComponent = entity.getComponent<AnimationControllerComponent>()!;
    return Card(
      child: ListTile(
        title: const Text('Animation Component'),
        subtitle: ChangeNotifierProvider.value(
          value: animationComponent,
          child: Consumer<AnimationControllerComponent>(
            builder: (context, component, child) {
              return DropdownButton<String>(
                value: component.currentAnimationTrack.name, // Assume this exists
                items: component.animationTracks.keys.map((trackName) {
                  return DropdownMenuItem<String>(
                    value: trackName,
                    child: Text(trackName),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    component.setTrack(value); // Assume this method exists
                  }
                },
              );
            },
          ),
        ),
        leading: Checkbox(
          value: animationComponent.isActive,
          onChanged: (value) {
            if (value != null) {
              entity.toggleComponent(AnimationControllerComponent);
            }
          },
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AnimationEditorScreen()),
          );
        },
      ),
    );
  }

  Widget _buildBlockComponentPanel(BuildContext context, Entity entity) {
    final blockComponent = entity.getComponent<BlockComponent>()!;
    return Card(
      child: ListTile(
        title: const Text('Block Component'),
        leading: Checkbox(
          value: blockComponent.isActive,
          onChanged: (value) {
            if (value != null) {
              entity.toggleComponent(BlockComponent);
            }
          },
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BlockTestScreen()),
          );
        },
      ),
    );
  }

  Widget _buildVariablesDisplay(BuildContext context, Entity entity) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Variables', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 10),
        if (entity.variables.isEmpty)
          const Text('No variables declared')
        else
          ...entity.variables.entries.map((entry) {
            final key = entry.key;
            final value = entry.value;
            if (value is bool) {
              return CheckboxListTile(
                title: Text(key),
                value: value,
                onChanged: (newValue) {
                  if (newValue != null) {
                    entity.setVariableXToValueY(key, newValue);
                  }
                },
              );
            } else if (value is int || value is double) {
              return Slider(
                value: (value as num).toDouble(),
                min: 0, // Adjust min/max based on your needs
                max: 100,
                divisions: 100,
                label: '$key: $value',
                onChanged: (newValue) {
                  entity.setVariableXToValueY(key, value is int ? newValue.round() : newValue);
                },
              );
            } else {
              return TextField(
                decoration: InputDecoration(labelText: key),
                controller: TextEditingController(text: value.toString()),
                onChanged: (newValue) {
                  entity.setVariableXToValueY(key, newValue);
                },
              );
            }
          }),
      ],
    );
  }
}