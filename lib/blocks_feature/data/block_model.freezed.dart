// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'block_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BlockModel {
  Offset get position;
  Color get color;
  double get width;
  double get height;
  bool get isConnected;
  Source get source;
  BlockModel? get child;
  BlockModel? get parent;
  bool get isDragTarget;

  /// Create a copy of BlockModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BlockModelCopyWith<BlockModel> get copyWith =>
      _$BlockModelCopyWithImpl<BlockModel>(this as BlockModel, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BlockModel &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.child, child) || other.child == child) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            (identical(other.isDragTarget, isDragTarget) ||
                other.isDragTarget == isDragTarget));
  }

  @override
  int get hashCode => Object.hash(runtimeType, position, color, width, height,
      isConnected, source, child, parent, isDragTarget);

  @override
  String toString() {
    return 'BlockModel(position: $position, color: $color, width: $width, height: $height, isConnected: $isConnected, source: $source, child: $child, parent: $parent, isDragTarget: $isDragTarget)';
  }
}

/// @nodoc
abstract mixin class $BlockModelCopyWith<$Res> {
  factory $BlockModelCopyWith(
          BlockModel value, $Res Function(BlockModel) _then) =
      _$BlockModelCopyWithImpl;
  @useResult
  $Res call(
      {Offset position,
      Color color,
      double width,
      double height,
      bool isConnected,
      Source source,
      BlockModel? child,
      BlockModel? parent,
      bool isDragTarget});

  $BlockModelCopyWith<$Res>? get child;
  $BlockModelCopyWith<$Res>? get parent;
}

/// @nodoc
class _$BlockModelCopyWithImpl<$Res> implements $BlockModelCopyWith<$Res> {
  _$BlockModelCopyWithImpl(this._self, this._then);

  final BlockModel _self;
  final $Res Function(BlockModel) _then;

  /// Create a copy of BlockModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? color = null,
    Object? width = null,
    Object? height = null,
    Object? isConnected = null,
    Object? source = null,
    Object? child = freezed,
    Object? parent = freezed,
    Object? isDragTarget = null,
  }) {
    return _then(_self.copyWith(
      position: null == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as Offset,
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      width: null == width
          ? _self.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      isConnected: null == isConnected
          ? _self.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as Source,
      child: freezed == child
          ? _self.child
          : child // ignore: cast_nullable_to_non_nullable
              as BlockModel?,
      parent: freezed == parent
          ? _self.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as BlockModel?,
      isDragTarget: null == isDragTarget
          ? _self.isDragTarget
          : isDragTarget // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of BlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BlockModelCopyWith<$Res>? get child {
    if (_self.child == null) {
      return null;
    }

    return $BlockModelCopyWith<$Res>(_self.child!, (value) {
      return _then(_self.copyWith(child: value));
    });
  }

  /// Create a copy of BlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BlockModelCopyWith<$Res>? get parent {
    if (_self.parent == null) {
      return null;
    }

    return $BlockModelCopyWith<$Res>(_self.parent!, (value) {
      return _then(_self.copyWith(parent: value));
    });
  }
}

/// @nodoc

class IfBlock extends BlockModel {
  const IfBlock(
      {required this.position,
      required this.color,
      required this.width,
      required this.height,
      this.isConnected = false,
      this.source = Source.storage,
      this.child,
      this.parent,
      final List<ConditionBlock> conditions = const [],
      required this.isDragTarget})
      : _conditions = conditions,
        super._();

