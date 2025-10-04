//
//  Generated code. Do not modify.
//  source: fatalder.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class Empty extends $pb.GeneratedMessage {
  factory Empty() => create();
  Empty._() : super();
  factory Empty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Empty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Empty', package: const $pb.PackageName(_omitMessageNames ? '' : 'fatalder'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Empty clone() => Empty()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Empty copyWith(void Function(Empty) updates) => super.copyWith((message) => updates(message as Empty)) as Empty;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  Empty createEmptyInstance() => create();
  static $pb.PbList<Empty> createRepeated() => $pb.PbList<Empty>();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty? _defaultInstance;
}

class BlockPos extends $pb.GeneratedMessage {
  factory BlockPos({
    $core.int? x,
    $core.int? y,
    $core.int? z,
  }) {
    final $result = create();
    if (x != null) {
      $result.x = x;
    }
    if (y != null) {
      $result.y = y;
    }
    if (z != null) {
      $result.z = z;
    }
    return $result;
  }
  BlockPos._() : super();
  factory BlockPos.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BlockPos.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BlockPos', package: const $pb.PackageName(_omitMessageNames ? '' : 'fatalder'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'x', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'y', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'z', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BlockPos clone() => BlockPos()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BlockPos copyWith(void Function(BlockPos) updates) => super.copyWith((message) => updates(message as BlockPos)) as BlockPos;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BlockPos create() => BlockPos._();
  BlockPos createEmptyInstance() => create();
  static $pb.PbList<BlockPos> createRepeated() => $pb.PbList<BlockPos>();
  @$core.pragma('dart2js:noInline')
  static BlockPos getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlockPos>(create);
  static BlockPos? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get x => $_getIZ(0);
  @$pb.TagNumber(1)
  set x($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasX() => $_has(0);
  @$pb.TagNumber(1)
  void clearX() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get y => $_getIZ(1);
  @$pb.TagNumber(2)
  set y($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasY() => $_has(1);
  @$pb.TagNumber(2)
  void clearY() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get z => $_getIZ(2);
  @$pb.TagNumber(3)
  set z($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasZ() => $_has(2);
  @$pb.TagNumber(3)
  void clearZ() => clearField(3);
}

class ServerConfig extends $pb.GeneratedMessage {
  factory ServerConfig({
    $core.String? name,
    $core.String? rentalServerCode,
    $core.String? rentalServerPasscode,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (rentalServerCode != null) {
      $result.rentalServerCode = rentalServerCode;
    }
    if (rentalServerPasscode != null) {
      $result.rentalServerPasscode = rentalServerPasscode;
    }
    return $result;
  }
  ServerConfig._() : super();
  factory ServerConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServerConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ServerConfig', package: const $pb.PackageName(_omitMessageNames ? '' : 'fatalder'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'rentalServerCode')
    ..aOS(3, _omitFieldNames ? '' : 'rentalServerPasscode')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ServerConfig clone() => ServerConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ServerConfig copyWith(void Function(ServerConfig) updates) => super.copyWith((message) => updates(message as ServerConfig)) as ServerConfig;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ServerConfig create() => ServerConfig._();
  ServerConfig createEmptyInstance() => create();
  static $pb.PbList<ServerConfig> createRepeated() => $pb.PbList<ServerConfig>();
  @$core.pragma('dart2js:noInline')
  static ServerConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServerConfig>(create);
  static ServerConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get rentalServerCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set rentalServerCode($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRentalServerCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearRentalServerCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get rentalServerPasscode => $_getSZ(2);
  @$pb.TagNumber(3)
  set rentalServerPasscode($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRentalServerPasscode() => $_has(2);
  @$pb.TagNumber(3)
  void clearRentalServerPasscode() => clearField(3);
}

class ServerConfigList extends $pb.GeneratedMessage {
  factory ServerConfigList({
    $core.Iterable<ServerConfig>? configs,
  }) {
    final $result = create();
    if (configs != null) {
      $result.configs.addAll(configs);
    }
    return $result;
  }
  ServerConfigList._() : super();
  factory ServerConfigList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServerConfigList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ServerConfigList', package: const $pb.PackageName(_omitMessageNames ? '' : 'fatalder'), createEmptyInstance: create)
    ..pc<ServerConfig>(1, _omitFieldNames ? '' : 'configs', $pb.PbFieldType.PM, subBuilder: ServerConfig.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ServerConfigList clone() => ServerConfigList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ServerConfigList copyWith(void Function(ServerConfigList) updates) => super.copyWith((message) => updates(message as ServerConfigList)) as ServerConfigList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ServerConfigList create() => ServerConfigList._();
  ServerConfigList createEmptyInstance() => create();
  static $pb.PbList<ServerConfigList> createRepeated() => $pb.PbList<ServerConfigList>();
  @$core.pragma('dart2js:noInline')
  static ServerConfigList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServerConfigList>(create);
  static ServerConfigList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ServerConfig> get configs => $_getList(0);
}

class GetServerConfigRequest extends $pb.GeneratedMessage {
  factory GetServerConfigRequest({
    $core.String? name,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  GetServerConfigRequest._() : super();
  factory GetServerConfigRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetServerConfigRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetServerConfigRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fatalder'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetServerConfigRequest clone() => GetServerConfigRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetServerConfigRequest copyWith(void Function(GetServerConfigRequest) updates) => super.copyWith((message) => updates(message as GetServerConfigRequest)) as GetServerConfigRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetServerConfigRequest create() => GetServerConfigRequest._();
  GetServerConfigRequest createEmptyInstance() => create();
  static $pb.PbList<GetServerConfigRequest> createRepeated() => $pb.PbList<GetServerConfigRequest>();
  @$core.pragma('dart2js:noInline')
  static GetServerConfigRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetServerConfigRequest>(create);
  static GetServerConfigRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

class DeleteServerConfigRequest extends $pb.GeneratedMessage {
  factory DeleteServerConfigRequest({
    $core.String? name,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  DeleteServerConfigRequest._() : super();
  factory DeleteServerConfigRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteServerConfigRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteServerConfigRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fatalder'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteServerConfigRequest clone() => DeleteServerConfigRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteServerConfigRequest copyWith(void Function(DeleteServerConfigRequest) updates) => super.copyWith((message) => updates(message as DeleteServerConfigRequest)) as DeleteServerConfigRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteServerConfigRequest create() => DeleteServerConfigRequest._();
  DeleteServerConfigRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteServerConfigRequest> createRepeated() => $pb.PbList<DeleteServerConfigRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteServerConfigRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteServerConfigRequest>(create);
  static DeleteServerConfigRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

class BuildTask extends $pb.GeneratedMessage {
  factory BuildTask({
    $core.String? taskType,
    $core.String? filePath,
    BlockPos? startPos,
    $core.int? speed,
    $core.bool? autoCleanBlock,
    $core.bool? autoCleanItem,
    $core.int? verifyAfterChunk,
    $core.int? verifyChunkLevel,
    $core.int? progress,
    $core.bool? autoDisableCommand,
    $core.bool? autoUpgradeCommand,
    $core.bool? ignoreCommandBlock,
    $core.bool? ignoreOtherNbtBlock,
    BlockPos? consoleWorldPos,
    $core.bool? showNbtProgress,
    $core.bool? autoEnterFixMode,
    $core.bool? enterFixModeDirectly,
  }) {
    final $result = create();
    if (taskType != null) {
      $result.taskType = taskType;
    }
    if (filePath != null) {
      $result.filePath = filePath;
    }
    if (startPos != null) {
      $result.startPos = startPos;
    }
    if (speed != null) {
      $result.speed = speed;
    }
    if (autoCleanBlock != null) {
      $result.autoCleanBlock = autoCleanBlock;
    }
    if (autoCleanItem != null) {
      $result.autoCleanItem = autoCleanItem;
    }
    if (verifyAfterChunk != null) {
      $result.verifyAfterChunk = verifyAfterChunk;
    }
    if (verifyChunkLevel != null) {
      $result.verifyChunkLevel = verifyChunkLevel;
    }
    if (progress != null) {
      $result.progress = progress;
    }
    if (autoDisableCommand != null) {
      $result.autoDisableCommand = autoDisableCommand;
    }
    if (autoUpgradeCommand != null) {
      $result.autoUpgradeCommand = autoUpgradeCommand;
    }
    if (ignoreCommandBlock != null) {
      $result.ignoreCommandBlock = ignoreCommandBlock;
    }
    if (ignoreOtherNbtBlock != null) {
      $result.ignoreOtherNbtBlock = ignoreOtherNbtBlock;
    }
    if (consoleWorldPos != null) {
      $result.consoleWorldPos = consoleWorldPos;
    }
    if (showNbtProgress != null) {
      $result.showNbtProgress = showNbtProgress;
    }
    if (autoEnterFixMode != null) {
      $result.autoEnterFixMode = autoEnterFixMode;
    }
    if (enterFixModeDirectly != null) {
      $result.enterFixModeDirectly = enterFixModeDirectly;
    }
    return $result;
  }
  BuildTask._() : super();
  factory BuildTask.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BuildTask.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BuildTask', package: const $pb.PackageName(_omitMessageNames ? '' : 'fatalder'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'taskType')
    ..aOS(2, _omitFieldNames ? '' : 'filePath')
    ..aOM<BlockPos>(3, _omitFieldNames ? '' : 'startPos', subBuilder: BlockPos.create)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'speed', $pb.PbFieldType.O3)
    ..aOB(5, _omitFieldNames ? '' : 'autoCleanBlock')
    ..aOB(6, _omitFieldNames ? '' : 'autoCleanItem')
    ..a<$core.int>(7, _omitFieldNames ? '' : 'verifyAfterChunk', $pb.PbFieldType.O3)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'verifyChunkLevel', $pb.PbFieldType.O3)
    ..a<$core.int>(9, _omitFieldNames ? '' : 'progress', $pb.PbFieldType.O3)
    ..aOB(10, _omitFieldNames ? '' : 'autoDisableCommand')
    ..aOB(11, _omitFieldNames ? '' : 'autoUpgradeCommand')
    ..aOB(12, _omitFieldNames ? '' : 'ignoreCommandBlock')
    ..aOB(13, _omitFieldNames ? '' : 'ignoreOtherNbtBlock')
    ..aOM<BlockPos>(14, _omitFieldNames ? '' : 'consoleWorldPos', subBuilder: BlockPos.create)
    ..aOB(15, _omitFieldNames ? '' : 'showNbtProgress')
    ..aOB(16, _omitFieldNames ? '' : 'autoEnterFixMode')
    ..aOB(17, _omitFieldNames ? '' : 'enterFixModeDirectly')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BuildTask clone() => BuildTask()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BuildTask copyWith(void Function(BuildTask) updates) => super.copyWith((message) => updates(message as BuildTask)) as BuildTask;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BuildTask create() => BuildTask._();
  BuildTask createEmptyInstance() => create();
  static $pb.PbList<BuildTask> createRepeated() => $pb.PbList<BuildTask>();
  @$core.pragma('dart2js:noInline')
  static BuildTask getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BuildTask>(create);
  static BuildTask? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get taskType => $_getSZ(0);
  @$pb.TagNumber(1)
  set taskType($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTaskType() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get filePath => $_getSZ(1);
  @$pb.TagNumber(2)
  set filePath($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFilePath() => $_has(1);
  @$pb.TagNumber(2)
  void clearFilePath() => clearField(2);

  @$pb.TagNumber(3)
  BlockPos get startPos => $_getN(2);
  @$pb.TagNumber(3)
  set startPos(BlockPos v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasStartPos() => $_has(2);
  @$pb.TagNumber(3)
  void clearStartPos() => clearField(3);
  @$pb.TagNumber(3)
  BlockPos ensureStartPos() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get speed => $_getIZ(3);
  @$pb.TagNumber(4)
  set speed($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSpeed() => $_has(3);
  @$pb.TagNumber(4)
  void clearSpeed() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get autoCleanBlock => $_getBF(4);
  @$pb.TagNumber(5)
  set autoCleanBlock($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAutoCleanBlock() => $_has(4);
  @$pb.TagNumber(5)
  void clearAutoCleanBlock() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get autoCleanItem => $_getBF(5);
  @$pb.TagNumber(6)
  set autoCleanItem($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAutoCleanItem() => $_has(5);
  @$pb.TagNumber(6)
  void clearAutoCleanItem() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get verifyAfterChunk => $_getIZ(6);
  @$pb.TagNumber(7)
  set verifyAfterChunk($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasVerifyAfterChunk() => $_has(6);
  @$pb.TagNumber(7)
  void clearVerifyAfterChunk() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get verifyChunkLevel => $_getIZ(7);
  @$pb.TagNumber(8)
  set verifyChunkLevel($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasVerifyChunkLevel() => $_has(7);
  @$pb.TagNumber(8)
  void clearVerifyChunkLevel() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get progress => $_getIZ(8);
  @$pb.TagNumber(9)
  set progress($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasProgress() => $_has(8);
  @$pb.TagNumber(9)
  void clearProgress() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get autoDisableCommand => $_getBF(9);
  @$pb.TagNumber(10)
  set autoDisableCommand($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasAutoDisableCommand() => $_has(9);
  @$pb.TagNumber(10)
  void clearAutoDisableCommand() => clearField(10);

  @$pb.TagNumber(11)
  $core.bool get autoUpgradeCommand => $_getBF(10);
  @$pb.TagNumber(11)
  set autoUpgradeCommand($core.bool v) { $_setBool(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasAutoUpgradeCommand() => $_has(10);
  @$pb.TagNumber(11)
  void clearAutoUpgradeCommand() => clearField(11);

  @$pb.TagNumber(12)
  $core.bool get ignoreCommandBlock => $_getBF(11);
  @$pb.TagNumber(12)
  set ignoreCommandBlock($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasIgnoreCommandBlock() => $_has(11);
  @$pb.TagNumber(12)
  void clearIgnoreCommandBlock() => clearField(12);

  @$pb.TagNumber(13)
  $core.bool get ignoreOtherNbtBlock => $_getBF(12);
  @$pb.TagNumber(13)
  set ignoreOtherNbtBlock($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasIgnoreOtherNbtBlock() => $_has(12);
  @$pb.TagNumber(13)
  void clearIgnoreOtherNbtBlock() => clearField(13);

  @$pb.TagNumber(14)
  BlockPos get consoleWorldPos => $_getN(13);
  @$pb.TagNumber(14)
  set consoleWorldPos(BlockPos v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasConsoleWorldPos() => $_has(13);
  @$pb.TagNumber(14)
  void clearConsoleWorldPos() => clearField(14);
  @$pb.TagNumber(14)
  BlockPos ensureConsoleWorldPos() => $_ensure(13);

  @$pb.TagNumber(15)
  $core.bool get showNbtProgress => $_getBF(14);
  @$pb.TagNumber(15)
  set showNbtProgress($core.bool v) { $_setBool(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasShowNbtProgress() => $_has(14);
  @$pb.TagNumber(15)
  void clearShowNbtProgress() => clearField(15);

  @$pb.TagNumber(16)
  $core.bool get autoEnterFixMode => $_getBF(15);
  @$pb.TagNumber(16)
  set autoEnterFixMode($core.bool v) { $_setBool(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasAutoEnterFixMode() => $_has(15);
  @$pb.TagNumber(16)
  void clearAutoEnterFixMode() => clearField(16);

  @$pb.TagNumber(17)
  $core.bool get enterFixModeDirectly => $_getBF(16);
  @$pb.TagNumber(17)
  set enterFixModeDirectly($core.bool v) { $_setBool(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasEnterFixModeDirectly() => $_has(16);
  @$pb.TagNumber(17)
  void clearEnterFixModeDirectly() => clearField(17);
}

class ExportTask extends $pb.GeneratedMessage {
  factory ExportTask({
    $core.String? taskType,
    $core.String? filePath,
    $core.String? fileType,
    BlockPos? startPos,
    BlockPos? endPos,
  }) {
    final $result = create();
    if (taskType != null) {
      $result.taskType = taskType;
    }
    if (filePath != null) {
      $result.filePath = filePath;
    }
    if (fileType != null) {
      $result.fileType = fileType;
    }
    if (startPos != null) {
      $result.startPos = startPos;
    }
    if (endPos != null) {
      $result.endPos = endPos;
    }
    return $result;
  }
  ExportTask._() : super();
  factory ExportTask.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ExportTask.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ExportTask', package: const $pb.PackageName(_omitMessageNames ? '' : 'fatalder'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'taskType')
    ..aOS(2, _omitFieldNames ? '' : 'filePath')
    ..aOS(3, _omitFieldNames ? '' : 'fileType')
    ..aOM<BlockPos>(4, _omitFieldNames ? '' : 'startPos', subBuilder: BlockPos.create)
    ..aOM<BlockPos>(5, _omitFieldNames ? '' : 'endPos', subBuilder: BlockPos.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ExportTask clone() => ExportTask()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ExportTask copyWith(void Function(ExportTask) updates) => super.copyWith((message) => updates(message as ExportTask)) as ExportTask;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExportTask create() => ExportTask._();
  ExportTask createEmptyInstance() => create();
  static $pb.PbList<ExportTask> createRepeated() => $pb.PbList<ExportTask>();
  @$core.pragma('dart2js:noInline')
  static ExportTask getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExportTask>(create);
  static ExportTask? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get taskType => $_getSZ(0);
  @$pb.TagNumber(1)
  set taskType($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTaskType() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get filePath => $_getSZ(1);
  @$pb.TagNumber(2)
  set filePath($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFilePath() => $_has(1);
  @$pb.TagNumber(2)
  void clearFilePath() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get fileType => $_getSZ(2);
  @$pb.TagNumber(3)
  set fileType($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFileType() => $_has(2);
  @$pb.TagNumber(3)
  void clearFileType() => clearField(3);

  @$pb.TagNumber(4)
  BlockPos get startPos => $_getN(3);
  @$pb.TagNumber(4)
  set startPos(BlockPos v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasStartPos() => $_has(3);
  @$pb.TagNumber(4)
  void clearStartPos() => clearField(4);
  @$pb.TagNumber(4)
  BlockPos ensureStartPos() => $_ensure(3);

  @$pb.TagNumber(5)
  BlockPos get endPos => $_getN(4);
  @$pb.TagNumber(5)
  set endPos(BlockPos v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasEndPos() => $_has(4);
  @$pb.TagNumber(5)
  void clearEndPos() => clearField(5);
  @$pb.TagNumber(5)
  BlockPos ensureEndPos() => $_ensure(4);
}

enum Task_Task {
  buildTask, 
  exportTask, 
  notSet
}

class Task extends $pb.GeneratedMessage {
  factory Task({
    BuildTask? buildTask,
    ExportTask? exportTask,
  }) {
    final $result = create();
    if (buildTask != null) {
      $result.buildTask = buildTask;
    }
    if (exportTask != null) {
      $result.exportTask = exportTask;
    }
    return $result;
  }
  Task._() : super();
  factory Task.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Task.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Task_Task> _Task_TaskByTag = {
    1 : Task_Task.buildTask,
    2 : Task_Task.exportTask,
    0 : Task_Task.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Task', package: const $pb.PackageName(_omitMessageNames ? '' : 'fatalder'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<BuildTask>(1, _omitFieldNames ? '' : 'buildTask', subBuilder: BuildTask.create)
    ..aOM<ExportTask>(2, _omitFieldNames ? '' : 'exportTask', subBuilder: ExportTask.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Task clone() => Task()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Task copyWith(void Function(Task) updates) => super.copyWith((message) => updates(message as Task)) as Task;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Task create() => Task._();
  Task createEmptyInstance() => create();
  static $pb.PbList<Task> createRepeated() => $pb.PbList<Task>();
  @$core.pragma('dart2js:noInline')
  static Task getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Task>(create);
  static Task? _defaultInstance;

  Task_Task whichTask() => _Task_TaskByTag[$_whichOneof(0)]!;
  void clearTask() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  BuildTask get buildTask => $_getN(0);
  @$pb.TagNumber(1)
  set buildTask(BuildTask v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBuildTask() => $_has(0);
  @$pb.TagNumber(1)
  void clearBuildTask() => clearField(1);
  @$pb.TagNumber(1)
  BuildTask ensureBuildTask() => $_ensure(0);

  @$pb.TagNumber(2)
  ExportTask get exportTask => $_getN(1);
  @$pb.TagNumber(2)
  set exportTask(ExportTask v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasExportTask() => $_has(1);
  @$pb.TagNumber(2)
  void clearExportTask() => clearField(2);
  @$pb.TagNumber(2)
  ExportTask ensureExportTask() => $_ensure(1);
}

class TaskGroup extends $pb.GeneratedMessage {
  factory TaskGroup({
    $core.String? name,
    $core.Iterable<Task>? tasks,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (tasks != null) {
      $result.tasks.addAll(tasks);
    }
    return $result;
  }
  TaskGroup._() : super();
  factory TaskGroup.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TaskGroup.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TaskGroup', package: const $pb.PackageName(_omitMessageNames ? '' : 'fatalder'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..pc<Task>(2, _omitFieldNames ? '' : 'tasks', $pb.PbFieldType.PM, subBuilder: Task.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TaskGroup clone() => TaskGroup()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TaskGroup copyWith(void Function(TaskGroup) updates) => super.copyWith((message) => updates(message as TaskGroup)) as TaskGroup;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TaskGroup create() => TaskGroup._();
  TaskGroup createEmptyInstance() => create();
  static $pb.PbList<TaskGroup> createRepeated() => $pb.PbList<TaskGroup>();
  @$core.pragma('dart2js:noInline')
  static TaskGroup getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TaskGroup>(create);
  static TaskGroup? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<Task> get tasks => $_getList(1);
}

class TaskGroupList extends $pb.GeneratedMessage {
  factory TaskGroupList({
    $core.Iterable<$core.String>? names,
  }) {
    final $result = create();
    if (names != null) {
      $result.names.addAll(names);
    }
    return $result;
  }
  TaskGroupList._() : super();
  factory TaskGroupList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TaskGroupList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TaskGroupList', package: const $pb.PackageName(_omitMessageNames ? '' : 'fatalder'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'names')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TaskGroupList clone() => TaskGroupList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TaskGroupList copyWith(void Function(TaskGroupList) updates) => super.copyWith((message) => updates(message as TaskGroupList)) as TaskGroupList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TaskGroupList create() => TaskGroupList._();
  TaskGroupList createEmptyInstance() => create();
  static $pb.PbList<TaskGroupList> createRepeated() => $pb.PbList<TaskGroupList>();
  @$core.pragma('dart2js:noInline')
  static TaskGroupList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TaskGroupList>(create);
  static TaskGroupList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get names => $_getList(0);
}

class GetTaskGroupRequest extends $pb.GeneratedMessage {
  factory GetTaskGroupRequest({
    $core.String? name,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  GetTaskGroupRequest._() : super();
  factory GetTaskGroupRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTaskGroupRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTaskGroupRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fatalder'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTaskGroupRequest clone() => GetTaskGroupRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTaskGroupRequest copyWith(void Function(GetTaskGroupRequest) updates) => super.copyWith((message) => updates(message as GetTaskGroupRequest)) as GetTaskGroupRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTaskGroupRequest create() => GetTaskGroupRequest._();
  GetTaskGroupRequest createEmptyInstance() => create();
  static $pb.PbList<GetTaskGroupRequest> createRepeated() => $pb.PbList<GetTaskGroupRequest>();
  @$core.pragma('dart2js:noInline')
  static GetTaskGroupRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTaskGroupRequest>(create);
  static GetTaskGroupRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

class CreateTaskGroupRequest extends $pb.GeneratedMessage {
  factory CreateTaskGroupRequest({
    $core.String? name,
    $core.Iterable<Task>? tasks,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (tasks != null) {
      $result.tasks.addAll(tasks);
    }
    return $result;
  }
  CreateTaskGroupRequest._() : super();
  factory CreateTaskGroupRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateTaskGroupRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateTaskGroupRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fatalder'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..pc<Task>(2, _omitFieldNames ? '' : 'tasks', $pb.PbFieldType.PM, subBuilder: Task.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateTaskGroupRequest clone() => CreateTaskGroupRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateTaskGroupRequest copyWith(void Function(CreateTaskGroupRequest) updates) => super.copyWith((message) => updates(message as CreateTaskGroupRequest)) as CreateTaskGroupRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateTaskGroupRequest create() => CreateTaskGroupRequest._();
  CreateTaskGroupRequest createEmptyInstance() => create();
  static $pb.PbList<CreateTaskGroupRequest> createRepeated() => $pb.PbList<CreateTaskGroupRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateTaskGroupRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateTaskGroupRequest>(create);
  static CreateTaskGroupRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<Task> get tasks => $_getList(1);
}

class DeleteTaskGroupRequest extends $pb.GeneratedMessage {
  factory DeleteTaskGroupRequest({
    $core.String? name,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  DeleteTaskGroupRequest._() : super();
  factory DeleteTaskGroupRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteTaskGroupRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteTaskGroupRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fatalder'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteTaskGroupRequest clone() => DeleteTaskGroupRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteTaskGroupRequest copyWith(void Function(DeleteTaskGroupRequest) updates) => super.copyWith((message) => updates(message as DeleteTaskGroupRequest)) as DeleteTaskGroupRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteTaskGroupRequest create() => DeleteTaskGroupRequest._();
  DeleteTaskGroupRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteTaskGroupRequest> createRepeated() => $pb.PbList<DeleteTaskGroupRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteTaskGroupRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteTaskGroupRequest>(create);
  static DeleteTaskGroupRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

class ExecuteTaskGroupRequest extends $pb.GeneratedMessage {
  factory ExecuteTaskGroupRequest({
    $core.String? taskGroupName,
    $core.String? serverConfigName,
  }) {
    final $result = create();
    if (taskGroupName != null) {
      $result.taskGroupName = taskGroupName;
    }
    if (serverConfigName != null) {
      $result.serverConfigName = serverConfigName;
    }
    return $result;
  }
  ExecuteTaskGroupRequest._() : super();
  factory ExecuteTaskGroupRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ExecuteTaskGroupRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ExecuteTaskGroupRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fatalder'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'taskGroupName')
    ..aOS(2, _omitFieldNames ? '' : 'serverConfigName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ExecuteTaskGroupRequest clone() => ExecuteTaskGroupRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ExecuteTaskGroupRequest copyWith(void Function(ExecuteTaskGroupRequest) updates) => super.copyWith((message) => updates(message as ExecuteTaskGroupRequest)) as ExecuteTaskGroupRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExecuteTaskGroupRequest create() => ExecuteTaskGroupRequest._();
  ExecuteTaskGroupRequest createEmptyInstance() => create();
  static $pb.PbList<ExecuteTaskGroupRequest> createRepeated() => $pb.PbList<ExecuteTaskGroupRequest>();
  @$core.pragma('dart2js:noInline')
  static ExecuteTaskGroupRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExecuteTaskGroupRequest>(create);
  static ExecuteTaskGroupRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get taskGroupName => $_getSZ(0);
  @$pb.TagNumber(1)
  set taskGroupName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTaskGroupName() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskGroupName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get serverConfigName => $_getSZ(1);
  @$pb.TagNumber(2)
  set serverConfigName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasServerConfigName() => $_has(1);
  @$pb.TagNumber(2)
  void clearServerConfigName() => clearField(2);
}

class TaskProgress extends $pb.GeneratedMessage {
  factory TaskProgress({
    $core.int? taskIndex,
    $core.int? totalTasks,
    $core.String? taskType,
    $core.String? message,
    $core.int? currentChunk,
    $core.int? totalChunks,
    $core.double? progressPercent,
    $core.String? status,
  }) {
    final $result = create();
    if (taskIndex != null) {
      $result.taskIndex = taskIndex;
    }
    if (totalTasks != null) {
      $result.totalTasks = totalTasks;
    }
    if (taskType != null) {
      $result.taskType = taskType;
    }
    if (message != null) {
      $result.message = message;
    }
    if (currentChunk != null) {
      $result.currentChunk = currentChunk;
    }
    if (totalChunks != null) {
      $result.totalChunks = totalChunks;
    }
    if (progressPercent != null) {
      $result.progressPercent = progressPercent;
    }
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  TaskProgress._() : super();
  factory TaskProgress.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TaskProgress.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TaskProgress', package: const $pb.PackageName(_omitMessageNames ? '' : 'fatalder'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'taskIndex', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'totalTasks', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'taskType')
    ..aOS(4, _omitFieldNames ? '' : 'message')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'currentChunk', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'totalChunks', $pb.PbFieldType.O3)
    ..a<$core.double>(7, _omitFieldNames ? '' : 'progressPercent', $pb.PbFieldType.OD)
    ..aOS(8, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TaskProgress clone() => TaskProgress()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TaskProgress copyWith(void Function(TaskProgress) updates) => super.copyWith((message) => updates(message as TaskProgress)) as TaskProgress;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TaskProgress create() => TaskProgress._();
  TaskProgress createEmptyInstance() => create();
  static $pb.PbList<TaskProgress> createRepeated() => $pb.PbList<TaskProgress>();
  @$core.pragma('dart2js:noInline')
  static TaskProgress getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TaskProgress>(create);
  static TaskProgress? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get taskIndex => $_getIZ(0);
  @$pb.TagNumber(1)
  set taskIndex($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTaskIndex() => $_has(0);
  @$pb.TagNumber(1)
  void clearTaskIndex() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get totalTasks => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalTasks($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotalTasks() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalTasks() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get taskType => $_getSZ(2);
  @$pb.TagNumber(3)
  set taskType($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTaskType() => $_has(2);
  @$pb.TagNumber(3)
  void clearTaskType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get message => $_getSZ(3);
  @$pb.TagNumber(4)
  set message($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearMessage() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get currentChunk => $_getIZ(4);
  @$pb.TagNumber(5)
  set currentChunk($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCurrentChunk() => $_has(4);
  @$pb.TagNumber(5)
  void clearCurrentChunk() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get totalChunks => $_getIZ(5);
  @$pb.TagNumber(6)
  set totalChunks($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTotalChunks() => $_has(5);
  @$pb.TagNumber(6)
  void clearTotalChunks() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get progressPercent => $_getN(6);
  @$pb.TagNumber(7)
  set progressPercent($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasProgressPercent() => $_has(6);
  @$pb.TagNumber(7)
  void clearProgressPercent() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get status => $_getSZ(7);
  @$pb.TagNumber(8)
  set status($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearStatus() => clearField(8);
}

class BuildProgress extends $pb.GeneratedMessage {
  factory BuildProgress({
    $core.String? status,
    $core.String? message,
    $core.int? currentChunk,
    $core.int? totalChunks,
    $core.double? progressPercent,
    $core.String? structureType,
    $core.int? width,
    $core.int? height,
    $core.int? length,
    $core.int? blockCount,
    $core.int? commandBlockCount,
    $core.int? nbtCount,
    $core.int? costDeducted,
    $core.String? balance,
    $core.String? logMessage,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (message != null) {
      $result.message = message;
    }
    if (currentChunk != null) {
      $result.currentChunk = currentChunk;
    }
    if (totalChunks != null) {
      $result.totalChunks = totalChunks;
    }
    if (progressPercent != null) {
      $result.progressPercent = progressPercent;
    }
    if (structureType != null) {
      $result.structureType = structureType;
    }
    if (width != null) {
      $result.width = width;
    }
    if (height != null) {
      $result.height = height;
    }
    if (length != null) {
      $result.length = length;
    }
    if (blockCount != null) {
      $result.blockCount = blockCount;
    }
    if (commandBlockCount != null) {
      $result.commandBlockCount = commandBlockCount;
    }
    if (nbtCount != null) {
      $result.nbtCount = nbtCount;
    }
    if (costDeducted != null) {
      $result.costDeducted = costDeducted;
    }
    if (balance != null) {
      $result.balance = balance;
    }
    if (logMessage != null) {
      $result.logMessage = logMessage;
    }
    return $result;
  }
  BuildProgress._() : super();
  factory BuildProgress.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BuildProgress.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BuildProgress', package: const $pb.PackageName(_omitMessageNames ? '' : 'fatalder'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'currentChunk', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'totalChunks', $pb.PbFieldType.O3)
    ..a<$core.double>(5, _omitFieldNames ? '' : 'progressPercent', $pb.PbFieldType.OD)
    ..aOS(6, _omitFieldNames ? '' : 'structureType')
    ..a<$core.int>(7, _omitFieldNames ? '' : 'width', $pb.PbFieldType.O3)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'height', $pb.PbFieldType.O3)
    ..a<$core.int>(9, _omitFieldNames ? '' : 'length', $pb.PbFieldType.O3)
    ..a<$core.int>(10, _omitFieldNames ? '' : 'blockCount', $pb.PbFieldType.O3)
    ..a<$core.int>(11, _omitFieldNames ? '' : 'commandBlockCount', $pb.PbFieldType.O3)
    ..a<$core.int>(12, _omitFieldNames ? '' : 'nbtCount', $pb.PbFieldType.O3)
    ..a<$core.int>(13, _omitFieldNames ? '' : 'costDeducted', $pb.PbFieldType.O3)
    ..aOS(14, _omitFieldNames ? '' : 'balance')
    ..aOS(15, _omitFieldNames ? '' : 'logMessage')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BuildProgress clone() => BuildProgress()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BuildProgress copyWith(void Function(BuildProgress) updates) => super.copyWith((message) => updates(message as BuildProgress)) as BuildProgress;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BuildProgress create() => BuildProgress._();
  BuildProgress createEmptyInstance() => create();
  static $pb.PbList<BuildProgress> createRepeated() => $pb.PbList<BuildProgress>();
  @$core.pragma('dart2js:noInline')
  static BuildProgress getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BuildProgress>(create);
  static BuildProgress? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get currentChunk => $_getIZ(2);
  @$pb.TagNumber(3)
  set currentChunk($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCurrentChunk() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurrentChunk() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get totalChunks => $_getIZ(3);
  @$pb.TagNumber(4)
  set totalChunks($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTotalChunks() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalChunks() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get progressPercent => $_getN(4);
  @$pb.TagNumber(5)
  set progressPercent($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasProgressPercent() => $_has(4);
  @$pb.TagNumber(5)
  void clearProgressPercent() => clearField(5);

  /// 结构信息
  @$pb.TagNumber(6)
  $core.String get structureType => $_getSZ(5);
  @$pb.TagNumber(6)
  set structureType($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasStructureType() => $_has(5);
  @$pb.TagNumber(6)
  void clearStructureType() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get width => $_getIZ(6);
  @$pb.TagNumber(7)
  set width($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasWidth() => $_has(6);
  @$pb.TagNumber(7)
  void clearWidth() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get height => $_getIZ(7);
  @$pb.TagNumber(8)
  set height($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasHeight() => $_has(7);
  @$pb.TagNumber(8)
  void clearHeight() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get length => $_getIZ(8);
  @$pb.TagNumber(9)
  set length($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasLength() => $_has(8);
  @$pb.TagNumber(9)
  void clearLength() => clearField(9);

  /// 费用信息
  @$pb.TagNumber(10)
  $core.int get blockCount => $_getIZ(9);
  @$pb.TagNumber(10)
  set blockCount($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasBlockCount() => $_has(9);
  @$pb.TagNumber(10)
  void clearBlockCount() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get commandBlockCount => $_getIZ(10);
  @$pb.TagNumber(11)
  set commandBlockCount($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasCommandBlockCount() => $_has(10);
  @$pb.TagNumber(11)
  void clearCommandBlockCount() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get nbtCount => $_getIZ(11);
  @$pb.TagNumber(12)
  set nbtCount($core.int v) { $_setSignedInt32(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasNbtCount() => $_has(11);
  @$pb.TagNumber(12)
  void clearNbtCount() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get costDeducted => $_getIZ(12);
  @$pb.TagNumber(13)
  set costDeducted($core.int v) { $_setSignedInt32(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasCostDeducted() => $_has(12);
  @$pb.TagNumber(13)
  void clearCostDeducted() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get balance => $_getSZ(13);
  @$pb.TagNumber(14)
  set balance($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasBalance() => $_has(13);
  @$pb.TagNumber(14)
  void clearBalance() => clearField(14);

  /// 日志消息
  @$pb.TagNumber(15)
  $core.String get logMessage => $_getSZ(14);
  @$pb.TagNumber(15)
  set logMessage($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasLogMessage() => $_has(14);
  @$pb.TagNumber(15)
  void clearLogMessage() => clearField(15);
}

class ExportProgress extends $pb.GeneratedMessage {
  factory ExportProgress({
    $core.String? status,
    $core.String? message,
    $core.int? currentChunk,
    $core.int? totalChunks,
    $core.double? progressPercent,
    $core.String? outputPath,
    $core.String? logMessage,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (message != null) {
      $result.message = message;
    }
    if (currentChunk != null) {
      $result.currentChunk = currentChunk;
    }
    if (totalChunks != null) {
      $result.totalChunks = totalChunks;
    }
    if (progressPercent != null) {
      $result.progressPercent = progressPercent;
    }
    if (outputPath != null) {
      $result.outputPath = outputPath;
    }
    if (logMessage != null) {
      $result.logMessage = logMessage;
    }
    return $result;
  }
  ExportProgress._() : super();
  factory ExportProgress.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ExportProgress.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ExportProgress', package: const $pb.PackageName(_omitMessageNames ? '' : 'fatalder'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'currentChunk', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'totalChunks', $pb.PbFieldType.O3)
    ..a<$core.double>(5, _omitFieldNames ? '' : 'progressPercent', $pb.PbFieldType.OD)
    ..aOS(6, _omitFieldNames ? '' : 'outputPath')
    ..aOS(7, _omitFieldNames ? '' : 'logMessage')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ExportProgress clone() => ExportProgress()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ExportProgress copyWith(void Function(ExportProgress) updates) => super.copyWith((message) => updates(message as ExportProgress)) as ExportProgress;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExportProgress create() => ExportProgress._();
  ExportProgress createEmptyInstance() => create();
  static $pb.PbList<ExportProgress> createRepeated() => $pb.PbList<ExportProgress>();
  @$core.pragma('dart2js:noInline')
  static ExportProgress getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExportProgress>(create);
  static ExportProgress? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get currentChunk => $_getIZ(2);
  @$pb.TagNumber(3)
  set currentChunk($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCurrentChunk() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurrentChunk() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get totalChunks => $_getIZ(3);
  @$pb.TagNumber(4)
  set totalChunks($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTotalChunks() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalChunks() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get progressPercent => $_getN(4);
  @$pb.TagNumber(5)
  set progressPercent($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasProgressPercent() => $_has(4);
  @$pb.TagNumber(5)
  void clearProgressPercent() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get outputPath => $_getSZ(5);
  @$pb.TagNumber(6)
  set outputPath($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasOutputPath() => $_has(5);
  @$pb.TagNumber(6)
  void clearOutputPath() => clearField(6);

  /// 日志消息
  @$pb.TagNumber(7)
  $core.String get logMessage => $_getSZ(6);
  @$pb.TagNumber(7)
  set logMessage($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasLogMessage() => $_has(6);
  @$pb.TagNumber(7)
  void clearLogMessage() => clearField(7);
}

class BuildControlRequest extends $pb.GeneratedMessage {
  factory BuildControlRequest({
    $core.String? action,
  }) {
    final $result = create();
    if (action != null) {
      $result.action = action;
    }
    return $result;
  }
  BuildControlRequest._() : super();
  factory BuildControlRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BuildControlRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BuildControlRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fatalder'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'action')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BuildControlRequest clone() => BuildControlRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BuildControlRequest copyWith(void Function(BuildControlRequest) updates) => super.copyWith((message) => updates(message as BuildControlRequest)) as BuildControlRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BuildControlRequest create() => BuildControlRequest._();
  BuildControlRequest createEmptyInstance() => create();
  static $pb.PbList<BuildControlRequest> createRepeated() => $pb.PbList<BuildControlRequest>();
  @$core.pragma('dart2js:noInline')
  static BuildControlRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BuildControlRequest>(create);
  static BuildControlRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get action => $_getSZ(0);
  @$pb.TagNumber(1)
  set action($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAction() => $_has(0);
  @$pb.TagNumber(1)
  void clearAction() => clearField(1);
}

class StartBuildRequest extends $pb.GeneratedMessage {
  factory StartBuildRequest({
    $core.String? serverConfigName,
    BuildTask? task,
    $core.bool? resumeFromInterrupt,
  }) {
    final $result = create();
    if (serverConfigName != null) {
      $result.serverConfigName = serverConfigName;
    }
    if (task != null) {
      $result.task = task;
    }
    if (resumeFromInterrupt != null) {
      $result.resumeFromInterrupt = resumeFromInterrupt;
    }
    return $result;
  }
  StartBuildRequest._() : super();
  factory StartBuildRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StartBuildRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StartBuildRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fatalder'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'serverConfigName')
    ..aOM<BuildTask>(2, _omitFieldNames ? '' : 'task', subBuilder: BuildTask.create)
    ..aOB(3, _omitFieldNames ? '' : 'resumeFromInterrupt')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StartBuildRequest clone() => StartBuildRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StartBuildRequest copyWith(void Function(StartBuildRequest) updates) => super.copyWith((message) => updates(message as StartBuildRequest)) as StartBuildRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartBuildRequest create() => StartBuildRequest._();
  StartBuildRequest createEmptyInstance() => create();
  static $pb.PbList<StartBuildRequest> createRepeated() => $pb.PbList<StartBuildRequest>();
  @$core.pragma('dart2js:noInline')
  static StartBuildRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StartBuildRequest>(create);
  static StartBuildRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get serverConfigName => $_getSZ(0);
  @$pb.TagNumber(1)
  set serverConfigName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasServerConfigName() => $_has(0);
  @$pb.TagNumber(1)
  void clearServerConfigName() => clearField(1);

  @$pb.TagNumber(2)
  BuildTask get task => $_getN(1);
  @$pb.TagNumber(2)
  set task(BuildTask v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTask() => $_has(1);
  @$pb.TagNumber(2)
  void clearTask() => clearField(2);
  @$pb.TagNumber(2)
  BuildTask ensureTask() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.bool get resumeFromInterrupt => $_getBF(2);
  @$pb.TagNumber(3)
  set resumeFromInterrupt($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasResumeFromInterrupt() => $_has(2);
  @$pb.TagNumber(3)
  void clearResumeFromInterrupt() => clearField(3);
}

class StartExportRequest extends $pb.GeneratedMessage {
  factory StartExportRequest({
    $core.String? serverConfigName,
    ExportTask? task,
  }) {
    final $result = create();
    if (serverConfigName != null) {
      $result.serverConfigName = serverConfigName;
    }
    if (task != null) {
      $result.task = task;
    }
    return $result;
  }
  StartExportRequest._() : super();
  factory StartExportRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StartExportRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StartExportRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fatalder'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'serverConfigName')
    ..aOM<ExportTask>(2, _omitFieldNames ? '' : 'task', subBuilder: ExportTask.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StartExportRequest clone() => StartExportRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StartExportRequest copyWith(void Function(StartExportRequest) updates) => super.copyWith((message) => updates(message as StartExportRequest)) as StartExportRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartExportRequest create() => StartExportRequest._();
  StartExportRequest createEmptyInstance() => create();
  static $pb.PbList<StartExportRequest> createRepeated() => $pb.PbList<StartExportRequest>();
  @$core.pragma('dart2js:noInline')
  static StartExportRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StartExportRequest>(create);
  static StartExportRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get serverConfigName => $_getSZ(0);
  @$pb.TagNumber(1)
  set serverConfigName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasServerConfigName() => $_has(0);
  @$pb.TagNumber(1)
  void clearServerConfigName() => clearField(1);

  @$pb.TagNumber(2)
  ExportTask get task => $_getN(1);
  @$pb.TagNumber(2)
  set task(ExportTask v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTask() => $_has(1);
  @$pb.TagNumber(2)
  void clearTask() => clearField(2);
  @$pb.TagNumber(2)
  ExportTask ensureTask() => $_ensure(1);
}

class FrameworkConfig extends $pb.GeneratedMessage {
  factory FrameworkConfig({
    $core.String? language,
    $core.String? storagePath,
    BuildTaskConfig? buildConfig,
    $core.String? githubBaseUrl,
    UserCenterConfig? userCenterConfig,
  }) {
    final $result = create();
    if (language != null) {
      $result.language = language;
    }
    if (storagePath != null) {
      $result.storagePath = storagePath;
    }
    if (buildConfig != null) {
      $result.buildConfig = buildConfig;
    }
    if (githubBaseUrl != null) {
      $result.githubBaseUrl = githubBaseUrl;
    }
    if (userCenterConfig != null) {
      $result.userCenterConfig = userCenterConfig;
    }
    return $result;
  }
  FrameworkConfig._() : super();
  factory FrameworkConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FrameworkConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FrameworkConfig', package: const $pb.PackageName(_omitMessageNames ? '' : 'fatalder'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'language')
    ..aOS(2, _omitFieldNames ? '' : 'storagePath')
    ..aOM<BuildTaskConfig>(3, _omitFieldNames ? '' : 'buildConfig', subBuilder: BuildTaskConfig.create)
    ..aOS(4, _omitFieldNames ? '' : 'githubBaseUrl')
    ..aOM<UserCenterConfig>(5, _omitFieldNames ? '' : 'userCenterConfig', subBuilder: UserCenterConfig.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FrameworkConfig clone() => FrameworkConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FrameworkConfig copyWith(void Function(FrameworkConfig) updates) => super.copyWith((message) => updates(message as FrameworkConfig)) as FrameworkConfig;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FrameworkConfig create() => FrameworkConfig._();
  FrameworkConfig createEmptyInstance() => create();
  static $pb.PbList<FrameworkConfig> createRepeated() => $pb.PbList<FrameworkConfig>();
  @$core.pragma('dart2js:noInline')
  static FrameworkConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FrameworkConfig>(create);
  static FrameworkConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get language => $_getSZ(0);
  @$pb.TagNumber(1)
  set language($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLanguage() => $_has(0);
  @$pb.TagNumber(1)
  void clearLanguage() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get storagePath => $_getSZ(1);
  @$pb.TagNumber(2)
  set storagePath($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStoragePath() => $_has(1);
  @$pb.TagNumber(2)
  void clearStoragePath() => clearField(2);

  @$pb.TagNumber(3)
  BuildTaskConfig get buildConfig => $_getN(2);
  @$pb.TagNumber(3)
  set buildConfig(BuildTaskConfig v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasBuildConfig() => $_has(2);
  @$pb.TagNumber(3)
  void clearBuildConfig() => clearField(3);
  @$pb.TagNumber(3)
  BuildTaskConfig ensureBuildConfig() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get githubBaseUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set githubBaseUrl($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasGithubBaseUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearGithubBaseUrl() => clearField(4);

  @$pb.TagNumber(5)
  UserCenterConfig get userCenterConfig => $_getN(4);
  @$pb.TagNumber(5)
  set userCenterConfig(UserCenterConfig v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasUserCenterConfig() => $_has(4);
  @$pb.TagNumber(5)
  void clearUserCenterConfig() => clearField(5);
  @$pb.TagNumber(5)
  UserCenterConfig ensureUserCenterConfig() => $_ensure(4);
}

class BuildTaskConfig extends $pb.GeneratedMessage {
  factory BuildTaskConfig({
    $core.int? minOnceParseChunkNum,
    $core.double? minMatchingDegree,
    $core.int? maxFixDepth,
  }) {
    final $result = create();
    if (minOnceParseChunkNum != null) {
      $result.minOnceParseChunkNum = minOnceParseChunkNum;
    }
    if (minMatchingDegree != null) {
      $result.minMatchingDegree = minMatchingDegree;
    }
    if (maxFixDepth != null) {
      $result.maxFixDepth = maxFixDepth;
    }
    return $result;
  }
  BuildTaskConfig._() : super();
  factory BuildTaskConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BuildTaskConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BuildTaskConfig', package: const $pb.PackageName(_omitMessageNames ? '' : 'fatalder'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'minOnceParseChunkNum', $pb.PbFieldType.O3)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'minMatchingDegree', $pb.PbFieldType.OD)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'maxFixDepth', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BuildTaskConfig clone() => BuildTaskConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BuildTaskConfig copyWith(void Function(BuildTaskConfig) updates) => super.copyWith((message) => updates(message as BuildTaskConfig)) as BuildTaskConfig;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BuildTaskConfig create() => BuildTaskConfig._();
  BuildTaskConfig createEmptyInstance() => create();
  static $pb.PbList<BuildTaskConfig> createRepeated() => $pb.PbList<BuildTaskConfig>();
  @$core.pragma('dart2js:noInline')
  static BuildTaskConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BuildTaskConfig>(create);
  static BuildTaskConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get minOnceParseChunkNum => $_getIZ(0);
  @$pb.TagNumber(1)
  set minOnceParseChunkNum($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMinOnceParseChunkNum() => $_has(0);
  @$pb.TagNumber(1)
  void clearMinOnceParseChunkNum() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get minMatchingDegree => $_getN(1);
  @$pb.TagNumber(2)
  set minMatchingDegree($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMinMatchingDegree() => $_has(1);
  @$pb.TagNumber(2)
  void clearMinMatchingDegree() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get maxFixDepth => $_getIZ(2);
  @$pb.TagNumber(3)
  set maxFixDepth($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMaxFixDepth() => $_has(2);
  @$pb.TagNumber(3)
  void clearMaxFixDepth() => clearField(3);
}

class UserCenterConfig extends $pb.GeneratedMessage {
  factory UserCenterConfig({
    $core.String? baseRoot,
    $core.String? apiKey,
  }) {
    final $result = create();
    if (baseRoot != null) {
      $result.baseRoot = baseRoot;
    }
    if (apiKey != null) {
      $result.apiKey = apiKey;
    }
    return $result;
  }
  UserCenterConfig._() : super();
  factory UserCenterConfig.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserCenterConfig.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserCenterConfig', package: const $pb.PackageName(_omitMessageNames ? '' : 'fatalder'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'baseRoot')
    ..aOS(2, _omitFieldNames ? '' : 'apiKey')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserCenterConfig clone() => UserCenterConfig()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserCenterConfig copyWith(void Function(UserCenterConfig) updates) => super.copyWith((message) => updates(message as UserCenterConfig)) as UserCenterConfig;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserCenterConfig create() => UserCenterConfig._();
  UserCenterConfig createEmptyInstance() => create();
  static $pb.PbList<UserCenterConfig> createRepeated() => $pb.PbList<UserCenterConfig>();
  @$core.pragma('dart2js:noInline')
  static UserCenterConfig getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserCenterConfig>(create);
  static UserCenterConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get baseRoot => $_getSZ(0);
  @$pb.TagNumber(1)
  set baseRoot($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBaseRoot() => $_has(0);
  @$pb.TagNumber(1)
  void clearBaseRoot() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get apiKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set apiKey($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasApiKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearApiKey() => clearField(2);
}

class ValidateAPIKeyRequest extends $pb.GeneratedMessage {
  factory ValidateAPIKeyRequest({
    $core.String? apiKey,
  }) {
    final $result = create();
    if (apiKey != null) {
      $result.apiKey = apiKey;
    }
    return $result;
  }
  ValidateAPIKeyRequest._() : super();
  factory ValidateAPIKeyRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ValidateAPIKeyRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ValidateAPIKeyRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fatalder'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'apiKey')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ValidateAPIKeyRequest clone() => ValidateAPIKeyRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ValidateAPIKeyRequest copyWith(void Function(ValidateAPIKeyRequest) updates) => super.copyWith((message) => updates(message as ValidateAPIKeyRequest)) as ValidateAPIKeyRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ValidateAPIKeyRequest create() => ValidateAPIKeyRequest._();
  ValidateAPIKeyRequest createEmptyInstance() => create();
  static $pb.PbList<ValidateAPIKeyRequest> createRepeated() => $pb.PbList<ValidateAPIKeyRequest>();
  @$core.pragma('dart2js:noInline')
  static ValidateAPIKeyRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ValidateAPIKeyRequest>(create);
  static ValidateAPIKeyRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get apiKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set apiKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasApiKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearApiKey() => clearField(1);
}

class ValidateAPIKeyResponse extends $pb.GeneratedMessage {
  factory ValidateAPIKeyResponse({
    $core.bool? valid,
    $core.String? message,
  }) {
    final $result = create();
    if (valid != null) {
      $result.valid = valid;
    }
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  ValidateAPIKeyResponse._() : super();
  factory ValidateAPIKeyResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ValidateAPIKeyResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ValidateAPIKeyResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'fatalder'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'valid')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ValidateAPIKeyResponse clone() => ValidateAPIKeyResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ValidateAPIKeyResponse copyWith(void Function(ValidateAPIKeyResponse) updates) => super.copyWith((message) => updates(message as ValidateAPIKeyResponse)) as ValidateAPIKeyResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ValidateAPIKeyResponse create() => ValidateAPIKeyResponse._();
  ValidateAPIKeyResponse createEmptyInstance() => create();
  static $pb.PbList<ValidateAPIKeyResponse> createRepeated() => $pb.PbList<ValidateAPIKeyResponse>();
  @$core.pragma('dart2js:noInline')
  static ValidateAPIKeyResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ValidateAPIKeyResponse>(create);
  static ValidateAPIKeyResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get valid => $_getBF(0);
  @$pb.TagNumber(1)
  set valid($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasValid() => $_has(0);
  @$pb.TagNumber(1)
  void clearValid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

class ListFilesRequest extends $pb.GeneratedMessage {
  factory ListFilesRequest({
    $core.String? path,
  }) {
    final $result = create();
    if (path != null) {
      $result.path = path;
    }
    return $result;
  }
  ListFilesRequest._() : super();
  factory ListFilesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListFilesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListFilesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fatalder'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'path')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListFilesRequest clone() => ListFilesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListFilesRequest copyWith(void Function(ListFilesRequest) updates) => super.copyWith((message) => updates(message as ListFilesRequest)) as ListFilesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListFilesRequest create() => ListFilesRequest._();
  ListFilesRequest createEmptyInstance() => create();
  static $pb.PbList<ListFilesRequest> createRepeated() => $pb.PbList<ListFilesRequest>();
  @$core.pragma('dart2js:noInline')
  static ListFilesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListFilesRequest>(create);
  static ListFilesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get path => $_getSZ(0);
  @$pb.TagNumber(1)
  set path($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearPath() => clearField(1);
}

class FileInfo extends $pb.GeneratedMessage {
  factory FileInfo({
    $core.String? name,
    $core.bool? isDir,
    $fixnum.Int64? size,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (isDir != null) {
      $result.isDir = isDir;
    }
    if (size != null) {
      $result.size = size;
    }
    return $result;
  }
  FileInfo._() : super();
  factory FileInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FileInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'fatalder'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOB(2, _omitFieldNames ? '' : 'isDir')
    ..aInt64(3, _omitFieldNames ? '' : 'size')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FileInfo clone() => FileInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FileInfo copyWith(void Function(FileInfo) updates) => super.copyWith((message) => updates(message as FileInfo)) as FileInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FileInfo create() => FileInfo._();
  FileInfo createEmptyInstance() => create();
  static $pb.PbList<FileInfo> createRepeated() => $pb.PbList<FileInfo>();
  @$core.pragma('dart2js:noInline')
  static FileInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileInfo>(create);
  static FileInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isDir => $_getBF(1);
  @$pb.TagNumber(2)
  set isDir($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsDir() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsDir() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get size => $_getI64(2);
  @$pb.TagNumber(3)
  set size($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearSize() => clearField(3);
}

class FileList extends $pb.GeneratedMessage {
  factory FileList({
    $core.Iterable<FileInfo>? files,
  }) {
    final $result = create();
    if (files != null) {
      $result.files.addAll(files);
    }
    return $result;
  }
  FileList._() : super();
  factory FileList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FileList', package: const $pb.PackageName(_omitMessageNames ? '' : 'fatalder'), createEmptyInstance: create)
    ..pc<FileInfo>(1, _omitFieldNames ? '' : 'files', $pb.PbFieldType.PM, subBuilder: FileInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FileList clone() => FileList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FileList copyWith(void Function(FileList) updates) => super.copyWith((message) => updates(message as FileList)) as FileList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FileList create() => FileList._();
  FileList createEmptyInstance() => create();
  static $pb.PbList<FileList> createRepeated() => $pb.PbList<FileList>();
  @$core.pragma('dart2js:noInline')
  static FileList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileList>(create);
  static FileList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<FileInfo> get files => $_getList(0);
}

class StreamLogsRequest extends $pb.GeneratedMessage {
  factory StreamLogsRequest({
    $core.String? filter,
  }) {
    final $result = create();
    if (filter != null) {
      $result.filter = filter;
    }
    return $result;
  }
  StreamLogsRequest._() : super();
  factory StreamLogsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StreamLogsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StreamLogsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fatalder'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'filter')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StreamLogsRequest clone() => StreamLogsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StreamLogsRequest copyWith(void Function(StreamLogsRequest) updates) => super.copyWith((message) => updates(message as StreamLogsRequest)) as StreamLogsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamLogsRequest create() => StreamLogsRequest._();
  StreamLogsRequest createEmptyInstance() => create();
  static $pb.PbList<StreamLogsRequest> createRepeated() => $pb.PbList<StreamLogsRequest>();
  @$core.pragma('dart2js:noInline')
  static StreamLogsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StreamLogsRequest>(create);
  static StreamLogsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get filter => $_getSZ(0);
  @$pb.TagNumber(1)
  set filter($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFilter() => $_has(0);
  @$pb.TagNumber(1)
  void clearFilter() => clearField(1);
}

class LogMessage extends $pb.GeneratedMessage {
  factory LogMessage({
    $core.String? timestamp,
    $core.String? level,
    $core.String? message,
    $core.String? source,
  }) {
    final $result = create();
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    if (level != null) {
      $result.level = level;
    }
    if (message != null) {
      $result.message = message;
    }
    if (source != null) {
      $result.source = source;
    }
    return $result;
  }
  LogMessage._() : super();
  factory LogMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LogMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LogMessage', package: const $pb.PackageName(_omitMessageNames ? '' : 'fatalder'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'timestamp')
    ..aOS(2, _omitFieldNames ? '' : 'level')
    ..aOS(3, _omitFieldNames ? '' : 'message')
    ..aOS(4, _omitFieldNames ? '' : 'source')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LogMessage clone() => LogMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LogMessage copyWith(void Function(LogMessage) updates) => super.copyWith((message) => updates(message as LogMessage)) as LogMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LogMessage create() => LogMessage._();
  LogMessage createEmptyInstance() => create();
  static $pb.PbList<LogMessage> createRepeated() => $pb.PbList<LogMessage>();
  @$core.pragma('dart2js:noInline')
  static LogMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LogMessage>(create);
  static LogMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get timestamp => $_getSZ(0);
  @$pb.TagNumber(1)
  set timestamp($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTimestamp() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimestamp() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get level => $_getSZ(1);
  @$pb.TagNumber(2)
  set level($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearLevel() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get source => $_getSZ(3);
  @$pb.TagNumber(4)
  set source($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSource() => $_has(3);
  @$pb.TagNumber(4)
  void clearSource() => clearField(4);
}

class FatalderServiceApi {
  $pb.RpcClient _client;
  FatalderServiceApi(this._client);

  $async.Future<ServerConfigList> listServerConfigs($pb.ClientContext? ctx, Empty request) =>
    _client.invoke<ServerConfigList>(ctx, 'FatalderService', 'ListServerConfigs', request, ServerConfigList())
  ;
  $async.Future<ServerConfig> getServerConfig($pb.ClientContext? ctx, GetServerConfigRequest request) =>
    _client.invoke<ServerConfig>(ctx, 'FatalderService', 'GetServerConfig', request, ServerConfig())
  ;
  $async.Future<ServerConfig> createServerConfig($pb.ClientContext? ctx, ServerConfig request) =>
    _client.invoke<ServerConfig>(ctx, 'FatalderService', 'CreateServerConfig', request, ServerConfig())
  ;
  $async.Future<ServerConfig> updateServerConfig($pb.ClientContext? ctx, ServerConfig request) =>
    _client.invoke<ServerConfig>(ctx, 'FatalderService', 'UpdateServerConfig', request, ServerConfig())
  ;
  $async.Future<Empty> deleteServerConfig($pb.ClientContext? ctx, DeleteServerConfigRequest request) =>
    _client.invoke<Empty>(ctx, 'FatalderService', 'DeleteServerConfig', request, Empty())
  ;
  $async.Future<TaskGroupList> listTaskGroups($pb.ClientContext? ctx, Empty request) =>
    _client.invoke<TaskGroupList>(ctx, 'FatalderService', 'ListTaskGroups', request, TaskGroupList())
  ;
  $async.Future<TaskGroup> getTaskGroup($pb.ClientContext? ctx, GetTaskGroupRequest request) =>
    _client.invoke<TaskGroup>(ctx, 'FatalderService', 'GetTaskGroup', request, TaskGroup())
  ;
  $async.Future<TaskGroup> createTaskGroup($pb.ClientContext? ctx, CreateTaskGroupRequest request) =>
    _client.invoke<TaskGroup>(ctx, 'FatalderService', 'CreateTaskGroup', request, TaskGroup())
  ;
  $async.Future<Empty> deleteTaskGroup($pb.ClientContext? ctx, DeleteTaskGroupRequest request) =>
    _client.invoke<Empty>(ctx, 'FatalderService', 'DeleteTaskGroup', request, Empty())
  ;
  $async.Future<TaskProgress> executeTaskGroup($pb.ClientContext? ctx, ExecuteTaskGroupRequest request) =>
    _client.invoke<TaskProgress>(ctx, 'FatalderService', 'ExecuteTaskGroup', request, TaskProgress())
  ;
  $async.Future<BuildProgress> startBuild($pb.ClientContext? ctx, StartBuildRequest request) =>
    _client.invoke<BuildProgress>(ctx, 'FatalderService', 'StartBuild', request, BuildProgress())
  ;
  $async.Future<Empty> controlBuild($pb.ClientContext? ctx, BuildControlRequest request) =>
    _client.invoke<Empty>(ctx, 'FatalderService', 'ControlBuild', request, Empty())
  ;
  $async.Future<ExportProgress> startExport($pb.ClientContext? ctx, StartExportRequest request) =>
    _client.invoke<ExportProgress>(ctx, 'FatalderService', 'StartExport', request, ExportProgress())
  ;
  $async.Future<FrameworkConfig> getFrameworkConfig($pb.ClientContext? ctx, Empty request) =>
    _client.invoke<FrameworkConfig>(ctx, 'FatalderService', 'GetFrameworkConfig', request, FrameworkConfig())
  ;
  $async.Future<FrameworkConfig> updateFrameworkConfig($pb.ClientContext? ctx, FrameworkConfig request) =>
    _client.invoke<FrameworkConfig>(ctx, 'FatalderService', 'UpdateFrameworkConfig', request, FrameworkConfig())
  ;
  $async.Future<ValidateAPIKeyResponse> validateAPIKey($pb.ClientContext? ctx, ValidateAPIKeyRequest request) =>
    _client.invoke<ValidateAPIKeyResponse>(ctx, 'FatalderService', 'ValidateAPIKey', request, ValidateAPIKeyResponse())
  ;
  $async.Future<FileList> listFiles($pb.ClientContext? ctx, ListFilesRequest request) =>
    _client.invoke<FileList>(ctx, 'FatalderService', 'ListFiles', request, FileList())
  ;
  $async.Future<LogMessage> streamLogs($pb.ClientContext? ctx, StreamLogsRequest request) =>
    _client.invoke<LogMessage>(ctx, 'FatalderService', 'StreamLogs', request, LogMessage())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
