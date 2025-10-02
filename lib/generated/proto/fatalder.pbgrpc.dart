//
//  Generated code. Do not modify.
//  source: proto/fatalder.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'fatalder.pb.dart' as $0;

export 'fatalder.pb.dart';

@$pb.GrpcServiceName('fatalder.FatalderService')
class FatalderServiceClient extends $grpc.Client {
  static final _$listServerConfigs = $grpc.ClientMethod<$0.Empty, $0.ServerConfigList>(
      '/fatalder.FatalderService/ListServerConfigs',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ServerConfigList.fromBuffer(value));
  static final _$getServerConfig = $grpc.ClientMethod<$0.GetServerConfigRequest, $0.ServerConfig>(
      '/fatalder.FatalderService/GetServerConfig',
      ($0.GetServerConfigRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ServerConfig.fromBuffer(value));
  static final _$createServerConfig = $grpc.ClientMethod<$0.ServerConfig, $0.ServerConfig>(
      '/fatalder.FatalderService/CreateServerConfig',
      ($0.ServerConfig value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ServerConfig.fromBuffer(value));
  static final _$updateServerConfig = $grpc.ClientMethod<$0.ServerConfig, $0.ServerConfig>(
      '/fatalder.FatalderService/UpdateServerConfig',
      ($0.ServerConfig value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ServerConfig.fromBuffer(value));
  static final _$deleteServerConfig = $grpc.ClientMethod<$0.DeleteServerConfigRequest, $0.Empty>(
      '/fatalder.FatalderService/DeleteServerConfig',
      ($0.DeleteServerConfigRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$listTaskGroups = $grpc.ClientMethod<$0.Empty, $0.TaskGroupList>(
      '/fatalder.FatalderService/ListTaskGroups',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TaskGroupList.fromBuffer(value));
  static final _$getTaskGroup = $grpc.ClientMethod<$0.GetTaskGroupRequest, $0.TaskGroup>(
      '/fatalder.FatalderService/GetTaskGroup',
      ($0.GetTaskGroupRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TaskGroup.fromBuffer(value));
  static final _$createTaskGroup = $grpc.ClientMethod<$0.CreateTaskGroupRequest, $0.TaskGroup>(
      '/fatalder.FatalderService/CreateTaskGroup',
      ($0.CreateTaskGroupRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TaskGroup.fromBuffer(value));
  static final _$deleteTaskGroup = $grpc.ClientMethod<$0.DeleteTaskGroupRequest, $0.Empty>(
      '/fatalder.FatalderService/DeleteTaskGroup',
      ($0.DeleteTaskGroupRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$executeTaskGroup = $grpc.ClientMethod<$0.ExecuteTaskGroupRequest, $0.TaskProgress>(
      '/fatalder.FatalderService/ExecuteTaskGroup',
      ($0.ExecuteTaskGroupRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TaskProgress.fromBuffer(value));
  static final _$startBuild = $grpc.ClientMethod<$0.StartBuildRequest, $0.BuildProgress>(
      '/fatalder.FatalderService/StartBuild',
      ($0.StartBuildRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.BuildProgress.fromBuffer(value));
  static final _$controlBuild = $grpc.ClientMethod<$0.BuildControlRequest, $0.Empty>(
      '/fatalder.FatalderService/ControlBuild',
      ($0.BuildControlRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$startExport = $grpc.ClientMethod<$0.StartExportRequest, $0.ExportProgress>(
      '/fatalder.FatalderService/StartExport',
      ($0.StartExportRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ExportProgress.fromBuffer(value));
  static final _$getFrameworkConfig = $grpc.ClientMethod<$0.Empty, $0.FrameworkConfig>(
      '/fatalder.FatalderService/GetFrameworkConfig',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.FrameworkConfig.fromBuffer(value));
  static final _$updateFrameworkConfig = $grpc.ClientMethod<$0.FrameworkConfig, $0.FrameworkConfig>(
      '/fatalder.FatalderService/UpdateFrameworkConfig',
      ($0.FrameworkConfig value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.FrameworkConfig.fromBuffer(value));
  static final _$validateAPIKey = $grpc.ClientMethod<$0.ValidateAPIKeyRequest, $0.ValidateAPIKeyResponse>(
      '/fatalder.FatalderService/ValidateAPIKey',
      ($0.ValidateAPIKeyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ValidateAPIKeyResponse.fromBuffer(value));
  static final _$listFiles = $grpc.ClientMethod<$0.ListFilesRequest, $0.FileList>(
      '/fatalder.FatalderService/ListFiles',
      ($0.ListFilesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.FileList.fromBuffer(value));

  FatalderServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.ServerConfigList> listServerConfigs($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listServerConfigs, request, options: options);
  }

  $grpc.ResponseFuture<$0.ServerConfig> getServerConfig($0.GetServerConfigRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getServerConfig, request, options: options);
  }

  $grpc.ResponseFuture<$0.ServerConfig> createServerConfig($0.ServerConfig request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createServerConfig, request, options: options);
  }

  $grpc.ResponseFuture<$0.ServerConfig> updateServerConfig($0.ServerConfig request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateServerConfig, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> deleteServerConfig($0.DeleteServerConfigRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteServerConfig, request, options: options);
  }

  $grpc.ResponseFuture<$0.TaskGroupList> listTaskGroups($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listTaskGroups, request, options: options);
  }

  $grpc.ResponseFuture<$0.TaskGroup> getTaskGroup($0.GetTaskGroupRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTaskGroup, request, options: options);
  }

  $grpc.ResponseFuture<$0.TaskGroup> createTaskGroup($0.CreateTaskGroupRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createTaskGroup, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> deleteTaskGroup($0.DeleteTaskGroupRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteTaskGroup, request, options: options);
  }

  $grpc.ResponseStream<$0.TaskProgress> executeTaskGroup($0.ExecuteTaskGroupRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$executeTaskGroup, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseStream<$0.BuildProgress> startBuild($0.StartBuildRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$startBuild, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$0.Empty> controlBuild($0.BuildControlRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$controlBuild, request, options: options);
  }

  $grpc.ResponseStream<$0.ExportProgress> startExport($0.StartExportRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$startExport, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$0.FrameworkConfig> getFrameworkConfig($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFrameworkConfig, request, options: options);
  }

  $grpc.ResponseFuture<$0.FrameworkConfig> updateFrameworkConfig($0.FrameworkConfig request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateFrameworkConfig, request, options: options);
  }

  $grpc.ResponseFuture<$0.ValidateAPIKeyResponse> validateAPIKey($0.ValidateAPIKeyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$validateAPIKey, request, options: options);
  }

  $grpc.ResponseFuture<$0.FileList> listFiles($0.ListFilesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listFiles, request, options: options);
  }
}

@$pb.GrpcServiceName('fatalder.FatalderService')
abstract class FatalderServiceBase extends $grpc.Service {
  $core.String get $name => 'fatalder.FatalderService';

  FatalderServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.ServerConfigList>(
        'ListServerConfigs',
        listServerConfigs_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.ServerConfigList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetServerConfigRequest, $0.ServerConfig>(
        'GetServerConfig',
        getServerConfig_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetServerConfigRequest.fromBuffer(value),
        ($0.ServerConfig value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ServerConfig, $0.ServerConfig>(
        'CreateServerConfig',
        createServerConfig_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ServerConfig.fromBuffer(value),
        ($0.ServerConfig value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ServerConfig, $0.ServerConfig>(
        'UpdateServerConfig',
        updateServerConfig_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ServerConfig.fromBuffer(value),
        ($0.ServerConfig value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteServerConfigRequest, $0.Empty>(
        'DeleteServerConfig',
        deleteServerConfig_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteServerConfigRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.TaskGroupList>(
        'ListTaskGroups',
        listTaskGroups_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.TaskGroupList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetTaskGroupRequest, $0.TaskGroup>(
        'GetTaskGroup',
        getTaskGroup_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetTaskGroupRequest.fromBuffer(value),
        ($0.TaskGroup value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateTaskGroupRequest, $0.TaskGroup>(
        'CreateTaskGroup',
        createTaskGroup_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateTaskGroupRequest.fromBuffer(value),
        ($0.TaskGroup value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteTaskGroupRequest, $0.Empty>(
        'DeleteTaskGroup',
        deleteTaskGroup_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteTaskGroupRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ExecuteTaskGroupRequest, $0.TaskProgress>(
        'ExecuteTaskGroup',
        executeTaskGroup_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.ExecuteTaskGroupRequest.fromBuffer(value),
        ($0.TaskProgress value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.StartBuildRequest, $0.BuildProgress>(
        'StartBuild',
        startBuild_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.StartBuildRequest.fromBuffer(value),
        ($0.BuildProgress value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.BuildControlRequest, $0.Empty>(
        'ControlBuild',
        controlBuild_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.BuildControlRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.StartExportRequest, $0.ExportProgress>(
        'StartExport',
        startExport_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.StartExportRequest.fromBuffer(value),
        ($0.ExportProgress value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.FrameworkConfig>(
        'GetFrameworkConfig',
        getFrameworkConfig_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.FrameworkConfig value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FrameworkConfig, $0.FrameworkConfig>(
        'UpdateFrameworkConfig',
        updateFrameworkConfig_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FrameworkConfig.fromBuffer(value),
        ($0.FrameworkConfig value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ValidateAPIKeyRequest, $0.ValidateAPIKeyResponse>(
        'ValidateAPIKey',
        validateAPIKey_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ValidateAPIKeyRequest.fromBuffer(value),
        ($0.ValidateAPIKeyResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListFilesRequest, $0.FileList>(
        'ListFiles',
        listFiles_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListFilesRequest.fromBuffer(value),
        ($0.FileList value) => value.writeToBuffer()));
  }

  $async.Future<$0.ServerConfigList> listServerConfigs_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return listServerConfigs(call, await request);
  }

  $async.Future<$0.ServerConfig> getServerConfig_Pre($grpc.ServiceCall call, $async.Future<$0.GetServerConfigRequest> request) async {
    return getServerConfig(call, await request);
  }

  $async.Future<$0.ServerConfig> createServerConfig_Pre($grpc.ServiceCall call, $async.Future<$0.ServerConfig> request) async {
    return createServerConfig(call, await request);
  }

  $async.Future<$0.ServerConfig> updateServerConfig_Pre($grpc.ServiceCall call, $async.Future<$0.ServerConfig> request) async {
    return updateServerConfig(call, await request);
  }

  $async.Future<$0.Empty> deleteServerConfig_Pre($grpc.ServiceCall call, $async.Future<$0.DeleteServerConfigRequest> request) async {
    return deleteServerConfig(call, await request);
  }

  $async.Future<$0.TaskGroupList> listTaskGroups_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return listTaskGroups(call, await request);
  }

  $async.Future<$0.TaskGroup> getTaskGroup_Pre($grpc.ServiceCall call, $async.Future<$0.GetTaskGroupRequest> request) async {
    return getTaskGroup(call, await request);
  }

  $async.Future<$0.TaskGroup> createTaskGroup_Pre($grpc.ServiceCall call, $async.Future<$0.CreateTaskGroupRequest> request) async {
    return createTaskGroup(call, await request);
  }

  $async.Future<$0.Empty> deleteTaskGroup_Pre($grpc.ServiceCall call, $async.Future<$0.DeleteTaskGroupRequest> request) async {
    return deleteTaskGroup(call, await request);
  }

  $async.Stream<$0.TaskProgress> executeTaskGroup_Pre($grpc.ServiceCall call, $async.Future<$0.ExecuteTaskGroupRequest> request) async* {
    yield* executeTaskGroup(call, await request);
  }

  $async.Stream<$0.BuildProgress> startBuild_Pre($grpc.ServiceCall call, $async.Future<$0.StartBuildRequest> request) async* {
    yield* startBuild(call, await request);
  }

  $async.Future<$0.Empty> controlBuild_Pre($grpc.ServiceCall call, $async.Future<$0.BuildControlRequest> request) async {
    return controlBuild(call, await request);
  }

  $async.Stream<$0.ExportProgress> startExport_Pre($grpc.ServiceCall call, $async.Future<$0.StartExportRequest> request) async* {
    yield* startExport(call, await request);
  }

  $async.Future<$0.FrameworkConfig> getFrameworkConfig_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getFrameworkConfig(call, await request);
  }

  $async.Future<$0.FrameworkConfig> updateFrameworkConfig_Pre($grpc.ServiceCall call, $async.Future<$0.FrameworkConfig> request) async {
    return updateFrameworkConfig(call, await request);
  }

  $async.Future<$0.ValidateAPIKeyResponse> validateAPIKey_Pre($grpc.ServiceCall call, $async.Future<$0.ValidateAPIKeyRequest> request) async {
    return validateAPIKey(call, await request);
  }

  $async.Future<$0.FileList> listFiles_Pre($grpc.ServiceCall call, $async.Future<$0.ListFilesRequest> request) async {
    return listFiles(call, await request);
  }

  $async.Future<$0.ServerConfigList> listServerConfigs($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.ServerConfig> getServerConfig($grpc.ServiceCall call, $0.GetServerConfigRequest request);
  $async.Future<$0.ServerConfig> createServerConfig($grpc.ServiceCall call, $0.ServerConfig request);
  $async.Future<$0.ServerConfig> updateServerConfig($grpc.ServiceCall call, $0.ServerConfig request);
  $async.Future<$0.Empty> deleteServerConfig($grpc.ServiceCall call, $0.DeleteServerConfigRequest request);
  $async.Future<$0.TaskGroupList> listTaskGroups($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.TaskGroup> getTaskGroup($grpc.ServiceCall call, $0.GetTaskGroupRequest request);
  $async.Future<$0.TaskGroup> createTaskGroup($grpc.ServiceCall call, $0.CreateTaskGroupRequest request);
  $async.Future<$0.Empty> deleteTaskGroup($grpc.ServiceCall call, $0.DeleteTaskGroupRequest request);
  $async.Stream<$0.TaskProgress> executeTaskGroup($grpc.ServiceCall call, $0.ExecuteTaskGroupRequest request);
  $async.Stream<$0.BuildProgress> startBuild($grpc.ServiceCall call, $0.StartBuildRequest request);
  $async.Future<$0.Empty> controlBuild($grpc.ServiceCall call, $0.BuildControlRequest request);
  $async.Stream<$0.ExportProgress> startExport($grpc.ServiceCall call, $0.StartExportRequest request);
  $async.Future<$0.FrameworkConfig> getFrameworkConfig($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.FrameworkConfig> updateFrameworkConfig($grpc.ServiceCall call, $0.FrameworkConfig request);
  $async.Future<$0.ValidateAPIKeyResponse> validateAPIKey($grpc.ServiceCall call, $0.ValidateAPIKeyRequest request);
  $async.Future<$0.FileList> listFiles($grpc.ServiceCall call, $0.ListFilesRequest request);
}
