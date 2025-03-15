
import 'package:flutter/material.dart';
import 'package:flutter_application_2/active_entity.dart';
import 'package:flutter_application_2/block_component.dart';
import 'package:flutter_application_2/blocks_feature/data/block_model.dart';
import 'package:flutter_application_2/blocks_feature/presentation/draggable_block.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkSpace extends ConsumerWidget {
  const WorkSpace({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeEntity = ref.watch(activeEntityProvider);
    final blockComponent = activeEntity.getComponent<BlockComponent>();

    return DragTarget<BlockModel>(
      builder: (context, accepted, refused) => Container(
        width: double.infinity,
        color: Colors.blue,
        child: Stack(
          children: [
            // Render blocks from workspace (blocks that are not connected)
            if(blockComponent != null)...blockComponent.workSpaceBlocks.map((block) => Positioned(
                  top: block.position.dy,
                  left: block.position.dx,
                  child: DraggableBlock(blockModel: block),
                )),
            
            // Render blocks attached to active entity's BlockComponent
            if (blockComponent != null) ..._renderBlockChain(blockComponent.blockHead),
          ],
        ),
      ),
      onAcceptWithDetails: (details) {
        if (details.data.source == Source.workSpace) {
          details.data.updatePosition(details.offset);
        } else {
          if(blockComponent != null) {
            blockComponent.addBlockToWorkSpace(details.data,details.offset);
          }
        }
      },
    );
  }

  List<Widget> _renderBlockChain(BlockModel? block) {
    List<Widget> widgets = [];
    BlockModel? current = block;
    while (current != null) {
      widgets.add(Positioned(
        top: current.position.dy,
        left: current.position.dx,
        child: DraggableBlock(blockModel: current),
      ));
      current = current.child; // Move to the next block in the chain
    }
    return widgets;
  }
}

