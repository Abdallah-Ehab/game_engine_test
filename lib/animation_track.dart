import 'dart:ui' as ui;

class AnimationTrack {
  final String name;
  final List<ui.Image> frames;

  AnimationTrack(this.name, this.frames);

  int get length => frames.length;

  AnimationTrack copyWith({
    String? name,
    List<ui.Image>? frames,
  }) {
    return AnimationTrack(
      name ?? this.name,
      frames ?? this.frames,
    );
  }

  AnimationTrack addFrames(List<ui.Image> newFrames){
    return copyWith(frames: [...frames,...newFrames]);
  }
}