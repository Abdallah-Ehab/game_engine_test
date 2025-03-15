import 'dart:ui';

import 'package:flutter_application_2/Component/component.dart';
import 'package:flutter_application_2/blocks_feature/data/block_model.dart';

class BlockComponent implements Component {
  final BlockModel blockHead;
  final List<BlockModel> workSpaceBlocks;

  BlockComponent({
    required this.blockHead,
    List<BlockModel>? workSpaceBlocks,
  }) : workSpaceBlocks = workSpaceBlocks ?? [blockHead];

  BlockComponent copyWith({List<BlockModel>? workSpaceBlocks}) {
    return BlockComponent(
      blockHead: blockHead,
      workSpaceBlocks: workSpaceBlocks ?? this.workSpaceBlocks,
    );
  }

  BlockComponent addBlockToWorkSpace(BlockModel block, Offset localOffset) {
    final updatedBlock = block.copyWith(position: localOffset, source: Source.workSpace);
    return copyWith(workSpaceBlocks: [...workSpaceBlocks, updatedBlock]);
  }

  BlockComponent removeBlockFromWorkSpace(BlockModel block) {
    if (workSpaceBlocks.contains(block)) {
      return copyWith(workSpaceBlocks: workSpaceBlocks.where((e) => e != block).toList());
    } else {
      return this;
    }
  }

  @override
  Component update(Duration dt) {
    const updateInterval = Duration(milliseconds: 1000 ~/ 12);
    if (dt < updateInterval) {
      return this;
    }
    BlockModel? current = blockHead;
    while (current != null) {
      current.execute();
      current = current.child;
    }
    return this;
  }
}



// abstract class BlockModel{
//   Offset position;
//   double height;
//   double width;
//   BlockModel? child;
//   BlockModel? parent;
//   bool isConnected;
//   Color color;
//   Source source;
//   bool isDragTarget;
//   BlockModel({required this.isDragTarget,required this.source,this.child,required this.position,required this.width,required this.height,this.parent,this.isConnected = false,required this.color});
  
//   Result execute([EntityManager? entityManager]);

//   BlockModel copyWith({
//     Offset? position,
//     double? height,
//     double? width,
//     BlockModel? child,
//     BlockModel? parent,
//     bool? isConnected,
//     Source? source,
//   });

//   BlockModel connectBlock(BlockModel childBlock){
//     if((childBlock.position - position).distance < 10 ){
//       return childBlock.copyWith(position: position - Offset(position.dx,height),parent: this,isConnected: true);
//     }else{
//       return this;
//     }
//   }

//   BlockModel disconnectBlock(){
//     return copyWith(isConnected: false,parent: null);
//   }

//   BlockModel updatePosition(Offset localOffset){
//     return copyWith(position: localOffset);
//   }

//   BlockModel addToWorkSpace(Offset localOffset){
//     return copyWith(position: localOffset,source: Source.workSpace);
//   }

// }




