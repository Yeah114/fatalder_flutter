///
//  Generated code. Do not modify.
//  source: fatalder.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = const {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode('CgVFbXB0eQ==');
@$core.Deprecated('Use blockPosDescriptor instead')
const BlockPos$json = const {
  '1': 'BlockPos',
  '2': const [
    const {'1': 'x', '3': 1, '4': 1, '5': 5, '10': 'x'},
    const {'1': 'y', '3': 2, '4': 1, '5': 5, '10': 'y'},
    const {'1': 'z', '3': 3, '4': 1, '5': 5, '10': 'z'},
  ],
};

/// Descriptor for `BlockPos`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List blockPosDescriptor = $convert.base64Decode('CghCbG9ja1BvcxIMCgF4GAEgASgFUgF4EgwKAXkYAiABKAVSAXkSDAoBehgDIAEoBVIBeg==');
@$core.Deprecated('Use serverConfigDescriptor instead')
const ServerConfig$json = const {
  '1': 'ServerConfig',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'rental_server_code', '3': 2, '4': 1, '5': 9, '10': 'rentalServerCode'},
    const {'1': 'rental_server_passcode', '3': 3, '4': 1, '5': 9, '10': 'rentalServerPasscode'},
  ],
};

/// Descriptor for `ServerConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serverConfigDescriptor = $convert.base64Decode('CgxTZXJ2ZXJDb25maWcSEgoEbmFtZRgBIAEoCVIEbmFtZRIsChJyZW50YWxfc2VydmVyX2NvZGUYAiABKAlSEHJlbnRhbFNlcnZlckNvZGUSNAoWcmVudGFsX3NlcnZlcl9wYXNzY29kZRgDIAEoCVIUcmVudGFsU2VydmVyUGFzc2NvZGU=');
@$core.Deprecated('Use serverConfigListDescriptor instead')
const ServerConfigList$json = const {
  '1': 'ServerConfigList',
  '2': const [
    const {'1': 'configs', '3': 1, '4': 3, '5': 11, '6': '.fatalder.ServerConfig', '10': 'configs'},
  ],
};

