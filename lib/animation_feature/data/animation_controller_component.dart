import 'package:flutter_application_2/Component/component.dart';
import 'package:flutter_application_2/Entity/data/entity.dart';
import 'package:flutter_application_2/animation_feature/data/animation_track.dart';

class AnimationControllerComponent extends Component {
  int _currentFrame = 0;
  bool animationPlaying = true;
  Duration lastUpdate = Duration.zero;
  String _currentAnimationTrackName = "idle";
  List<Transition> transitions = [
    Transition(Condition(entityVariable: "x", secondOperand: 1, operantor: ">"),
        "walk")
  ];
  Map<String, AnimationTrack> animationTracks = {
    "idle": AnimationTrack("idle", [KeyFrame(sketches: [])])
  };

  void addTrack(String name, {int fps = 10, AnimationTrack? track}) {
    if (track != null) {
      animationTracks[name] = track;
      notifyListeners();
      return;
    }
    animationTracks[name] = AnimationTrack(name, [], fps: fps);
    _currentAnimationTrackName = name;
    notifyListeners();
  }

  set currentFrame(int currentFrame) {
    _currentFrame = currentFrame;
    notifyListeners();
  }

  int get currentFrame => _currentFrame;

  AnimationTrack get currentAnimationTrack =>
      animationTracks[_currentAnimationTrackName]!;

  void setTrack(String name) {
    if (name == _currentAnimationTrackName) return;
    if (animationTracks.containsKey(name)) {
      _currentAnimationTrackName = name;
      currentFrame = 0;
      animationPlaying = true;
    }
    notifyListeners();
  }

  void addFramesToAnimationTracK(
      {required String trackName, required List<KeyFrame> frames}) {
    animationTracks[trackName]!.frames.addAll(frames);
    notifyListeners();
  }

  @override
  void update(Duration dt, {required Entity activeEntity}) {
    for (Transition transition in transitions) {
      transition.execute(activeEntity, this);
    }
    final track = animationTracks[_currentAnimationTrackName]!;
    final frameDuration = Duration(milliseconds: 1000 ~/ track.fps);
    if (dt - lastUpdate >= frameDuration) {
      _currentFrame = (_currentFrame + 1) % track.frames.length;
      lastUpdate = dt;
    }
    notifyListeners();
  }
}

class Transition {
  Condition condition;
  String targetTrackName;
  Transition(this.condition, this.targetTrackName);

  void execute(Entity entity, AnimationControllerComponent animComponent) {
    if (condition.execute(entity)) {
      animComponent.setTrack(targetTrackName);
    }
  }
}

class Condition {
  String entityVariable;
  double secondOperand;
  String operantor;
  Condition(
      {required this.entityVariable,
      required this.secondOperand,
      required this.operantor});
  bool execute(Entity entity) {
    if (entity.variables[entityVariable] == null) return false;
    switch (operantor) {
      case "==":
        return entity.variables[entityVariable] == secondOperand;

      case ">":
        return entity.variables[entityVariable] > secondOperand;

      case "<":
        return entity.variables[entityVariable] < secondOperand;

      case ">=":
        return entity.variables[entityVariable] >= secondOperand;
      case "<=":
        return entity.variables[entityVariable] <= secondOperand;
      case "!=":
        return entity.variables[entityVariable] != secondOperand;
      default:
        return false;
    }
  }
}
