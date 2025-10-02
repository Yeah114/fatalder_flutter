//
//  Generated code. Do not modify.
//  source: fatalder.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode(
    'CgVFbXB0eQ==');

@$core.Deprecated('Use blockPosDescriptor instead')
const BlockPos$json = {
  '1': 'BlockPos',
  '2': [
    {'1': 'x', '3': 1, '4': 1, '5': 5, '10': 'x'},
    {'1': 'y', '3': 2, '4': 1, '5': 5, '10': 'y'},
    {'1': 'z', '3': 3, '4': 1, '5': 5, '10': 'z'},
  ],
};

/// Descriptor for `BlockPos`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List blockPosDescriptor = $convert.base64Decode(
    'CghCbG9ja1BvcxIMCgF4GAEgASgFUgF4EgwKAXkYAiABKAVSAXkSDAoBehgDIAEoBVIBeg==');

@$core.Deprecated('Use serverConfigDescriptor instead')
const ServerConfig$json = {
  '1': 'ServerConfig',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'rental_server_code', '3': 2, '4': 1, '5': 9, '10': 'rentalServerCode'},
    {'1': 'rental_server_passcode', '3': 3, '4': 1, '5': 9, '10': 'rentalServerPasscode'},
  ],
};

/// Descriptor for `ServerConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serverConfigDescriptor = $convert.base64Decode(
    'CgxTZXJ2ZXJDb25maWcSEgoEbmFtZRgBIAEoCVIEbmFtZRIsChJyZW50YWxfc2VydmVyX2NvZG'
    'UYAiABKAlSEHJlbnRhbFNlcnZlckNvZGUSNAoWcmVudGFsX3NlcnZlcl9wYXNzY29kZRgDIAEo'
    'CVIUcmVudGFsU2VydmVyUGFzc2NvZGU=');

@$core.Deprecated('Use serverConfigListDescriptor instead')
const ServerConfigList$json = {
  '1': 'ServerConfigList',
  '2': [
    {'1': 'configs', '3': 1, '4': 3, '5': 11, '6': '.fatalder.ServerConfig', '10': 'configs'},
  ],
};

/// Descriptor for `ServerConfigList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serverConfigListDescriptor = $convert.base64Decode(
    'ChBTZXJ2ZXJDb25maWdMaXN0EjAKB2NvbmZpZ3MYASADKAsyFi5mYXRhbGRlci5TZXJ2ZXJDb2'
    '5maWdSB2NvbmZpZ3M=');

@$core.Deprecated('Use getServerConfigRequestDescriptor instead')
const GetServerConfigRequest$json = {
  '1': 'GetServerConfigRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `GetServerConfigRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getServerConfigRequestDescriptor = $convert.base64Decode(
    'ChZHZXRTZXJ2ZXJDb25maWdSZXF1ZXN0EhIKBG5hbWUYASABKAlSBG5hbWU=');

@$core.Deprecated('Use deleteServerConfigRequestDescriptor instead')
const DeleteServerConfigRequest$json = {
  '1': 'DeleteServerConfigRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `DeleteServerConfigRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteServerConfigRequestDescriptor = $convert.base64Decode(
    'ChlEZWxldGVTZXJ2ZXJDb25maWdSZXF1ZXN0EhIKBG5hbWUYASABKAlSBG5hbWU=');

