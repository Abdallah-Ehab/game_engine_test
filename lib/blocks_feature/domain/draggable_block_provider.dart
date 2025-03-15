import 'package:flutter_application_2/blocks_feature/data/block_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DraggedBlockNotifier extends StateNotifier<BlockModel?> {
  DraggedBlockNotifier() : super(null);

  BlockModel? get draggedBLock => state;

  void setDraggedBlock(BlockModel? block) {
    state = block;
  }

  void clearDraggedBlock() {
    state = null;
  }
}

final draggedBlockProvider =
    StateNotifierProvider<DraggedBlockNotifier, BlockModel?>((ref) {
  return DraggedBlockNotifier();
});


