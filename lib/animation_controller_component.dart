
import 'package:flutter_application_2/Component/component.dart';
import 'package:flutter_application_2/animation_track.dart';

class AnimationControllerComponent
    implements Component {
  int currentFrame;
  bool animationPlaying;
  Duration lastUpdate;
  String currentAnimationTrackName;
  Map<String, AnimationTrack> animationTracks;

  AnimationControllerComponent({
     this.currentFrame = 0,
     this.animationPlaying = true,
     this.lastUpdate = Duration.zero,
     this.currentAnimationTrackName = "idle",
     this.animationTracks = const {},
  });

 

  AnimationControllerComponent copyWith({
    int? currentFrame,
    bool? animationPlaying,
    Duration? lastUpdate,
    String? currentAnimationTrackName,
    Map<String, AnimationTrack>? animationTracks,
  }) {
    return AnimationControllerComponent(
      currentFrame: currentFrame ?? this.currentFrame,
      animationPlaying: animationPlaying ?? this.animationPlaying,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      currentAnimationTrackName:
          currentAnimationTrackName ?? this.currentAnimationTrackName,
      animationTracks: animationTracks ?? this.animationTracks,
    );
  }

  @override
  AnimationControllerComponent update(Duration elapsed) {
    if (!animationPlaying) return this;

    var frameDuration = const Duration(milliseconds: 1000 ~/ 12);
    if (elapsed - lastUpdate > frameDuration) {
      return copyWith(
        currentFrame: ((currentFrame + 1) %
            animationTracks[currentAnimationTrackName]!
                .frames
                .length), // Assume 60 frames max
        lastUpdate: elapsed,
      );
    }
    return this;
  }

  AnimationControllerComponent setTrackNameToBePlayed(String trackName) {
    if (currentAnimationTrackName != trackName) {
      return copyWith(currentFrame: 0,animationPlaying: true,currentAnimationTrackName: trackName);
    }
    return this;
  }

  AnimationControllerComponent addAnimationTrack(String trackName,AnimationTrack newAnimationTrack){
    return copyWith(animationTracks: {...animationTracks,trackName:newAnimationTrack});
  }
}
