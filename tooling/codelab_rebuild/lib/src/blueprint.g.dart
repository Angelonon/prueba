// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blueprint.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Blueprint _$BlueprintFromJson(Map json) => $checkedCreate(
      'Blueprint',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['name', 'steps'],
          requiredKeys: const ['name', 'steps'],
        );
        final val = Blueprint(
          name: $checkedConvert('name', (v) => v as String),
          steps: $checkedConvert(
              'steps',
              (v) => (v as List<dynamic>)
                  .map((e) => BlueprintStep.fromJson(e as Map))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$BlueprintToJson(Blueprint instance) => <String, dynamic>{
      'name': instance.name,
      'steps': instance.steps,
    };

BlueprintStep _$BlueprintStepFromJson(Map json) => $checkedCreate(
      'BlueprintStep',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'name',
            'steps',
            'command',
            'commands',
            'path',
            'base64-contents',
            'patch',
            'patch-u',
            'patch-c',
            'replace-contents',
            'rm',
            'pod',
            'mkdir',
            'mkdirs',
            'rmdir',
            'rmdirs',
            'copydir'
          ],
          requiredKeys: const ['name'],
        );
        final val = BlueprintStep(
          name: $checkedConvert('name', (v) => v as String),
          steps: $checkedConvert(
              'steps',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => BlueprintStep.fromJson(e as Map))
                      .toList() ??
                  const []),
          base64Contents:
              $checkedConvert('base64-contents', (v) => v as String?),
          command: $checkedConvert('command', (v) => v as String?),
          commands: $checkedConvert(
              'commands',
              (v) =>
                  (v as List<dynamic>?)?.map((e) => e as String).toList() ??
                  const []),
          patch: $checkedConvert('patch', (v) => v as String?),
          patchU: $checkedConvert('patch-u', (v) => v as String?),
          patchC: $checkedConvert('patch-c', (v) => v as String?),
          path: $checkedConvert('path', (v) => v as String?),
          replaceContents:
              $checkedConvert('replace-contents', (v) => v as String?),
          mkdir: $checkedConvert('mkdir', (v) => v as String?),
          mkdirs: $checkedConvert(
              'mkdirs',
              (v) =>
                  (v as List<dynamic>?)?.map((e) => e as String).toList() ??
                  const []),
          rmdir: $checkedConvert('rmdir', (v) => v as String?),
          rmdirs: $checkedConvert(
              'rmdirs',
              (v) =>
                  (v as List<dynamic>?)?.map((e) => e as String).toList() ??
                  const []),
          copydir: $checkedConvert(
              'copydir', (v) => v == null ? null : CopyDirs.fromJson(v as Map)),
          rm: $checkedConvert('rm', (v) => v as String?),
          pod: $checkedConvert('pod', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'base64Contents': 'base64-contents',
        'patchU': 'patch-u',
        'patchC': 'patch-c',
        'replaceContents': 'replace-contents'
      },
    );

Map<String, dynamic> _$BlueprintStepToJson(BlueprintStep instance) =>
    <String, dynamic>{
      'name': instance.name,
      'steps': instance.steps,
      'command': instance.command,
      'commands': instance.commands,
      'path': instance.path,
      'base64-contents': instance.base64Contents,
      'patch': instance.patch,
      'patch-u': instance.patchU,
      'patch-c': instance.patchC,
      'replace-contents': instance.replaceContents,
      'rm': instance.rm,
      'pod': instance.pod,
      'mkdir': instance.mkdir,
      'mkdirs': instance.mkdirs,
      'rmdir': instance.rmdir,
      'rmdirs': instance.rmdirs,
      'copydir': instance.copydir,
    };

CopyDirs _$CopyDirsFromJson(Map json) => $checkedCreate(
      'CopyDirs',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['from', 'to'],
        );
        final val = CopyDirs(
          from: $checkedConvert('from', (v) => v as String),
          to: $checkedConvert('to', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$CopyDirsToJson(CopyDirs instance) => <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
    };
