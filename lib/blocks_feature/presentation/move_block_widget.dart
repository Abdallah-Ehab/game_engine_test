
import 'package:flutter/material.dart';
import 'package:flutter_application_2/blocks_feature/data/block_model.dart';
import 'package:flutter_application_2/blocks_feature/presentation/play_animation_block_widget.dart';

class MoveBlockWidget extends StatelessWidget {
  final MoveBlock blockModel;
  const MoveBlockWidget({super.key, required this.blockModel});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CommandBlockPainter(color: blockModel.color),
      child: Container(
        width: blockModel.width,
        height: blockModel.height,
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Material(
              color: Colors.transparent, 
              child: Text(
                "move", 
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                )
              )
            ),
            const SizedBox(width: 10),
            
            // X direction input
            const Material(
              color: Colors.transparent, 
              child: Text(
                "x:", 
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                )
              )
            ),
            const SizedBox(width: 4),
            SizedBox(
              width: 50,
              height: 30,
              child: Material(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(4),
                child: TextField(
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                    border: InputBorder.none,
                  ),
                  controller: TextEditingController(text: blockModel.x.toString()),
                  onChanged: (value) {
                    blockModel.setXvalue(double.tryParse(value) ?? 0);
                  },
                ),
              ),
            ),
            
            const SizedBox(width: 10),
            
            // Y direction input
            const Material(
              color: Colors.transparent, 
              child: Text(
                "y:", 
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                )
              )
            ),
            const SizedBox(width: 4),
            SizedBox(
              width: 50,
              height: 30,
              child: Material(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(4),
                child: TextField(
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                    border: InputBorder.none,
                  ),
                  controller: TextEditingController(text: blockModel.y.toString()),
                  onChanged: (value) {
                    blockModel.setYvalue(double.tryParse(value) ?? 0);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}