@$core.Deprecated('Use buildTaskDescriptor instead')
const BuildTask$json = {
  '1': 'BuildTask',
  '2': [
    {'1': 'task_type', '3': 1, '4': 1, '5': 9, '10': 'taskType'},
    {'1': 'file_path', '3': 2, '4': 1, '5': 9, '10': 'filePath'},
    {'1': 'start_pos', '3': 3, '4': 1, '5': 11, '6': '.fatalder.BlockPos', '10': 'startPos'},
    {'1': 'speed', '3': 4, '4': 1, '5': 5, '10': 'speed'},
    {'1': 'auto_clean_block', '3': 5, '4': 1, '5': 8, '10': 'autoCleanBlock'},
    {'1': 'auto_clean_item', '3': 6, '4': 1, '5': 8, '10': 'autoCleanItem'},
    {'1': 'verify_after_chunk', '3': 7, '4': 1, '5': 5, '10': 'verifyAfterChunk'},
    {'1': 'verify_chunk_level', '3': 8, '4': 1, '5': 5, '10': 'verifyChunkLevel'},
    {'1': 'progress', '3': 9, '4': 1, '5': 5, '10': 'progress'},
    {'1': 'auto_disable_command', '3': 10, '4': 1, '5': 8, '10': 'autoDisableCommand'},
    {'1': 'auto_upgrade_command', '3': 11, '4': 1, '5': 8, '10': 'autoUpgradeCommand'},
    {'1': 'ignore_command_block', '3': 12, '4': 1, '5': 8, '10': 'ignoreCommandBlock'},
    {'1': 'ignore_other_nbt_block', '3': 13, '4': 1, '5': 8, '10': 'ignoreOtherNbtBlock'},
    {'1': 'console_world_pos', '3': 14, '4': 1, '5': 11, '6': '.fatalder.BlockPos', '10': 'consoleWorldPos'},
    {'1': 'show_nbt_progress', '3': 15, '4': 1, '5': 8, '10': 'showNbtProgress'},
  ],
};

/// Descriptor for `BuildTask`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List buildTaskDescriptor = $convert.base64Decode(
    'CglCdWlsZFRhc2sSGwoJdGFza190eXBlGAEgASgJUgh0YXNrVHlwZRIbCglmaWxlX3BhdGgYAi'
    'ABKAlSCGZpbGVQYXRoEi8KCXN0YXJ0X3BvcxgDIAEoCzISLmZhdGFsZGVyLkJsb2NrUG9zUghz'
    'dGFydFBvcxIUCgVzcGVlZBgEIAEoBVIFc3BlZWQSKAoQYXV0b19jbGVhbl9ibG9jaxgFIAEoCF'
    'IOYXV0b0NsZWFuQmxvY2sSJgoPYXV0b19jbGVhbl9pdGVtGAYgASgIUg1hdXRvQ2xlYW5JdGVt'
    'EiwKEnZlcmlmeV9hZnRlcl9jaHVuaxgHIAEoBVIQdmVyaWZ5QWZ0ZXJDaHVuaxIsChJ2ZXJpZn'
    'lfY2h1bmtfbGV2ZWwYCCABKAVSEHZlcmlmeUNodW5rTGV2ZWwSGgoIcHJvZ3Jlc3MYCSABKAVS'
    'CHByb2dyZXNzEjAKFGF1dG9fZGlzYWJsZV9jb21tYW5kGAogASgIUhJhdXRvRGlzYWJsZUNvbW'
    '1hbmQSMAoUYXV0b191cGdyYWRlX2NvbW1hbmQYCyABKAhSEmF1dG9VcGdyYWRlQ29tbWFuZBIw'
    'ChRpZ25vcmVfY29tbWFuZF9ibG9jaxgMIAEoCFISaWdub3JlQ29tbWFuZEJsb2NrEjMKFmlnbm'
    '9yZV9vdGhlcl9uYnRfYmxvY2sYDSABKAhSE2lnbm9yZU90aGVyTmJ0QmxvY2sSPgoRY29uc29s'
    'ZV93b3JsZF9wb3MYDiABKAsyEi5mYXRhbGRlci5CbG9ja1Bvc1IPY29uc29sZVdvcmxkUG9zEi'
    'oKEXNob3dfbmJ0X3Byb2dyZXNzGA8gASgIUg9zaG93TmJ0UHJvZ3Jlc3M=');

@$core.Deprecated('Use exportTaskDescriptor instead')
const ExportTask$json = {
  '1': 'ExportTask',
  '2': [
    {'1': 'task_type', '3': 1, '4': 1, '5': 9, '10': 'taskType'},
    {'1': 'file_path', '3': 2, '4': 1, '5': 9, '10': 'filePath'},
    {'1': 'file_type', '3': 3, '4': 1, '5': 9, '10': 'fileType'},
    {'1': 'start_pos', '3': 4, '4': 1, '5': 11, '6': '.fatalder.BlockPos', '10': 'startPos'},
    {'1': 'end_pos', '3': 5, '4': 1, '5': 11, '6': '.fatalder.BlockPos', '10': 'endPos'},
  ],
};

