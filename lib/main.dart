import 'package:flutter_application_2/Entity/entity_manager.dart';
import 'package:flutter_application_2/animation_controller_component.dart';
import 'package:flutter_application_2/animation_track.dart';
import 'package:flutter_application_2/game_scene.dart';
import 'package:flutter_application_2/image_loader.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'dart:ui' as ui;


void main() {
  runApp(const ProviderScope(child: AnimationTestApp()));
}

class AnimationTestApp extends StatelessWidget {
  const AnimationTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GameLoop(child:GameScene()),
    );
  }
}

class GameLoop extends ConsumerStatefulWidget {
  final Widget child;
  
  const GameLoop({super.key, required this.child});

  @override
  ConsumerState<GameLoop> createState() => _GameLoopState();
}

class _GameLoopState extends ConsumerState<GameLoop> with TickerProviderStateMixin {
  late final Ticker _ticker;
  bool _isLoading = true;
  late EntityManager entityManager;
  @override
  void initState() {
    super.initState();
    entityManager = ref.read(entityManagerProvider.notifier);
    _initializeGame();
  }

  Future<void> _initializeGame() async {

   for(var entity in entityManager.entities){
    List<ui.Image> idleFrames = await ImageLoader.loadImages(animationName: "idle", character: entity.name, animationLength: 4);
    List<ui.Image> walkFrames = await ImageLoader.loadImages(animationName: "walk", character: entity.name, animationLength: 6);
    var idleAnimationTrack = AnimationTrack("idle", idleFrames);
    var walkAnimationTrack = AnimationTrack("walk", walkFrames);
    entityManager.addComponenentToEntity(entity.name,AnimationControllerComponent(animationTracks: {"idle": idleAnimationTrack,"walk":walkAnimationTrack}));
   }
    setState(() => _isLoading = false);
    _ticker = createTicker(_onTick)..start();
  }

  void _onTick(Duration elapsed) {
    ref.read(entityManagerProvider.notifier).update(elapsed);
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : widget.child;
  }
}