/// Descriptor for `ServerConfigList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serverConfigListDescriptor = $convert.base64Decode('ChBTZXJ2ZXJDb25maWdMaXN0EjAKB2NvbmZpZ3MYASADKAsyFi5mYXRhbGRlci5TZXJ2ZXJDb25maWdSB2NvbmZpZ3M=');
@$core.Deprecated('Use getServerConfigRequestDescriptor instead')
const GetServerConfigRequest$json = const {
  '1': 'GetServerConfigRequest',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `GetServerConfigRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getServerConfigRequestDescriptor = $convert.base64Decode('ChZHZXRTZXJ2ZXJDb25maWdSZXF1ZXN0EhIKBG5hbWUYASABKAlSBG5hbWU=');
@$core.Deprecated('Use deleteServerConfigRequestDescriptor instead')
const DeleteServerConfigRequest$json = const {
  '1': 'DeleteServerConfigRequest',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `DeleteServerConfigRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteServerConfigRequestDescriptor = $convert.base64Decode('ChlEZWxldGVTZXJ2ZXJDb25maWdSZXF1ZXN0EhIKBG5hbWUYASABKAlSBG5hbWU=');
@$core.Deprecated('Use buildTaskDescriptor instead')
const BuildTask$json = const {
  '1': 'BuildTask',
  '2': const [
    const {'1': 'task_type', '3': 1, '4': 1, '5': 9, '10': 'taskType'},
    const {'1': 'file_path', '3': 2, '4': 1, '5': 9, '10': 'filePath'},
    const {'1': 'start_pos', '3': 3, '4': 1, '5': 11, '6': '.fatalder.BlockPos', '10': 'startPos'},
    const {'1': 'speed', '3': 4, '4': 1, '5': 5, '10': 'speed'},
    const {'1': 'auto_clean_block', '3': 5, '4': 1, '5': 8, '10': 'autoCleanBlock'},
    const {'1': 'auto_clean_item', '3': 6, '4': 1, '5': 8, '10': 'autoCleanItem'},
    const {'1': 'verify_after_chunk', '3': 7, '4': 1, '5': 5, '10': 'verifyAfterChunk'},
    const {'1': 'verify_chunk_level', '3': 8, '4': 1, '5': 5, '10': 'verifyChunkLevel'},
    const {'1': 'progress', '3': 9, '4': 1, '5': 5, '10': 'progress'},
    const {'1': 'auto_disable_command', '3': 10, '4': 1, '5': 8, '10': 'autoDisableCommand'},
    const {'1': 'auto_upgrade_command', '3': 11, '4': 1, '5': 8, '10': 'autoUpgradeCommand'},
    const {'1': 'ignore_command_block', '3': 12, '4': 1, '5': 8, '10': 'ignoreCommandBlock'},
    const {'1': 'ignore_other_nbt_block', '3': 13, '4': 1, '5': 8, '10': 'ignoreOtherNbtBlock'},
    const {'1': 'console_world_pos', '3': 14, '4': 1, '5': 11, '6': '.fatalder.BlockPos', '10': 'consoleWorldPos'},
    const {'1': 'show_nbt_progress', '3': 15, '4': 1, '5': 8, '10': 'showNbtProgress'},
  ],
};

/// Descriptor for `BuildTask`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List buildTaskDescriptor = $convert.base64Decode('CglCdWlsZFRhc2sSGwoJdGFza190eXBlGAEgASgJUgh0YXNrVHlwZRIbCglmaWxlX3BhdGgYAiABKAlSCGZpbGVQYXRoEi8KCXN0YXJ0X3BvcxgDIAEoCzISLmZhdGFsZGVyLkJsb2NrUG9zUghzdGFydFBvcxIUCgVzcGVlZBgEIAEoBVIFc3BlZWQSKAoQYXV0b19jbGVhbl9ibG9jaxgFIAEoCFIOYXV0b0NsZWFuQmxvY2sSJgoPYXV0b19jbGVhbl9pdGVtGAYgASgIUg1hdXRvQ2xlYW5JdGVtEiwKEnZlcmlmeV9hZnRlcl9jaHVuaxgHIAEoBVIQdmVyaWZ5QWZ0ZXJDaHVuaxIsChJ2ZXJpZnlfY2h1bmtfbGV2ZWwYCCABKAVSEHZlcmlmeUNodW5rTGV2ZWwSGgoIcHJvZ3Jlc3MYCSABKAVSCHByb2dyZXNzEjAKFGF1dG9fZGlzYWJsZV9jb21tYW5kGAogASgIUhJhdXRvRGlzYWJsZUNvbW1hbmQSMAoUYXV0b191cGdyYWRlX2NvbW1hbmQYCyABKAhSEmF1dG9VcGdyYWRlQ29tbWFuZBIwChRpZ25vcmVfY29tbWFuZF9ibG9jaxgMIAEoCFISaWdub3JlQ29tbWFuZEJsb2NrEjMKFmlnbm9yZV9vdGhlcl9uYnRfYmxvY2sYDSABKAhSE2lnbm9yZU90aGVyTmJ0QmxvY2sSPgoRY29uc29sZV93b3JsZF9wb3MYDiABKAsyEi5mYXRhbGRlci5CbG9ja1Bvc1IPY29uc29sZVdvcmxkUG9zEioKEXNob3dfbmJ0X3Byb2dyZXNzGA8gASgIUg9zaG93TmJ0UHJvZ3Jlc3M=');
@$core.Deprecated('Use exportTaskDescriptor instead')
const ExportTask$json = const {
  '1': 'ExportTask',
  '2': const [
    const {'1': 'task_type', '3': 1, '4': 1, '5': 9, '10': 'taskType'},
    const {'1': 'file_path', '3': 2, '4': 1, '5': 9, '10': 'filePath'},
    const {'1': 'file_type', '3': 3, '4': 1, '5': 9, '10': 'fileType'},
    const {'1': 'start_pos', '3': 4, '4': 1, '5': 11, '6': '.fatalder.BlockPos', '10': 'startPos'},
    const {'1': 'end_pos', '3': 5, '4': 1, '5': 11, '6': '.fatalder.BlockPos', '10': 'endPos'},
  ],
};

/// Descriptor for `ExportTask`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exportTaskDescriptor = $convert.base64Decode('CgpFeHBvcnRUYXNrEhsKCXRhc2tfdHlwZRgBIAEoCVIIdGFza1R5cGUSGwoJZmlsZV9wYXRoGAIgASgJUghmaWxlUGF0aBIbCglmaWxlX3R5cGUYAyABKAlSCGZpbGVUeXBlEi8KCXN0YXJ0X3BvcxgEIAEoCzISLmZhdGFsZGVyLkJsb2NrUG9zUghzdGFydFBvcxIrCgdlbmRfcG9zGAUgASgLMhIuZmF0YWxkZXIuQmxvY2tQb3NSBmVuZFBvcw==');
@$core.Deprecated('Use taskDescriptor instead')
const Task$json = const {
  '1': 'Task',
  '2': const [
    const {'1': 'build_task', '3': 1, '4': 1, '5': 11, '6': '.fatalder.BuildTask', '9': 0, '10': 'buildTask'},
    const {'1': 'export_task', '3': 2, '4': 1, '5': 11, '6': '.fatalder.ExportTask', '9': 0, '10': 'exportTask'},
  ],
  '8': const [
    const {'1': 'task'},
  ],
};

/// Descriptor for `Task`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskDescriptor = $convert.base64Decode('CgRUYXNrEjQKCmJ1aWxkX3Rhc2sYASABKAsyEy5mYXRhbGRlci5CdWlsZFRhc2tIAFIJYnVpbGRUYXNrEjcKC2V4cG9ydF90YXNrGAIgASgLMhQuZmF0YWxkZXIuRXhwb3J0VGFza0gAUgpleHBvcnRUYXNrQgYKBHRhc2s=');
@$core.Deprecated('Use taskGroupDescriptor instead')
const TaskGroup$json = const {
  '1': 'TaskGroup',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'tasks', '3': 2, '4': 3, '5': 11, '6': '.fatalder.Task', '10': 'tasks'},
  ],
};

