import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/blocks_feature/data/block_model.dart';

class BlockWidget extends StatelessWidget {
  final BlockModel blockModel;
  const BlockWidget({super.key,required this.blockModel});

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: blockModel.color,
      width: blockModel.width,
      height: blockModel.height,
    );
  }
}