  @override
  final Offset position;
  @override
  final Color color;
  @override
  final double width;
  @override
  final double height;
  @override
  @JsonKey()
  final bool isConnected;
  @override
  @JsonKey()
  final Source source;
  @override
  final BlockModel? child;
  @override
  final BlockModel? parent;
  final List<ConditionBlock> _conditions;
  @JsonKey()
  List<ConditionBlock> get conditions {
    if (_conditions is EqualUnmodifiableListView) return _conditions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conditions);
  }

  @override
  final bool isDragTarget;

  /// Create a copy of BlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IfBlockCopyWith<IfBlock> get copyWith =>
      _$IfBlockCopyWithImpl<IfBlock>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IfBlock &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.child, child) || other.child == child) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            const DeepCollectionEquality()
                .equals(other._conditions, _conditions) &&
            (identical(other.isDragTarget, isDragTarget) ||
                other.isDragTarget == isDragTarget));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      position,
      color,
      width,
      height,
      isConnected,
      source,
      child,
      parent,
      const DeepCollectionEquality().hash(_conditions),
      isDragTarget);

  @override
  String toString() {
    return 'BlockModel.ifBlock(position: $position, color: $color, width: $width, height: $height, isConnected: $isConnected, source: $source, child: $child, parent: $parent, conditions: $conditions, isDragTarget: $isDragTarget)';
  }
}

/// @nodoc
abstract mixin class $IfBlockCopyWith<$Res>
    implements $BlockModelCopyWith<$Res> {
  factory $IfBlockCopyWith(IfBlock value, $Res Function(IfBlock) _then) =
      _$IfBlockCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Offset position,
      Color color,
      double width,
      double height,
      bool isConnected,
      Source source,
      BlockModel? child,
      BlockModel? parent,
      List<ConditionBlock> conditions,
      bool isDragTarget});

  @override
  $BlockModelCopyWith<$Res>? get child;
  @override
  $BlockModelCopyWith<$Res>? get parent;
}

/// @nodoc
class _$IfBlockCopyWithImpl<$Res> implements $IfBlockCopyWith<$Res> {
  _$IfBlockCopyWithImpl(this._self, this._then);

  final IfBlock _self;
  final $Res Function(IfBlock) _then;

  /// Create a copy of BlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? position = null,
    Object? color = null,
    Object? width = null,
    Object? height = null,
    Object? isConnected = null,
    Object? source = null,
    Object? child = freezed,
    Object? parent = freezed,
    Object? conditions = null,
    Object? isDragTarget = null,
  }) {
    return _then(IfBlock(
      position: null == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as Offset,
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      width: null == width
          ? _self.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      isConnected: null == isConnected
          ? _self.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as Source,
      child: freezed == child
          ? _self.child
          : child // ignore: cast_nullable_to_non_nullable
              as BlockModel?,
      parent: freezed == parent
          ? _self.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as BlockModel?,
      conditions: null == conditions
          ? _self._conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as List<ConditionBlock>,
      isDragTarget: null == isDragTarget
          ? _self.isDragTarget
          : isDragTarget // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of BlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BlockModelCopyWith<$Res>? get child {
    if (_self.child == null) {
      return null;
    }

    return $BlockModelCopyWith<$Res>(_self.child!, (value) {
      return _then(_self.copyWith(child: value));
    });
  }

  /// Create a copy of BlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BlockModelCopyWith<$Res>? get parent {
    if (_self.parent == null) {
      return null;
    }

    return $BlockModelCopyWith<$Res>(_self.parent!, (value) {
      return _then(_self.copyWith(parent: value));
    });
  }
}

/// @nodoc

class PlayAnimationBlock extends BlockModel {
  const PlayAnimationBlock(
      {required this.position,
      required this.color,
      required this.width,
      required this.height,
      this.isConnected = false,
      this.source = Source.storage,
      this.child,
      this.parent,
      this.trackName,
      required this.isDragTarget})
      : super._();

  @override
  final Offset position;
  @override
  final Color color;
  @override
  final double width;
  @override
  final double height;
  @override
  @JsonKey()
  final bool isConnected;
  @override
  @JsonKey()
  final Source source;
  @override
  final BlockModel? child;
  @override
  final BlockModel? parent;
  final String? trackName;
  @override
  final bool isDragTarget;

