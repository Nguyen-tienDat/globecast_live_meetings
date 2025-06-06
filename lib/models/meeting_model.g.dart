// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GcbMeetingModelImpl _$$GcbMeetingModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GcbMeetingModelImpl(
      id: json['id'] as String,
      code: json['code'] as String,
      topic: json['topic'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      durationMinutes: (json['durationMinutes'] as num).toInt(),
      hostId: json['hostId'] as String,
      hostName: json['hostName'] as String,
      participantIds: (json['participantIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      isRecording: json['isRecording'] as bool,
      primaryLanguage: json['primaryLanguage'] as String,
      translationLanguages: (json['translationLanguages'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$$GcbMeetingModelImplToJson(
        _$GcbMeetingModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'topic': instance.topic,
      'startTime': instance.startTime.toIso8601String(),
      'durationMinutes': instance.durationMinutes,
      'hostId': instance.hostId,
      'hostName': instance.hostName,
      'participantIds': instance.participantIds,
      'isRecording': instance.isRecording,
      'primaryLanguage': instance.primaryLanguage,
      'translationLanguages': instance.translationLanguages,
      'description': instance.description,
      'password': instance.password,
    };