/// Descriptor for `ExportTask`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exportTaskDescriptor = $convert.base64Decode(
    'CgpFeHBvcnRUYXNrEhsKCXRhc2tfdHlwZRgBIAEoCVIIdGFza1R5cGUSGwoJZmlsZV9wYXRoGA'
    'IgASgJUghmaWxlUGF0aBIbCglmaWxlX3R5cGUYAyABKAlSCGZpbGVUeXBlEi8KCXN0YXJ0X3Bv'
    'cxgEIAEoCzISLmZhdGFsZGVyLkJsb2NrUG9zUghzdGFydFBvcxIrCgdlbmRfcG9zGAUgASgLMh'
    'IuZmF0YWxkZXIuQmxvY2tQb3NSBmVuZFBvcw==');

@$core.Deprecated('Use taskDescriptor instead')
const Task$json = {
  '1': 'Task',
  '2': [
    {'1': 'build_task', '3': 1, '4': 1, '5': 11, '6': '.fatalder.BuildTask', '9': 0, '10': 'buildTask'},
    {'1': 'export_task', '3': 2, '4': 1, '5': 11, '6': '.fatalder.ExportTask', '9': 0, '10': 'exportTask'},
  ],
  '8': [
    {'1': 'task'},
  ],
};

/// Descriptor for `Task`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskDescriptor = $convert.base64Decode(
    'CgRUYXNrEjQKCmJ1aWxkX3Rhc2sYASABKAsyEy5mYXRhbGRlci5CdWlsZFRhc2tIAFIJYnVpbG'
    'RUYXNrEjcKC2V4cG9ydF90YXNrGAIgASgLMhQuZmF0YWxkZXIuRXhwb3J0VGFza0gAUgpleHBv'
    'cnRUYXNrQgYKBHRhc2s=');

@$core.Deprecated('Use taskGroupDescriptor instead')
const TaskGroup$json = {
  '1': 'TaskGroup',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'tasks', '3': 2, '4': 3, '5': 11, '6': '.fatalder.Task', '10': 'tasks'},
  ],
};

/// Descriptor for `TaskGroup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskGroupDescriptor = $convert.base64Decode(
    'CglUYXNrR3JvdXASEgoEbmFtZRgBIAEoCVIEbmFtZRIkCgV0YXNrcxgCIAMoCzIOLmZhdGFsZG'
    'VyLlRhc2tSBXRhc2tz');

@$core.Deprecated('Use taskGroupListDescriptor instead')
const TaskGroupList$json = {
  '1': 'TaskGroupList',
  '2': [
    {'1': 'names', '3': 1, '4': 3, '5': 9, '10': 'names'},
  ],
};

/// Descriptor for `TaskGroupList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskGroupListDescriptor = $convert.base64Decode(
    'Cg1UYXNrR3JvdXBMaXN0EhQKBW5hbWVzGAEgAygJUgVuYW1lcw==');

@$core.Deprecated('Use getTaskGroupRequestDescriptor instead')
const GetTaskGroupRequest$json = {
  '1': 'GetTaskGroupRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `GetTaskGroupRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTaskGroupRequestDescriptor = $convert.base64Decode(
    'ChNHZXRUYXNrR3JvdXBSZXF1ZXN0EhIKBG5hbWUYASABKAlSBG5hbWU=');

@$core.Deprecated('Use createTaskGroupRequestDescriptor instead')
const CreateTaskGroupRequest$json = {
  '1': 'CreateTaskGroupRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'tasks', '3': 2, '4': 3, '5': 11, '6': '.fatalder.Task', '10': 'tasks'},
  ],
};

/// Descriptor for `CreateTaskGroupRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createTaskGroupRequestDescriptor = $convert.base64Decode(
    'ChZDcmVhdGVUYXNrR3JvdXBSZXF1ZXN0EhIKBG5hbWUYASABKAlSBG5hbWUSJAoFdGFza3MYAi'
    'ADKAsyDi5mYXRhbGRlci5UYXNrUgV0YXNrcw==');

@$core.Deprecated('Use deleteTaskGroupRequestDescriptor instead')
const DeleteTaskGroupRequest$json = {
  '1': 'DeleteTaskGroupRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `DeleteTaskGroupRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteTaskGroupRequestDescriptor = $convert.base64Decode(
    'ChZEZWxldGVUYXNrR3JvdXBSZXF1ZXN0EhIKBG5hbWUYASABKAlSBG5hbWU=');