  /// Create a copy of BlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlayAnimationBlockCopyWith<PlayAnimationBlock> get copyWith =>
      _$PlayAnimationBlockCopyWithImpl<PlayAnimationBlock>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlayAnimationBlock &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.child, child) || other.child == child) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            (identical(other.trackName, trackName) ||
                other.trackName == trackName) &&
            (identical(other.isDragTarget, isDragTarget) ||
                other.isDragTarget == isDragTarget));
  }

  @override
  int get hashCode => Object.hash(runtimeType, position, color, width, height,
      isConnected, source, child, parent, trackName, isDragTarget);

  @override
  String toString() {
    return 'BlockModel.playAnimationBlock(position: $position, color: $color, width: $width, height: $height, isConnected: $isConnected, source: $source, child: $child, parent: $parent, trackName: $trackName, isDragTarget: $isDragTarget)';
  }
}

/// @nodoc
abstract mixin class $PlayAnimationBlockCopyWith<$Res>
    implements $BlockModelCopyWith<$Res> {
  factory $PlayAnimationBlockCopyWith(
          PlayAnimationBlock value, $Res Function(PlayAnimationBlock) _then) =
      _$PlayAnimationBlockCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Offset position,
      Color color,
      double width,
      double height,
      bool isConnected,
      Source source,
      BlockModel? child,
      BlockModel? parent,
      String? trackName,
      bool isDragTarget});

  @override
  $BlockModelCopyWith<$Res>? get child;
  @override
  $BlockModelCopyWith<$Res>? get parent;
}

/// @nodoc
class _$PlayAnimationBlockCopyWithImpl<$Res>
    implements $PlayAnimationBlockCopyWith<$Res> {
  _$PlayAnimationBlockCopyWithImpl(this._self, this._then);

  final PlayAnimationBlock _self;
  final $Res Function(PlayAnimationBlock) _then;

  /// Create a copy of BlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? position = null,
    Object? color = null,
    Object? width = null,
    Object? height = null,
    Object? isConnected = null,
    Object? source = null,
    Object? child = freezed,
    Object? parent = freezed,
    Object? trackName = freezed,
    Object? isDragTarget = null,
  }) {
    return _then(PlayAnimationBlock(
      position: null == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as Offset,
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      width: null == width
          ? _self.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      isConnected: null == isConnected
          ? _self.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as Source,
      child: freezed == child
          ? _self.child
          : child // ignore: cast_nullable_to_non_nullable
              as BlockModel?,
      parent: freezed == parent
          ? _self.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as BlockModel?,
      trackName: freezed == trackName
          ? _self.trackName
          : trackName // ignore: cast_nullable_to_non_nullable
              as String?,
      isDragTarget: null == isDragTarget
          ? _self.isDragTarget
          : isDragTarget // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of BlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BlockModelCopyWith<$Res>? get child {
    if (_self.child == null) {
      return null;
    }

    return $BlockModelCopyWith<$Res>(_self.child!, (value) {
      return _then(_self.copyWith(child: value));
    });
  }

  /// Create a copy of BlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BlockModelCopyWith<$Res>? get parent {
    if (_self.parent == null) {
      return null;
    }

    return $BlockModelCopyWith<$Res>(_self.parent!, (value) {
      return _then(_self.copyWith(parent: value));
    });
  }
}

/// @nodoc

class ConditionBlock extends BlockModel {
  const ConditionBlock(
      {required this.position,
      required this.color,
      required this.width,
      required this.height,
      this.isConnected = false,
      this.source = Source.storage,
      this.child,
      this.parent,
      this.firstOperand,
      this.comparisonOperator,
      this.secondOperand,
      required this.isDragTarget})
      : super._();

  @override
  final Offset position;
  @override
  final Color color;
  @override
  final double width;
  @override
  final double height;
  @override
  @JsonKey()
  final bool isConnected;
  @override
  @JsonKey()
  final Source source;
  @override
  final BlockModel? child;
  @override
  final BlockModel? parent;
  final String? firstOperand;
  final String? comparisonOperator;
  final String? secondOperand;
  @override
  final bool isDragTarget;

