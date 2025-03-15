import 'dart:ui';
import 'package:flutter_application_2/Entity/entity.dart';
import 'package:flutter_application_2/Entity/entity_manager.dart';
import 'package:flutter_application_2/result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'block_model.freezed.dart';

enum Source {
  workSpace,
  storage,
}

@freezed
sealed class BlockModel with _$BlockModel {
  const BlockModel._();

  const factory BlockModel.ifBlock({
    required Offset position,
    required Color color,
    required double width,
    required double height,
    @Default(false) bool isConnected,
    @Default(Source.storage) Source source,
    BlockModel? child,
    BlockModel? parent,
    @Default([]) List<ConditionBlock> conditions,
    required bool isDragTarget,
  }) = IfBlock;

  const factory BlockModel.playAnimationBlock({
    required Offset position,
    required Color color,
    required double width,
    required double height,
    @Default(false) bool isConnected,
    @Default(Source.storage) Source source,
    BlockModel? child,
    BlockModel? parent,
    String? trackName,
    required bool isDragTarget,
  }) = PlayAnimationBlock;

  const factory BlockModel.conditionBlock({
    required Offset position,
    required Color color,
    required double width,
    required double height,
    @Default(false) bool isConnected,
    @Default(Source.storage) Source source,
    BlockModel? child,
    BlockModel? parent,
    String? firstOperand,
    String? comparisonOperator,
    String? secondOperand,
    required bool isDragTarget,
  }) = ConditionBlock;

  const factory BlockModel.MoveBlock({
    required Offset position,
    required Color color,
    required double width,
    required double height,
    @Default(false) bool isConnected,
    @Default(Source.storage) Source source,
    BlockModel? child,
    BlockModel? parent,
    @Default(0.0) double x,
    @Default(0.0) double y,
    required bool isDragTarget,
  }) = MoveBlock; 

  BlockModel connectBlock(BlockModel childBlock) {
    if ((childBlock.position - position).distance < 10) {
      return childBlock.copyWith(
          position: position - Offset(position.dx, height),
          parent: this,
          isConnected: true,source: Source.workSpace);
    } else {
      return this;
    }
  }

  BlockModel disconnectBlock() {
    return copyWithNullable(resetParent: true);
  }

  BlockModel updatePosition(Offset localOffset) {
    return copyWith(position: localOffset);
  }

  BlockModel addToWorkSpace(Offset localOffset) {
    return copyWith(position: localOffset, source: Source.workSpace);
  }
}

extension BlockModelX on BlockModel {
  Result execute([EntityManager? entityManager,Entity? activeEntity]) {
    switch (this) {
      case IfBlock():
        final block = this as IfBlock;
        for (var condition in block.conditions) {
          Result conditionResult = condition.execute(entityManager);
          if (conditionResult.errorMessage != null) {
            return Result.failure(errorMessage: conditionResult.errorMessage);
          }
          if (conditionResult.result != null && !conditionResult.result!) {
            return Result.success(result: false);
          }
        }
        block.child?.execute(entityManager);
        return Result.success(result: true);

      case PlayAnimationBlock():
        final block = this as PlayAnimationBlock;
        if (block.trackName == null) {
          return Result.failure(errorMessage: "No trackName specified");
        }
        if (entityManager == null) {
          return Result.failure(errorMessage: "Entity manager not provided");
        }if(activeEntity == null){
          return Result.failure(errorMessage: "active entity not provided");
        }
        entityManager.changeTrackNameToBePlayed(activeEntity, block.trackName!);
        return Result.success(
            result: "Animation changed to ${block.trackName}");

      case ConditionBlock():
        final block = this as ConditionBlock;
        if (block.firstOperand == null ||
            block.secondOperand == null ||
            block.comparisonOperator == null) {
          return Result.failure(errorMessage: "Missing operand or operator");
        }
        switch (block.comparisonOperator) {
          case "==":
            return Result.success(
                result: block.firstOperand == block.secondOperand);
          case ">":
            double? op1 = double.tryParse(block.firstOperand!);
            double? op2 = double.tryParse(block.secondOperand!);
            if (op1 == null || op2 == null) {
              return Result.failure(errorMessage: "Operands are not numbers");
            }
            return Result.success(result: op1 > op2);
          case "<":
            double? op1 = double.tryParse(block.firstOperand!);
            double? op2 = double.tryParse(block.secondOperand!);
            if (op1 == null || op2 == null) {
              return Result.failure(errorMessage: "Operands are not numbers");
            }
            return Result.success(result: op1 < op2);
          default:
            return Result.failure(errorMessage: "Unknown operator");
        }
        case MoveBlock():
          final block = this as MoveBlock;
          if (entityManager == null) {
          return Result.failure(errorMessage: "Entity manager not provided");
        }if(activeEntity == null){
          return Result.failure(errorMessage: "active entity not provided");
        }
          entityManager.moveEntity(activeEntity,x:block.x ,y:block.y);
          return Result.success(result: "moved by ${block.x} horisontally and by ${block.y} vertically");
    }
  }
}


extension BlockModelY on BlockModel {
  BlockModel copyWithNullable({
    Offset? position,
    Color? color,
    double? width,
    double? height,
    bool? isConnected,
    Source? source,
    bool? isDragTarget,
    bool resetChild = false, // Flag to explicitly reset child to null
    bool resetParent = false, // Flag to explicitly reset parent to null
    BlockModel? child,
    BlockModel? parent,
  }) {
    switch (this) {
      case IfBlock():
        final block = this as IfBlock;
        return block.copyWith(
          position: position ?? block.position,
          color: color ?? block.color,
          width: width ?? block.width,
          height: height ?? block.height,
          isConnected: isConnected ?? block.isConnected,
          source: source ?? block.source,
          isDragTarget: isDragTarget ?? block.isDragTarget,
          child: resetChild ? null : (child ?? block.child),
          parent: resetParent ? null : (parent ?? block.parent),
        );

      case PlayAnimationBlock():
        final block = this as PlayAnimationBlock;
        return block.copyWith(
          position: position ?? block.position,
          color: color ?? block.color,
          width: width ?? block.width,
          height: height ?? block.height,
          isConnected: isConnected ?? block.isConnected,
          source: source ?? block.source,
          isDragTarget: isDragTarget ?? block.isDragTarget,
          child: resetChild ? null : (child ?? block.child),
          parent: resetParent ? null : (parent ?? block.parent),
        );

      case ConditionBlock():
        final block = this as ConditionBlock;
        return block.copyWith(
          position: position ?? block.position,
          color: color ?? block.color,
          width: width ?? block.width,
          height: height ?? block.height,
          isConnected: isConnected ?? block.isConnected,
          source: source ?? block.source,
          isDragTarget: isDragTarget ?? block.isDragTarget,
          child: resetChild ? null : (child ?? block.child),
          parent: resetParent ? null : (parent ?? block.parent),
        );

      case MoveBlock():
        final block = this as MoveBlock;
        return block.copyWith(
          position: position ?? block.position,
          color: color ?? block.color,
          width: width ?? block.width,
          height: height ?? block.height,
          isConnected: isConnected ?? block.isConnected,
          source: source ?? block.source,
          isDragTarget: isDragTarget ?? block.isDragTarget,
          child: resetChild ? null : (child ?? block.child),
          parent: resetParent ? null : (parent ?? block.parent),
        );
    }
  }
}
