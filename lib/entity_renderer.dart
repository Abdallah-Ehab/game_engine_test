import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/Entity/entity.dart';
import 'package:flutter_application_2/animation_controller_component.dart';

class EntityRenderer extends StatelessWidget {
  final Entity entity;
  const EntityRenderer({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64, // Adjust size based on entity
      height: 64,
      child: CustomPaint(
        painter: EntityPainter(entity),
      ),
    );
  }
}

class EntityPainter extends CustomPainter {
  final Entity entity;

  EntityPainter(this.entity);

  @override
  void paint(Canvas canvas, Size size) {
    var animationController = entity.getComponent<AnimationControllerComponent>();
    if (animationController == null) return;
    
    var currentTrack = animationController.animationTracks[animationController.currentAnimationTrackName];
    if (currentTrack == null || currentTrack.frames.isEmpty) return;
    
    var frame = currentTrack.frames[animationController.currentFrame];
    
    
    paintImage(
      canvas: canvas,
      rect: Rect.fromLTWH(0, 0, size.width, size.height),
      image: frame,
      fit: BoxFit.contain,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