  /// Create a copy of BlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConditionBlockCopyWith<ConditionBlock> get copyWith =>
      _$ConditionBlockCopyWithImpl<ConditionBlock>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ConditionBlock &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.child, child) || other.child == child) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            (identical(other.firstOperand, firstOperand) ||
                other.firstOperand == firstOperand) &&
            (identical(other.comparisonOperator, comparisonOperator) ||
                other.comparisonOperator == comparisonOperator) &&
            (identical(other.secondOperand, secondOperand) ||
                other.secondOperand == secondOperand) &&
            (identical(other.isDragTarget, isDragTarget) ||
                other.isDragTarget == isDragTarget));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      position,
      color,
      width,
      height,
      isConnected,
      source,
      child,
      parent,
      firstOperand,
      comparisonOperator,
      secondOperand,
      isDragTarget);

  @override
  String toString() {
    return 'BlockModel.conditionBlock(position: $position, color: $color, width: $width, height: $height, isConnected: $isConnected, source: $source, child: $child, parent: $parent, firstOperand: $firstOperand, comparisonOperator: $comparisonOperator, secondOperand: $secondOperand, isDragTarget: $isDragTarget)';
  }
}

/// @nodoc
abstract mixin class $ConditionBlockCopyWith<$Res>
    implements $BlockModelCopyWith<$Res> {
  factory $ConditionBlockCopyWith(
          ConditionBlock value, $Res Function(ConditionBlock) _then) =
      _$ConditionBlockCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Offset position,
      Color color,
      double width,
      double height,
      bool isConnected,
      Source source,
      BlockModel? child,
      BlockModel? parent,
      String? firstOperand,
      String? comparisonOperator,
      String? secondOperand,
      bool isDragTarget});

  @override
  $BlockModelCopyWith<$Res>? get child;
  @override
  $BlockModelCopyWith<$Res>? get parent;
}

/// @nodoc
class _$ConditionBlockCopyWithImpl<$Res>
    implements $ConditionBlockCopyWith<$Res> {
  _$ConditionBlockCopyWithImpl(this._self, this._then);

  final ConditionBlock _self;
  final $Res Function(ConditionBlock) _then;

  /// Create a copy of BlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? position = null,
    Object? color = null,
    Object? width = null,
    Object? height = null,
    Object? isConnected = null,
    Object? source = null,
    Object? child = freezed,
    Object? parent = freezed,
    Object? firstOperand = freezed,
    Object? comparisonOperator = freezed,
    Object? secondOperand = freezed,
    Object? isDragTarget = null,
  }) {
    return _then(ConditionBlock(
      position: null == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as Offset,
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      width: null == width
          ? _self.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      isConnected: null == isConnected
          ? _self.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as Source,
      child: freezed == child
          ? _self.child
          : child // ignore: cast_nullable_to_non_nullable
              as BlockModel?,
      parent: freezed == parent
          ? _self.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as BlockModel?,
      firstOperand: freezed == firstOperand
          ? _self.firstOperand
          : firstOperand // ignore: cast_nullable_to_non_nullable
              as String?,
      comparisonOperator: freezed == comparisonOperator
          ? _self.comparisonOperator
          : comparisonOperator // ignore: cast_nullable_to_non_nullable
              as String?,
      secondOperand: freezed == secondOperand
          ? _self.secondOperand
          : secondOperand // ignore: cast_nullable_to_non_nullable
              as String?,
      isDragTarget: null == isDragTarget
          ? _self.isDragTarget
          : isDragTarget // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of BlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BlockModelCopyWith<$Res>? get child {
    if (_self.child == null) {
      return null;
    }

    return $BlockModelCopyWith<$Res>(_self.child!, (value) {
      return _then(_self.copyWith(child: value));
    });
  }

  /// Create a copy of BlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BlockModelCopyWith<$Res>? get parent {
    if (_self.parent == null) {
      return null;
    }

    return $BlockModelCopyWith<$Res>(_self.parent!, (value) {
      return _then(_self.copyWith(parent: value));
    });
  }
}

