// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GcbParticipantModelImpl _$$GcbParticipantModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GcbParticipantModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      isHost: json['isHost'] as bool,
      isModerator: json['isModerator'] as bool,
      isMuted: json['isMuted'] as bool,
      isVideoOn: json['isVideoOn'] as bool,
      isScreenSharing: json['isScreenSharing'] as bool,
      isHandRaised: json['isHandRaised'] as bool,
      isSpeaking: json['isSpeaking'] as bool,
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$$GcbParticipantModelImplToJson(
        _$GcbParticipantModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isHost': instance.isHost,
      'isModerator': instance.isModerator,
      'isMuted': instance.isMuted,
      'isVideoOn': instance.isVideoOn,
      'isScreenSharing': instance.isScreenSharing,
      'isHandRaised': instance.isHandRaised,
      'isSpeaking': instance.isSpeaking,
      'avatarUrl': instance.avatarUrl,
    };
