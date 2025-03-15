import 'dart:ui';

import 'package:flutter_application_2/Component/component.dart';
import 'package:flutter_application_2/Entity/entity.dart';
import 'package:flutter_application_2/animation_controller_component.dart';
import 'package:flutter_application_2/animation_track.dart';
import 'package:flutter_application_2/block_component.dart';
import 'package:flutter_application_2/blocks_feature/data/block_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:ui' as ui;

final entityManagerProvider =
    StateNotifierProvider<EntityManager, List<Entity>>(
        (ref) => EntityManager());

class EntityManager extends StateNotifier<List<Entity>> {
  EntityManager()
      : super([
          Entity(
              name: "goku",
              position: const Offset(0, 100),
              rotation: 0,
              scale: 1),
          Entity(
              name: "vegeta",
              position: const Offset(100, 100),
              rotation: 0,
              scale: -1)
        ]);

  get entities => state;

  void addEntity(Entity entity) {
    state = [...state, entity];
  }

  void removeEntity(Entity entity) {
    state = state.where((element) => element != entity).toList();
  }

  void addComponenentToEntity(Entity entity, Component component) {
    state = state.map((e) {
      if (e == entity) {
        return e.addComponent(component);
      }
      return e;
    }).toList();
  }

  void addFrameToAnimationTrack(
     Entity entity, String trackName, List<ui.Image> frames) {
    state = state.map(
      (e) {
        if (e != entity) return e;
        var animationControllerComponent =
            e.getComponent<AnimationControllerComponent>();
        var animationTrack =
            animationControllerComponent?.animationTracks[trackName] ??
                AnimationTrack(trackName, frames);
        animationTrack = animationTrack.addFrames(frames);
        var updatedAnimationControllerComponent = animationControllerComponent
                ?.addAnimationTrack(trackName, animationTrack) ??
            AnimationControllerComponent(
                currentFrame: 0,
                animationPlaying: true,
                lastUpdate: Duration.zero,
                currentAnimationTrackName: "idle",
                animationTracks: {});
        return e.addComponent(updatedAnimationControllerComponent);
      },
    ).toList();
  }

  void changeTrackNameToBePlayed(Entity entity, String newTrackName) {
    state = state.map(
      (e) {
        if (e != entity) return e;
        var animationControllerComponent =
            e.getComponent<AnimationControllerComponent>() ??
                AnimationControllerComponent();
        var updatedAnimationController =
            animationControllerComponent.setTrackNameToBePlayed(newTrackName);
        return e.addComponent(updatedAnimationController);
      },
    ).toList();
  }


  void moveEntity(Entity entity,{double? x, double? y}){
    state = state.map((e){
      if(e != entity) return e;
      var currentPosition = e.position;
      var updatedPosition = currentPosition + Offset(x ?? 0 ,y ?? 0);
      return e.copyWith(position: updatedPosition);
    }).toList();
  }

  void update(Duration dt) {
    state = state.map((e) => e.update(dt)).toList();
  }

  void addBlockToWorkSpace({required Entity entity,required BlockModel block,required Offset localOffset}){
    var blockComponent = entity.getComponent<BlockComponent>();
    state = state.map((e) {
      if(e != entity) return e;
      var updatedBlockComponent = blockComponent!.addBlockToWorkSpace(block, localOffset) ;
      return e.addComponent(updatedBlockComponent);
    },).toList();
  }

  void removeBlockFromWorkSpace({required Entity entity,required BlockModel block}){
    var blockComponent = entity.getComponent<BlockComponent>();
    state = state.map((e) {
      if(e != entity) return e;
      var updatedBlockComponent = blockComponent!.removeBlockFromWorkSpace(block) ;
      return e.addComponent(updatedBlockComponent);
    },).toList();
  }

}