/// @nodoc

class MoveBlock extends BlockModel {
  const MoveBlock(
      {required this.position,
      required this.color,
      required this.width,
      required this.height,
      this.isConnected = false,
      this.source = Source.storage,
      this.child,
      this.parent,
      this.x = 0.0,
      this.y = 0.0,
      required this.isDragTarget})
      : super._();

  @override
  final Offset position;
  @override
  final Color color;
  @override
  final double width;
  @override
  final double height;
  @override
  @JsonKey()
  final bool isConnected;
  @override
  @JsonKey()
  final Source source;
  @override
  final BlockModel? child;
  @override
  final BlockModel? parent;
  @JsonKey()
  final double x;
  @JsonKey()
  final double y;
  @override
  final bool isDragTarget;

  /// Create a copy of BlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MoveBlockCopyWith<MoveBlock> get copyWith =>
      _$MoveBlockCopyWithImpl<MoveBlock>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MoveBlock &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.child, child) || other.child == child) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.isDragTarget, isDragTarget) ||
                other.isDragTarget == isDragTarget));
  }

  @override
  int get hashCode => Object.hash(runtimeType, position, color, width, height,
      isConnected, source, child, parent, x, y, isDragTarget);

  @override
  String toString() {
    return 'BlockModel.MoveBlock(position: $position, color: $color, width: $width, height: $height, isConnected: $isConnected, source: $source, child: $child, parent: $parent, x: $x, y: $y, isDragTarget: $isDragTarget)';
  }
}

/// @nodoc
abstract mixin class $MoveBlockCopyWith<$Res>
    implements $BlockModelCopyWith<$Res> {
  factory $MoveBlockCopyWith(MoveBlock value, $Res Function(MoveBlock) _then) =
      _$MoveBlockCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Offset position,
      Color color,
      double width,
      double height,
      bool isConnected,
      Source source,
      BlockModel? child,
      BlockModel? parent,
      double x,
      double y,
      bool isDragTarget});

  @override
  $BlockModelCopyWith<$Res>? get child;
  @override
  $BlockModelCopyWith<$Res>? get parent;
}

/// @nodoc
class _$MoveBlockCopyWithImpl<$Res> implements $MoveBlockCopyWith<$Res> {
  _$MoveBlockCopyWithImpl(this._self, this._then);

  final MoveBlock _self;
  final $Res Function(MoveBlock) _then;

  /// Create a copy of BlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? position = null,
    Object? color = null,
    Object? width = null,
    Object? height = null,
    Object? isConnected = null,
    Object? source = null,
    Object? child = freezed,
    Object? parent = freezed,
    Object? x = null,
    Object? y = null,
    Object? isDragTarget = null,
  }) {
    return _then(MoveBlock(
      position: null == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as Offset,
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      width: null == width
          ? _self.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      height: null == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      isConnected: null == isConnected
          ? _self.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as Source,
      child: freezed == child
          ? _self.child
          : child // ignore: cast_nullable_to_non_nullable
              as BlockModel?,
      parent: freezed == parent
          ? _self.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as BlockModel?,
      x: null == x
          ? _self.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _self.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
      isDragTarget: null == isDragTarget
          ? _self.isDragTarget
          : isDragTarget // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of BlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BlockModelCopyWith<$Res>? get child {
    if (_self.child == null) {
      return null;
    }

    return $BlockModelCopyWith<$Res>(_self.child!, (value) {
      return _then(_self.copyWith(child: value));
    });
  }

  /// Create a copy of BlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BlockModelCopyWith<$Res>? get parent {
    if (_self.parent == null) {
      return null;
    }

    return $BlockModelCopyWith<$Res>(_self.parent!, (value) {
      return _then(_self.copyWith(parent: value));
    });
  }
}

// dart format on
