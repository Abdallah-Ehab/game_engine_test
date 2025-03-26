import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/blocks_feature/data/block_model.dart';

class DraggedBlockNotifier extends ChangeNotifier {

  BlockModel? _draggedBlock;

  DraggedBlockNotifier();



  BlockModel? get draggedBlock => _draggedBlock;

  set draggedBLock(BlockModel draggedBlock){
    _draggedBlock = draggedBlock;
  }

}