@$core.Deprecated('Use executeTaskGroupRequestDescriptor instead')
const ExecuteTaskGroupRequest$json = {
  '1': 'ExecuteTaskGroupRequest',
  '2': [
    {'1': 'task_group_name', '3': 1, '4': 1, '5': 9, '10': 'taskGroupName'},
    {'1': 'server_config_name', '3': 2, '4': 1, '5': 9, '10': 'serverConfigName'},
  ],
};

/// Descriptor for `ExecuteTaskGroupRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List executeTaskGroupRequestDescriptor = $convert.base64Decode(
    'ChdFeGVjdXRlVGFza0dyb3VwUmVxdWVzdBImCg90YXNrX2dyb3VwX25hbWUYASABKAlSDXRhc2'
    'tHcm91cE5hbWUSLAoSc2VydmVyX2NvbmZpZ19uYW1lGAIgASgJUhBzZXJ2ZXJDb25maWdOYW1l');

@$core.Deprecated('Use taskProgressDescriptor instead')
const TaskProgress$json = {
  '1': 'TaskProgress',
  '2': [
    {'1': 'task_index', '3': 1, '4': 1, '5': 5, '10': 'taskIndex'},
    {'1': 'total_tasks', '3': 2, '4': 1, '5': 5, '10': 'totalTasks'},
    {'1': 'task_type', '3': 3, '4': 1, '5': 9, '10': 'taskType'},
    {'1': 'message', '3': 4, '4': 1, '5': 9, '10': 'message'},
    {'1': 'current_chunk', '3': 5, '4': 1, '5': 5, '10': 'currentChunk'},
    {'1': 'total_chunks', '3': 6, '4': 1, '5': 5, '10': 'totalChunks'},
    {'1': 'progress_percent', '3': 7, '4': 1, '5': 1, '10': 'progressPercent'},
    {'1': 'status', '3': 8, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `TaskProgress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskProgressDescriptor = $convert.base64Decode(
    'CgxUYXNrUHJvZ3Jlc3MSHQoKdGFza19pbmRleBgBIAEoBVIJdGFza0luZGV4Eh8KC3RvdGFsX3'
    'Rhc2tzGAIgASgFUgp0b3RhbFRhc2tzEhsKCXRhc2tfdHlwZRgDIAEoCVIIdGFza1R5cGUSGAoH'
    'bWVzc2FnZRgEIAEoCVIHbWVzc2FnZRIjCg1jdXJyZW50X2NodW5rGAUgASgFUgxjdXJyZW50Q2'
    'h1bmsSIQoMdG90YWxfY2h1bmtzGAYgASgFUgt0b3RhbENodW5rcxIpChBwcm9ncmVzc19wZXJj'
    'ZW50GAcgASgBUg9wcm9ncmVzc1BlcmNlbnQSFgoGc3RhdHVzGAggASgJUgZzdGF0dXM=');

@$core.Deprecated('Use buildProgressDescriptor instead')
const BuildProgress$json = {
  '1': 'BuildProgress',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'current_chunk', '3': 3, '4': 1, '5': 5, '10': 'currentChunk'},
    {'1': 'total_chunks', '3': 4, '4': 1, '5': 5, '10': 'totalChunks'},
    {'1': 'progress_percent', '3': 5, '4': 1, '5': 1, '10': 'progressPercent'},
    {'1': 'structure_type', '3': 6, '4': 1, '5': 9, '10': 'structureType'},
    {'1': 'width', '3': 7, '4': 1, '5': 5, '10': 'width'},
    {'1': 'height', '3': 8, '4': 1, '5': 5, '10': 'height'},
    {'1': 'length', '3': 9, '4': 1, '5': 5, '10': 'length'},
    {'1': 'block_count', '3': 10, '4': 1, '5': 5, '10': 'blockCount'},
    {'1': 'command_block_count', '3': 11, '4': 1, '5': 5, '10': 'commandBlockCount'},
    {'1': 'nbt_count', '3': 12, '4': 1, '5': 5, '10': 'nbtCount'},
    {'1': 'cost_deducted', '3': 13, '4': 1, '5': 5, '10': 'costDeducted'},
    {'1': 'balance', '3': 14, '4': 1, '5': 9, '10': 'balance'},
  ],
};

/// Descriptor for `BuildProgress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List buildProgressDescriptor = $convert.base64Decode(
    'Cg1CdWlsZFByb2dyZXNzEhYKBnN0YXR1cxgBIAEoCVIGc3RhdHVzEhgKB21lc3NhZ2UYAiABKA'
    'lSB21lc3NhZ2USIwoNY3VycmVudF9jaHVuaxgDIAEoBVIMY3VycmVudENodW5rEiEKDHRvdGFs'
    'X2NodW5rcxgEIAEoBVILdG90YWxDaHVua3MSKQoQcHJvZ3Jlc3NfcGVyY2VudBgFIAEoAVIPcH'
    'JvZ3Jlc3NQZXJjZW50EiUKDnN0cnVjdHVyZV90eXBlGAYgASgJUg1zdHJ1Y3R1cmVUeXBlEhQK'
    'BXdpZHRoGAcgASgFUgV3aWR0aBIWCgZoZWlnaHQYCCABKAVSBmhlaWdodBIWCgZsZW5ndGgYCS'
    'ABKAVSBmxlbmd0aBIfCgtibG9ja19jb3VudBgKIAEoBVIKYmxvY2tDb3VudBIuChNjb21tYW5k'
    'X2Jsb2NrX2NvdW50GAsgASgFUhFjb21tYW5kQmxvY2tDb3VudBIbCgluYnRfY291bnQYDCABKA'
    'VSCG5idENvdW50EiMKDWNvc3RfZGVkdWN0ZWQYDSABKAVSDGNvc3REZWR1Y3RlZBIYCgdiYWxh'
    'bmNlGA4gASgJUgdiYWxhbmNl');

@$core.Deprecated('Use exportProgressDescriptor instead')
const ExportProgress$json = {
  '1': 'ExportProgress',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'current_chunk', '3': 3, '4': 1, '5': 5, '10': 'currentChunk'},
    {'1': 'total_chunks', '3': 4, '4': 1, '5': 5, '10': 'totalChunks'},
    {'1': 'progress_percent', '3': 5, '4': 1, '5': 1, '10': 'progressPercent'},
    {'1': 'output_path', '3': 6, '4': 1, '5': 9, '10': 'outputPath'},
  ],
};

/// Descriptor for `ExportProgress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exportProgressDescriptor = $convert.base64Decode(
    'Cg5FeHBvcnRQcm9ncmVzcxIWCgZzdGF0dXMYASABKAlSBnN0YXR1cxIYCgdtZXNzYWdlGAIgAS'
    'gJUgdtZXNzYWdlEiMKDWN1cnJlbnRfY2h1bmsYAyABKAVSDGN1cnJlbnRDaHVuaxIhCgx0b3Rh'
    'bF9jaHVua3MYBCABKAVSC3RvdGFsQ2h1bmtzEikKEHByb2dyZXNzX3BlcmNlbnQYBSABKAFSD3'
    'Byb2dyZXNzUGVyY2VudBIfCgtvdXRwdXRfcGF0aBgGIAEoCVIKb3V0cHV0UGF0aA==');

