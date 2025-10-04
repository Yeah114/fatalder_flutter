//
//  Generated code. Do not modify.
//  source: fatalder.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'fatalder.pb.dart' as $0;
import 'fatalder.pbjson.dart';

export 'fatalder.pb.dart';

abstract class FatalderServiceBase extends $pb.GeneratedService {
  $async.Future<$0.ServerConfigList> listServerConfigs($pb.ServerContext ctx, $0.Empty request);
  $async.Future<$0.ServerConfig> getServerConfig($pb.ServerContext ctx, $0.GetServerConfigRequest request);
  $async.Future<$0.ServerConfig> createServerConfig($pb.ServerContext ctx, $0.ServerConfig request);
  $async.Future<$0.ServerConfig> updateServerConfig($pb.ServerContext ctx, $0.ServerConfig request);
  $async.Future<$0.Empty> deleteServerConfig($pb.ServerContext ctx, $0.DeleteServerConfigRequest request);
  $async.Future<$0.TaskGroupList> listTaskGroups($pb.ServerContext ctx, $0.Empty request);
  $async.Future<$0.TaskGroup> getTaskGroup($pb.ServerContext ctx, $0.GetTaskGroupRequest request);
  $async.Future<$0.TaskGroup> createTaskGroup($pb.ServerContext ctx, $0.CreateTaskGroupRequest request);
  $async.Future<$0.Empty> deleteTaskGroup($pb.ServerContext ctx, $0.DeleteTaskGroupRequest request);
  $async.Future<$0.TaskProgress> executeTaskGroup($pb.ServerContext ctx, $0.ExecuteTaskGroupRequest request);
  $async.Future<$0.BuildProgress> startBuild($pb.ServerContext ctx, $0.StartBuildRequest request);
  $async.Future<$0.Empty> controlBuild($pb.ServerContext ctx, $0.BuildControlRequest request);
  $async.Future<$0.ExportProgress> startExport($pb.ServerContext ctx, $0.StartExportRequest request);
  $async.Future<$0.FrameworkConfig> getFrameworkConfig($pb.ServerContext ctx, $0.Empty request);
  $async.Future<$0.FrameworkConfig> updateFrameworkConfig($pb.ServerContext ctx, $0.FrameworkConfig request);
  $async.Future<$0.ValidateAPIKeyResponse> validateAPIKey($pb.ServerContext ctx, $0.ValidateAPIKeyRequest request);
  $async.Future<$0.FileList> listFiles($pb.ServerContext ctx, $0.ListFilesRequest request);
  $async.Future<$0.LogMessage> streamLogs($pb.ServerContext ctx, $0.StreamLogsRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'ListServerConfigs': return $0.Empty();
      case 'GetServerConfig': return $0.GetServerConfigRequest();
      case 'CreateServerConfig': return $0.ServerConfig();
      case 'UpdateServerConfig': return $0.ServerConfig();
      case 'DeleteServerConfig': return $0.DeleteServerConfigRequest();
      case 'ListTaskGroups': return $0.Empty();
      case 'GetTaskGroup': return $0.GetTaskGroupRequest();
      case 'CreateTaskGroup': return $0.CreateTaskGroupRequest();
      case 'DeleteTaskGroup': return $0.DeleteTaskGroupRequest();
      case 'ExecuteTaskGroup': return $0.ExecuteTaskGroupRequest();
      case 'StartBuild': return $0.StartBuildRequest();
      case 'ControlBuild': return $0.BuildControlRequest();
      case 'StartExport': return $0.StartExportRequest();
      case 'GetFrameworkConfig': return $0.Empty();
      case 'UpdateFrameworkConfig': return $0.FrameworkConfig();
      case 'ValidateAPIKey': return $0.ValidateAPIKeyRequest();
      case 'ListFiles': return $0.ListFilesRequest();
      case 'StreamLogs': return $0.StreamLogsRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'ListServerConfigs': return this.listServerConfigs(ctx, request as $0.Empty);
      case 'GetServerConfig': return this.getServerConfig(ctx, request as $0.GetServerConfigRequest);
      case 'CreateServerConfig': return this.createServerConfig(ctx, request as $0.ServerConfig);
      case 'UpdateServerConfig': return this.updateServerConfig(ctx, request as $0.ServerConfig);
      case 'DeleteServerConfig': return this.deleteServerConfig(ctx, request as $0.DeleteServerConfigRequest);
      case 'ListTaskGroups': return this.listTaskGroups(ctx, request as $0.Empty);
      case 'GetTaskGroup': return this.getTaskGroup(ctx, request as $0.GetTaskGroupRequest);
      case 'CreateTaskGroup': return this.createTaskGroup(ctx, request as $0.CreateTaskGroupRequest);
      case 'DeleteTaskGroup': return this.deleteTaskGroup(ctx, request as $0.DeleteTaskGroupRequest);
      case 'ExecuteTaskGroup': return this.executeTaskGroup(ctx, request as $0.ExecuteTaskGroupRequest);
      case 'StartBuild': return this.startBuild(ctx, request as $0.StartBuildRequest);
      case 'ControlBuild': return this.controlBuild(ctx, request as $0.BuildControlRequest);
      case 'StartExport': return this.startExport(ctx, request as $0.StartExportRequest);
      case 'GetFrameworkConfig': return this.getFrameworkConfig(ctx, request as $0.Empty);
      case 'UpdateFrameworkConfig': return this.updateFrameworkConfig(ctx, request as $0.FrameworkConfig);
      case 'ValidateAPIKey': return this.validateAPIKey(ctx, request as $0.ValidateAPIKeyRequest);
      case 'ListFiles': return this.listFiles(ctx, request as $0.ListFilesRequest);
      case 'StreamLogs': return this.streamLogs(ctx, request as $0.StreamLogsRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => FatalderServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => FatalderServiceBase$messageJson;
}

