
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/active_entity.dart';
import 'package:flutter_application_2/block_component.dart';
import 'package:flutter_application_2/blocks_feature/data/block_model.dart';
import 'package:flutter_application_2/blocks_feature/presentation/block_widget.dart';
import 'package:flutter_application_2/blocks_feature/domain/draggable_block_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DraggableBlock extends ConsumerWidget {
  final BlockModel blockModel;
  const DraggableBlock({super.key, required this.blockModel});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    var activeEntity = ref.watch(activeEntityProvider);
    var blockComponent = activeEntity.getComponent<BlockComponent>();
    return blockModel.isDragTarget
        ? DragTarget<BlockModel>(
            builder: (context, accepted, denied) {
              return _buildDraggableBlock(blockModel,ref);
            },
            onAcceptWithDetails: (details){
              var draggedBlock = ref.watch(draggedBlockProvider);
              details.data.connectBlock(draggedBlock!);
              if(blockComponent != null){
                blockComponent.removeBlockFromWorkSpace(draggedBlock);
              }
            },
          )
        : _buildDraggableBlock(blockModel,ref);
  }
}

Widget _buildDraggableBlock(BlockModel blockModel,WidgetRef ref) {
  return Draggable<BlockModel>(
    data: blockModel,
    feedback:  BlockWidget(blockModel: blockModel,),
    childWhenDragging:  BlockWidget(blockModel: blockModel,),
    child:  BlockWidget(blockModel: blockModel,),
    onDragStarted: () {
      ref.read(draggedBlockProvider.notifier).setDraggedBlock(blockModel);
      var draggedBlock = ref.watch(draggedBlockProvider);
      if (draggedBlock!.isConnected) {
        draggedBlock.disconnectBlock();
      }
    },
    onDragUpdate: (details) {
      var draggedBlock = ref.watch(draggedBlockProvider);
      draggedBlock!.updatePosition(details.localPosition);
    },
  );
}