@$core.Deprecated('Use buildControlRequestDescriptor instead')
const BuildControlRequest$json = {
  '1': 'BuildControlRequest',
  '2': [
    {'1': 'action', '3': 1, '4': 1, '5': 9, '10': 'action'},
  ],
};

/// Descriptor for `BuildControlRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List buildControlRequestDescriptor = $convert.base64Decode(
    'ChNCdWlsZENvbnRyb2xSZXF1ZXN0EhYKBmFjdGlvbhgBIAEoCVIGYWN0aW9u');

@$core.Deprecated('Use startBuildRequestDescriptor instead')
const StartBuildRequest$json = {
  '1': 'StartBuildRequest',
  '2': [
    {'1': 'server_config_name', '3': 1, '4': 1, '5': 9, '10': 'serverConfigName'},
    {'1': 'task', '3': 2, '4': 1, '5': 11, '6': '.fatalder.BuildTask', '10': 'task'},
    {'1': 'resume_from_interrupt', '3': 3, '4': 1, '5': 8, '10': 'resumeFromInterrupt'},
  ],
};

/// Descriptor for `StartBuildRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startBuildRequestDescriptor = $convert.base64Decode(
    'ChFTdGFydEJ1aWxkUmVxdWVzdBIsChJzZXJ2ZXJfY29uZmlnX25hbWUYASABKAlSEHNlcnZlck'
    'NvbmZpZ05hbWUSJwoEdGFzaxgCIAEoCzITLmZhdGFsZGVyLkJ1aWxkVGFza1IEdGFzaxIyChVy'
    'ZXN1bWVfZnJvbV9pbnRlcnJ1cHQYAyABKAhSE3Jlc3VtZUZyb21JbnRlcnJ1cHQ=');