/// Descriptor for `TaskGroup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskGroupDescriptor = $convert.base64Decode('CglUYXNrR3JvdXASEgoEbmFtZRgBIAEoCVIEbmFtZRIkCgV0YXNrcxgCIAMoCzIOLmZhdGFsZGVyLlRhc2tSBXRhc2tz');
@$core.Deprecated('Use taskGroupListDescriptor instead')
const TaskGroupList$json = const {
  '1': 'TaskGroupList',
  '2': const [
    const {'1': 'names', '3': 1, '4': 3, '5': 9, '10': 'names'},
  ],
};

/// Descriptor for `TaskGroupList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskGroupListDescriptor = $convert.base64Decode('Cg1UYXNrR3JvdXBMaXN0EhQKBW5hbWVzGAEgAygJUgVuYW1lcw==');
@$core.Deprecated('Use getTaskGroupRequestDescriptor instead')
const GetTaskGroupRequest$json = const {
  '1': 'GetTaskGroupRequest',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `GetTaskGroupRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTaskGroupRequestDescriptor = $convert.base64Decode('ChNHZXRUYXNrR3JvdXBSZXF1ZXN0EhIKBG5hbWUYASABKAlSBG5hbWU=');
@$core.Deprecated('Use createTaskGroupRequestDescriptor instead')
const CreateTaskGroupRequest$json = const {
  '1': 'CreateTaskGroupRequest',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'tasks', '3': 2, '4': 3, '5': 11, '6': '.fatalder.Task', '10': 'tasks'},
  ],
};

/// Descriptor for `CreateTaskGroupRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createTaskGroupRequestDescriptor = $convert.base64Decode('ChZDcmVhdGVUYXNrR3JvdXBSZXF1ZXN0EhIKBG5hbWUYASABKAlSBG5hbWUSJAoFdGFza3MYAiADKAsyDi5mYXRhbGRlci5UYXNrUgV0YXNrcw==');
@$core.Deprecated('Use deleteTaskGroupRequestDescriptor instead')
const DeleteTaskGroupRequest$json = const {
  '1': 'DeleteTaskGroupRequest',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `DeleteTaskGroupRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteTaskGroupRequestDescriptor = $convert.base64Decode('ChZEZWxldGVUYXNrR3JvdXBSZXF1ZXN0EhIKBG5hbWUYASABKAlSBG5hbWU=');
@$core.Deprecated('Use executeTaskGroupRequestDescriptor instead')
const ExecuteTaskGroupRequest$json = const {
  '1': 'ExecuteTaskGroupRequest',
  '2': const [
    const {'1': 'task_group_name', '3': 1, '4': 1, '5': 9, '10': 'taskGroupName'},
    const {'1': 'server_config_name', '3': 2, '4': 1, '5': 9, '10': 'serverConfigName'},
  ],
};

/// Descriptor for `ExecuteTaskGroupRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List executeTaskGroupRequestDescriptor = $convert.base64Decode('ChdFeGVjdXRlVGFza0dyb3VwUmVxdWVzdBImCg90YXNrX2dyb3VwX25hbWUYASABKAlSDXRhc2tHcm91cE5hbWUSLAoSc2VydmVyX2NvbmZpZ19uYW1lGAIgASgJUhBzZXJ2ZXJDb25maWdOYW1l');
@$core.Deprecated('Use taskProgressDescriptor instead')
const TaskProgress$json = const {
  '1': 'TaskProgress',
  '2': const [
    const {'1': 'task_index', '3': 1, '4': 1, '5': 5, '10': 'taskIndex'},
    const {'1': 'total_tasks', '3': 2, '4': 1, '5': 5, '10': 'totalTasks'},
    const {'1': 'task_type', '3': 3, '4': 1, '5': 9, '10': 'taskType'},
    const {'1': 'message', '3': 4, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'current_chunk', '3': 5, '4': 1, '5': 5, '10': 'currentChunk'},
    const {'1': 'total_chunks', '3': 6, '4': 1, '5': 5, '10': 'totalChunks'},
    const {'1': 'progress_percent', '3': 7, '4': 1, '5': 1, '10': 'progressPercent'},
    const {'1': 'status', '3': 8, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `TaskProgress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskProgressDescriptor = $convert.base64Decode('CgxUYXNrUHJvZ3Jlc3MSHQoKdGFza19pbmRleBgBIAEoBVIJdGFza0luZGV4Eh8KC3RvdGFsX3Rhc2tzGAIgASgFUgp0b3RhbFRhc2tzEhsKCXRhc2tfdHlwZRgDIAEoCVIIdGFza1R5cGUSGAoHbWVzc2FnZRgEIAEoCVIHbWVzc2FnZRIjCg1jdXJyZW50X2NodW5rGAUgASgFUgxjdXJyZW50Q2h1bmsSIQoMdG90YWxfY2h1bmtzGAYgASgFUgt0b3RhbENodW5rcxIpChBwcm9ncmVzc19wZXJjZW50GAcgASgBUg9wcm9ncmVzc1BlcmNlbnQSFgoGc3RhdHVzGAggASgJUgZzdGF0dXM=');
@$core.Deprecated('Use buildProgressDescriptor instead')
const BuildProgress$json = const {
  '1': 'BuildProgress',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'current_chunk', '3': 3, '4': 1, '5': 5, '10': 'currentChunk'},
    const {'1': 'total_chunks', '3': 4, '4': 1, '5': 5, '10': 'totalChunks'},
    const {'1': 'progress_percent', '3': 5, '4': 1, '5': 1, '10': 'progressPercent'},
    const {'1': 'structure_type', '3': 6, '4': 1, '5': 9, '10': 'structureType'},
    const {'1': 'width', '3': 7, '4': 1, '5': 5, '10': 'width'},
    const {'1': 'height', '3': 8, '4': 1, '5': 5, '10': 'height'},
    const {'1': 'length', '3': 9, '4': 1, '5': 5, '10': 'length'},
    const {'1': 'block_count', '3': 10, '4': 1, '5': 5, '10': 'blockCount'},
    const {'1': 'command_block_count', '3': 11, '4': 1, '5': 5, '10': 'commandBlockCount'},
    const {'1': 'nbt_count', '3': 12, '4': 1, '5': 5, '10': 'nbtCount'},
    const {'1': 'cost_deducted', '3': 13, '4': 1, '5': 5, '10': 'costDeducted'},
    const {'1': 'balance', '3': 14, '4': 1, '5': 9, '10': 'balance'},
    const {'1': 'log_message', '3': 15, '4': 1, '5': 9, '10': 'logMessage'},
  ],
};

/// Descriptor for `BuildProgress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List buildProgressDescriptor = $convert.base64Decode('Cg1CdWlsZFByb2dyZXNzEhYKBnN0YXR1cxgBIAEoCVIGc3RhdHVzEhgKB21lc3NhZ2UYAiABKAlSB21lc3NhZ2USIwoNY3VycmVudF9jaHVuaxgDIAEoBVIMY3VycmVudENodW5rEiEKDHRvdGFsX2NodW5rcxgEIAEoBVILdG90YWxDaHVua3MSKQoQcHJvZ3Jlc3NfcGVyY2VudBgFIAEoAVIPcHJvZ3Jlc3NQZXJjZW50EiUKDnN0cnVjdHVyZV90eXBlGAYgASgJUg1zdHJ1Y3R1cmVUeXBlEhQKBXdpZHRoGAcgASgFUgV3aWR0aBIWCgZoZWlnaHQYCCABKAVSBmhlaWdodBIWCgZsZW5ndGgYCSABKAVSBmxlbmd0aBIfCgtibG9ja19jb3VudBgKIAEoBVIKYmxvY2tDb3VudBIuChNjb21tYW5kX2Jsb2NrX2NvdW50GAsgASgFUhFjb21tYW5kQmxvY2tDb3VudBIbCgluYnRfY291bnQYDCABKAVSCG5idENvdW50EiMKDWNvc3RfZGVkdWN0ZWQYDSABKAVSDGNvc3REZWR1Y3RlZBIYCgdiYWxhbmNlGA4gASgJUgdiYWxhbmNlEh8KC2xvZ19tZXNzYWdlGA8gASgJUgpsb2dNZXNzYWdl');
@$core.Deprecated('Use exportProgressDescriptor instead')
const ExportProgress$json = const {
  '1': 'ExportProgress',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'current_chunk', '3': 3, '4': 1, '5': 5, '10': 'currentChunk'},
    const {'1': 'total_chunks', '3': 4, '4': 1, '5': 5, '10': 'totalChunks'},
    const {'1': 'progress_percent', '3': 5, '4': 1, '5': 1, '10': 'progressPercent'},
    const {'1': 'output_path', '3': 6, '4': 1, '5': 9, '10': 'outputPath'},
    const {'1': 'log_message', '3': 7, '4': 1, '5': 9, '10': 'logMessage'},
  ],
};

/// Descriptor for `ExportProgress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exportProgressDescriptor = $convert.base64Decode('Cg5FeHBvcnRQcm9ncmVzcxIWCgZzdGF0dXMYASABKAlSBnN0YXR1cxIYCgdtZXNzYWdlGAIgASgJUgdtZXNzYWdlEiMKDWN1cnJlbnRfY2h1bmsYAyABKAVSDGN1cnJlbnRDaHVuaxIhCgx0b3RhbF9jaHVua3MYBCABKAVSC3RvdGFsQ2h1bmtzEikKEHByb2dyZXNzX3BlcmNlbnQYBSABKAFSD3Byb2dyZXNzUGVyY2VudBIfCgtvdXRwdXRfcGF0aBgGIAEoCVIKb3V0cHV0UGF0aBIfCgtsb2dfbWVzc2FnZRgHIAEoCVIKbG9nTWVzc2FnZQ==');
@$core.Deprecated('Use buildControlRequestDescriptor instead')
const BuildControlRequest$json = const {
  '1': 'BuildControlRequest',
  '2': const [
    const {'1': 'action', '3': 1, '4': 1, '5': 9, '10': 'action'},
  ],
};

/// Descriptor for `BuildControlRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List buildControlRequestDescriptor = $convert.base64Decode('ChNCdWlsZENvbnRyb2xSZXF1ZXN0EhYKBmFjdGlvbhgBIAEoCVIGYWN0aW9u');
@$core.Deprecated('Use startBuildRequestDescriptor instead')
const StartBuildRequest$json = const {
  '1': 'StartBuildRequest',
  '2': const [
    const {'1': 'server_config_name', '3': 1, '4': 1, '5': 9, '10': 'serverConfigName'},
    const {'1': 'task', '3': 2, '4': 1, '5': 11, '6': '.fatalder.BuildTask', '10': 'task'},
    const {'1': 'resume_from_interrupt', '3': 3, '4': 1, '5': 8, '10': 'resumeFromInterrupt'},
  ],
};

/// Descriptor for `StartBuildRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startBuildRequestDescriptor = $convert.base64Decode('ChFTdGFydEJ1aWxkUmVxdWVzdBIsChJzZXJ2ZXJfY29uZmlnX25hbWUYASABKAlSEHNlcnZlckNvbmZpZ05hbWUSJwoEdGFzaxgCIAEoCzITLmZhdGFsZGVyLkJ1aWxkVGFza1IEdGFzaxIyChVyZXN1bWVfZnJvbV9pbnRlcnJ1cHQYAyABKAhSE3Jlc3VtZUZyb21JbnRlcnJ1cHQ=');
@$core.Deprecated('Use startExportRequestDescriptor instead')
const StartExportRequest$json = const {
  '1': 'StartExportRequest',
  '2': const [
    const {'1': 'server_config_name', '3': 1, '4': 1, '5': 9, '10': 'serverConfigName'},
    const {'1': 'task', '3': 2, '4': 1, '5': 11, '6': '.fatalder.ExportTask', '10': 'task'},
  ],
};

/// Descriptor for `StartExportRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startExportRequestDescriptor = $convert.base64Decode('ChJTdGFydEV4cG9ydFJlcXVlc3QSLAoSc2VydmVyX2NvbmZpZ19uYW1lGAEgASgJUhBzZXJ2ZXJDb25maWdOYW1lEigKBHRhc2sYAiABKAsyFC5mYXRhbGRlci5FeHBvcnRUYXNrUgR0YXNr');
@$core.Deprecated('Use frameworkConfigDescriptor instead')
const FrameworkConfig$json = const {
  '1': 'FrameworkConfig',
  '2': const [
    const {'1': 'language', '3': 1, '4': 1, '5': 9, '10': 'language'},
    const {'1': 'storage_path', '3': 2, '4': 1, '5': 9, '10': 'storagePath'},
    const {'1': 'build_config', '3': 3, '4': 1, '5': 11, '6': '.fatalder.BuildTaskConfig', '10': 'buildConfig'},
    const {'1': 'github_base_url', '3': 4, '4': 1, '5': 9, '10': 'githubBaseUrl'},
    const {'1': 'user_center_config', '3': 5, '4': 1, '5': 11, '6': '.fatalder.UserCenterConfig', '10': 'userCenterConfig'},
  ],
};

/// Descriptor for `FrameworkConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List frameworkConfigDescriptor = $convert.base64Decode('Cg9GcmFtZXdvcmtDb25maWcSGgoIbGFuZ3VhZ2UYASABKAlSCGxhbmd1YWdlEiEKDHN0b3JhZ2VfcGF0aBgCIAEoCVILc3RvcmFnZVBhdGgSPAoMYnVpbGRfY29uZmlnGAMgASgLMhkuZmF0YWxkZXIuQnVpbGRUYXNrQ29uZmlnUgtidWlsZENvbmZpZxImCg9naXRodWJfYmFzZV91cmwYBCABKAlSDWdpdGh1YkJhc2VVcmwSSAoSdXNlcl9jZW50ZXJfY29uZmlnGAUgASgLMhouZmF0YWxkZXIuVXNlckNlbnRlckNvbmZpZ1IQdXNlckNlbnRlckNvbmZpZw==');
@$core.Deprecated('Use buildTaskConfigDescriptor instead')
const BuildTaskConfig$json = const {
  '1': 'BuildTaskConfig',
  '2': const [
    const {'1': 'min_once_parse_chunk_num', '3': 1, '4': 1, '5': 5, '10': 'minOnceParseChunkNum'},
    const {'1': 'min_matching_degree', '3': 2, '4': 1, '5': 1, '10': 'minMatchingDegree'},
    const {'1': 'max_fix_depth', '3': 3, '4': 1, '5': 5, '10': 'maxFixDepth'},
  ],
};

/// Descriptor for `BuildTaskConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List buildTaskConfigDescriptor = $convert.base64Decode('Cg9CdWlsZFRhc2tDb25maWcSNgoYbWluX29uY2VfcGFyc2VfY2h1bmtfbnVtGAEgASgFUhRtaW5PbmNlUGFyc2VDaHVua051bRIuChNtaW5fbWF0Y2hpbmdfZGVncmVlGAIgASgBUhFtaW5NYXRjaGluZ0RlZ3JlZRIiCg1tYXhfZml4X2RlcHRoGAMgASgFUgttYXhGaXhEZXB0aA==');
@$core.Deprecated('Use userCenterConfigDescriptor instead')
const UserCenterConfig$json = const {
  '1': 'UserCenterConfig',
  '2': const [
    const {'1': 'base_root', '3': 1, '4': 1, '5': 9, '10': 'baseRoot'},
    const {'1': 'api_key', '3': 2, '4': 1, '5': 9, '10': 'apiKey'},
  ],
};

/// Descriptor for `UserCenterConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userCenterConfigDescriptor = $convert.base64Decode('ChBVc2VyQ2VudGVyQ29uZmlnEhsKCWJhc2Vfcm9vdBgBIAEoCVIIYmFzZVJvb3QSFwoHYXBpX2tleRgCIAEoCVIGYXBpS2V5');
@$core.Deprecated('Use validateAPIKeyRequestDescriptor instead')
const ValidateAPIKeyRequest$json = const {
  '1': 'ValidateAPIKeyRequest',
  '2': const [
    const {'1': 'api_key', '3': 1, '4': 1, '5': 9, '10': 'apiKey'},
  ],
};

/// Descriptor for `ValidateAPIKeyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List validateAPIKeyRequestDescriptor = $convert.base64Decode('ChVWYWxpZGF0ZUFQSUtleVJlcXVlc3QSFwoHYXBpX2tleRgBIAEoCVIGYXBpS2V5');
@$core.Deprecated('Use validateAPIKeyResponseDescriptor instead')
const ValidateAPIKeyResponse$json = const {
  '1': 'ValidateAPIKeyResponse',
  '2': const [
    const {'1': 'valid', '3': 1, '4': 1, '5': 8, '10': 'valid'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `ValidateAPIKeyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List validateAPIKeyResponseDescriptor = $convert.base64Decode('ChZWYWxpZGF0ZUFQSUtleVJlc3BvbnNlEhQKBXZhbGlkGAEgASgIUgV2YWxpZBIYCgdtZXNzYWdlGAIgASgJUgdtZXNzYWdl');
@$core.Deprecated('Use listFilesRequestDescriptor instead')
const ListFilesRequest$json = const {
  '1': 'ListFilesRequest',
  '2': const [
    const {'1': 'path', '3': 1, '4': 1, '5': 9, '10': 'path'},
  ],
};

/// Descriptor for `ListFilesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listFilesRequestDescriptor = $convert.base64Decode('ChBMaXN0RmlsZXNSZXF1ZXN0EhIKBHBhdGgYASABKAlSBHBhdGg=');
@$core.Deprecated('Use fileInfoDescriptor instead')
const FileInfo$json = const {
  '1': 'FileInfo',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'is_dir', '3': 2, '4': 1, '5': 8, '10': 'isDir'},
    const {'1': 'size', '3': 3, '4': 1, '5': 3, '10': 'size'},
  ],
};

/// Descriptor for `FileInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileInfoDescriptor = $convert.base64Decode('CghGaWxlSW5mbxISCgRuYW1lGAEgASgJUgRuYW1lEhUKBmlzX2RpchgCIAEoCFIFaXNEaXISEgoEc2l6ZRgDIAEoA1IEc2l6ZQ==');
@$core.Deprecated('Use fileListDescriptor instead')
const FileList$json = const {
  '1': 'FileList',
  '2': const [
    const {'1': 'files', '3': 1, '4': 3, '5': 11, '6': '.fatalder.FileInfo', '10': 'files'},
  ],
};

/// Descriptor for `FileList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileListDescriptor = $convert.base64Decode('CghGaWxlTGlzdBIoCgVmaWxlcxgBIAMoCzISLmZhdGFsZGVyLkZpbGVJbmZvUgVmaWxlcw==');
@$core.Deprecated('Use streamLogsRequestDescriptor instead')
const StreamLogsRequest$json = const {
  '1': 'StreamLogsRequest',
  '2': const [
    const {'1': 'filter', '3': 1, '4': 1, '5': 9, '10': 'filter'},
  ],
};

/// Descriptor for `StreamLogsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamLogsRequestDescriptor = $convert.base64Decode('ChFTdHJlYW1Mb2dzUmVxdWVzdBIWCgZmaWx0ZXIYASABKAlSBmZpbHRlcg==');
@$core.Deprecated('Use logMessageDescriptor instead')
const LogMessage$json = const {
  '1': 'LogMessage',
  '2': const [
    const {'1': 'timestamp', '3': 1, '4': 1, '5': 9, '10': 'timestamp'},
    const {'1': 'level', '3': 2, '4': 1, '5': 9, '10': 'level'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'source', '3': 4, '4': 1, '5': 9, '10': 'source'},
  ],
};

/// Descriptor for `LogMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logMessageDescriptor = $convert.base64Decode('CgpMb2dNZXNzYWdlEhwKCXRpbWVzdGFtcBgBIAEoCVIJdGltZXN0YW1wEhQKBWxldmVsGAIgASgJUgVsZXZlbBIYCgdtZXNzYWdlGAMgASgJUgdtZXNzYWdlEhYKBnNvdXJjZRgEIAEoCVIGc291cmNl');
