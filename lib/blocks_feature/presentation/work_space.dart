import 'package:flutter/material.dart';
import 'package:flutter_application_2/Entity/data/entity.dart';
import 'package:flutter_application_2/Entity/data/entity_manager.dart';
import 'package:flutter_application_2/blocks_feature/data/block_component.dart';
import 'package:flutter_application_2/blocks_feature/data/block_model.dart';
import 'package:flutter_application_2/blocks_feature/presentation/draggable_block.dart';
import 'package:provider/provider.dart';

class WorkSpace extends StatelessWidget {
  const WorkSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<EntityManager>(builder: (context, entityManager, child) {
      var activeEntity = entityManager.activeEntity;
      return ChangeNotifierProvider.value(
        value: activeEntity,
        child: Consumer<Entity>(
          builder: (context, activeEntity, child) {
            final blockComponent = activeEntity.getComponent<BlockComponent>();

            if (blockComponent == null) {
              return const Center(child: Text('No block component attached'));
            }

            // Provide the BlockComponent locally and listen to its changes
            return ChangeNotifierProvider.value(
              value: blockComponent,
              child: Consumer<BlockComponent>(
                builder: (context, blockComponent, child) {
                  return DragTarget<BlockModel>(
                    builder: (context, accepted, refused) => Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.blue.shade100,
                      child: Stack(
                        children: blockComponent.workSpaceBlocks.map((block) {
                          return ChangeNotifierProvider.value(
                            value: block,
                            child: Consumer<BlockModel>(
                              builder: (context, block, child) {
                                return Positioned(
                                  top: block.position.dy,
                                  left: block.position.dx,
                                  child: DraggableBlock(blockModel: block),
                                );
                              },
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    onAcceptWithDetails: 
                    (details) {
                      final block = details.data;
                      final blockComponent =
                          activeEntity.getComponent<BlockComponent>();
                      if (blockComponent != null) {
                        final existingBlock = blockComponent.workSpaceBlocks
                            .firstWhereOrNull((b) => b.id == block.id);
                        if (existingBlock != null) {
                          // Update position of existing block
                          existingBlock.updatePosition(details.offset);
                        } else {
                          // Add a new block with a unique ID
                          var newBlock = block.copyWith(
                            position: details.offset,
                          );
                          blockComponent.addBlockToWorkSpace(newBlock);
                        }
                      }
                    },
                  );
                },
              ),
            );
          },
        ),
      );
    });
  }
}

// Assuming this extension is still needed
extension ListExtension<T> on List<T> {
  T? firstWhereOrNull(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}