@$core.Deprecated('Use startExportRequestDescriptor instead')
const StartExportRequest$json = {
  '1': 'StartExportRequest',
  '2': [
    {'1': 'server_config_name', '3': 1, '4': 1, '5': 9, '10': 'serverConfigName'},
    {'1': 'task', '3': 2, '4': 1, '5': 11, '6': '.fatalder.ExportTask', '10': 'task'},
  ],
};

/// Descriptor for `StartExportRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startExportRequestDescriptor = $convert.base64Decode(
    'ChJTdGFydEV4cG9ydFJlcXVlc3QSLAoSc2VydmVyX2NvbmZpZ19uYW1lGAEgASgJUhBzZXJ2ZX'
    'JDb25maWdOYW1lEigKBHRhc2sYAiABKAsyFC5mYXRhbGRlci5FeHBvcnRUYXNrUgR0YXNr');

@$core.Deprecated('Use frameworkConfigDescriptor instead')
const FrameworkConfig$json = {
  '1': 'FrameworkConfig',
  '2': [
    {'1': 'language', '3': 1, '4': 1, '5': 9, '10': 'language'},
    {'1': 'storage_path', '3': 2, '4': 1, '5': 9, '10': 'storagePath'},
    {'1': 'build_config', '3': 3, '4': 1, '5': 11, '6': '.fatalder.BuildTaskConfig', '10': 'buildConfig'},
    {'1': 'github_base_url', '3': 4, '4': 1, '5': 9, '10': 'githubBaseUrl'},
    {'1': 'user_center_config', '3': 5, '4': 1, '5': 11, '6': '.fatalder.UserCenterConfig', '10': 'userCenterConfig'},
  ],
};

/// Descriptor for `FrameworkConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List frameworkConfigDescriptor = $convert.base64Decode(
    'Cg9GcmFtZXdvcmtDb25maWcSGgoIbGFuZ3VhZ2UYASABKAlSCGxhbmd1YWdlEiEKDHN0b3JhZ2'
    'VfcGF0aBgCIAEoCVILc3RvcmFnZVBhdGgSPAoMYnVpbGRfY29uZmlnGAMgASgLMhkuZmF0YWxk'
    'ZXIuQnVpbGRUYXNrQ29uZmlnUgtidWlsZENvbmZpZxImCg9naXRodWJfYmFzZV91cmwYBCABKA'
    'lSDWdpdGh1YkJhc2VVcmwSSAoSdXNlcl9jZW50ZXJfY29uZmlnGAUgASgLMhouZmF0YWxkZXIu'
    'VXNlckNlbnRlckNvbmZpZ1IQdXNlckNlbnRlckNvbmZpZw==');

@$core.Deprecated('Use buildTaskConfigDescriptor instead')
const BuildTaskConfig$json = {
  '1': 'BuildTaskConfig',
  '2': [
    {'1': 'min_once_parse_chunk_num', '3': 1, '4': 1, '5': 5, '10': 'minOnceParseChunkNum'},
    {'1': 'min_matching_degree', '3': 2, '4': 1, '5': 1, '10': 'minMatchingDegree'},
    {'1': 'max_fix_depth', '3': 3, '4': 1, '5': 5, '10': 'maxFixDepth'},
  ],
};

/// Descriptor for `BuildTaskConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List buildTaskConfigDescriptor = $convert.base64Decode(
    'Cg9CdWlsZFRhc2tDb25maWcSNgoYbWluX29uY2VfcGFyc2VfY2h1bmtfbnVtGAEgASgFUhRtaW'
    '5PbmNlUGFyc2VDaHVua051bRIuChNtaW5fbWF0Y2hpbmdfZGVncmVlGAIgASgBUhFtaW5NYXRj'
    'aGluZ0RlZ3JlZRIiCg1tYXhfZml4X2RlcHRoGAMgASgFUgttYXhGaXhEZXB0aA==');

@$core.Deprecated('Use userCenterConfigDescriptor instead')
const UserCenterConfig$json = {
  '1': 'UserCenterConfig',
  '2': [
    {'1': 'base_root', '3': 1, '4': 1, '5': 9, '10': 'baseRoot'},
    {'1': 'api_key', '3': 2, '4': 1, '5': 9, '10': 'apiKey'},
  ],
};

/// Descriptor for `UserCenterConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userCenterConfigDescriptor = $convert.base64Decode(
    'ChBVc2VyQ2VudGVyQ29uZmlnEhsKCWJhc2Vfcm9vdBgBIAEoCVIIYmFzZVJvb3QSFwoHYXBpX2'
    'tleRgCIAEoCVIGYXBpS2V5');

@$core.Deprecated('Use validateAPIKeyRequestDescriptor instead')
const ValidateAPIKeyRequest$json = {
  '1': 'ValidateAPIKeyRequest',
  '2': [
    {'1': 'api_key', '3': 1, '4': 1, '5': 9, '10': 'apiKey'},
  ],
};

/// Descriptor for `ValidateAPIKeyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List validateAPIKeyRequestDescriptor = $convert.base64Decode(
    'ChVWYWxpZGF0ZUFQSUtleVJlcXVlc3QSFwoHYXBpX2tleRgBIAEoCVIGYXBpS2V5');

@$core.Deprecated('Use validateAPIKeyResponseDescriptor instead')
const ValidateAPIKeyResponse$json = {
  '1': 'ValidateAPIKeyResponse',
  '2': [
    {'1': 'valid', '3': 1, '4': 1, '5': 8, '10': 'valid'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `ValidateAPIKeyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List validateAPIKeyResponseDescriptor = $convert.base64Decode(
    'ChZWYWxpZGF0ZUFQSUtleVJlc3BvbnNlEhQKBXZhbGlkGAEgASgIUgV2YWxpZBIYCgdtZXNzYW'
    'dlGAIgASgJUgdtZXNzYWdl');

@$core.Deprecated('Use listFilesRequestDescriptor instead')
const ListFilesRequest$json = {
  '1': 'ListFilesRequest',
  '2': [
    {'1': 'path', '3': 1, '4': 1, '5': 9, '10': 'path'},
  ],
};

/// Descriptor for `ListFilesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listFilesRequestDescriptor = $convert.base64Decode(
    'ChBMaXN0RmlsZXNSZXF1ZXN0EhIKBHBhdGgYASABKAlSBHBhdGg=');

@$core.Deprecated('Use fileInfoDescriptor instead')
const FileInfo$json = {
  '1': 'FileInfo',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'is_dir', '3': 2, '4': 1, '5': 8, '10': 'isDir'},
    {'1': 'size', '3': 3, '4': 1, '5': 3, '10': 'size'},
  ],
};

/// Descriptor for `FileInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileInfoDescriptor = $convert.base64Decode(
    'CghGaWxlSW5mbxISCgRuYW1lGAEgASgJUgRuYW1lEhUKBmlzX2RpchgCIAEoCFIFaXNEaXISEg'
    'oEc2l6ZRgDIAEoA1IEc2l6ZQ==');

@$core.Deprecated('Use fileListDescriptor instead')
const FileList$json = {
  '1': 'FileList',
  '2': [
    {'1': 'files', '3': 1, '4': 3, '5': 11, '6': '.fatalder.FileInfo', '10': 'files'},
  ],
};

/// Descriptor for `FileList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileListDescriptor = $convert.base64Decode(
    'CghGaWxlTGlzdBIoCgVmaWxlcxgBIAMoCzISLmZhdGFsZGVyLkZpbGVJbmZvUgVmaWxlcw==');

