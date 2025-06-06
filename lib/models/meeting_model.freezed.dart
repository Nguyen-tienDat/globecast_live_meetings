// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meeting_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GcbMeetingModel _$GcbMeetingModelFromJson(Map<String, dynamic> json) {
  return _GcbMeetingModel.fromJson(json);
}

/// @nodoc
mixin _$GcbMeetingModel {
  String get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get topic => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  int get durationMinutes => throw _privateConstructorUsedError;
  String get hostId => throw _privateConstructorUsedError;
  String get hostName => throw _privateConstructorUsedError;
  List<String> get participantIds => throw _privateConstructorUsedError;
  bool get isRecording => throw _privateConstructorUsedError;
  String get primaryLanguage => throw _privateConstructorUsedError;
  List<String> get translationLanguages => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GcbMeetingModelCopyWith<GcbMeetingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GcbMeetingModelCopyWith<$Res> {
  factory $GcbMeetingModelCopyWith(
          GcbMeetingModel value, $Res Function(GcbMeetingModel) then) =
      _$GcbMeetingModelCopyWithImpl<$Res, GcbMeetingModel>;
  @useResult
  $Res call(
      {String id,
      String code,
      String topic,
      DateTime startTime,
      int durationMinutes,
      String hostId,
      String hostName,
      List<String> participantIds,
      bool isRecording,
      String primaryLanguage,
      List<String> translationLanguages,
      String? description,
      String? password});
}

/// @nodoc
class _$GcbMeetingModelCopyWithImpl<$Res, $Val extends GcbMeetingModel>
    implements $GcbMeetingModelCopyWith<$Res> {
  _$GcbMeetingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? topic = null,
    Object? startTime = null,
    Object? durationMinutes = null,
    Object? hostId = null,
    Object? hostName = null,
    Object? participantIds = null,
    Object? isRecording = null,
    Object? primaryLanguage = null,
    Object? translationLanguages = null,
    Object? description = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      hostId: null == hostId
          ? _value.hostId
          : hostId // ignore: cast_nullable_to_non_nullable
              as String,
      hostName: null == hostName
          ? _value.hostName
          : hostName // ignore: cast_nullable_to_non_nullable
              as String,
      participantIds: null == participantIds
          ? _value.participantIds
          : participantIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isRecording: null == isRecording
          ? _value.isRecording
          : isRecording // ignore: cast_nullable_to_non_nullable
              as bool,
      primaryLanguage: null == primaryLanguage
          ? _value.primaryLanguage
          : primaryLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      translationLanguages: null == translationLanguages
          ? _value.translationLanguages
          : translationLanguages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GcbMeetingModelImplCopyWith<$Res>
    implements $GcbMeetingModelCopyWith<$Res> {
  factory _$$GcbMeetingModelImplCopyWith(_$GcbMeetingModelImpl value,
          $Res Function(_$GcbMeetingModelImpl) then) =
      __$$GcbMeetingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String code,
      String topic,
      DateTime startTime,
      int durationMinutes,
      String hostId,
      String hostName,
      List<String> participantIds,
      bool isRecording,
      String primaryLanguage,
      List<String> translationLanguages,
      String? description,
      String? password});
}

/// @nodoc
class __$$GcbMeetingModelImplCopyWithImpl<$Res>
    extends _$GcbMeetingModelCopyWithImpl<$Res, _$GcbMeetingModelImpl>
    implements _$$GcbMeetingModelImplCopyWith<$Res> {
  __$$GcbMeetingModelImplCopyWithImpl(
      _$GcbMeetingModelImpl _value, $Res Function(_$GcbMeetingModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? topic = null,
    Object? startTime = null,
    Object? durationMinutes = null,
    Object? hostId = null,
    Object? hostName = null,
    Object? participantIds = null,
    Object? isRecording = null,
    Object? primaryLanguage = null,
    Object? translationLanguages = null,
    Object? description = freezed,
    Object? password = freezed,
  }) {
    return _then(_$GcbMeetingModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      durationMinutes: null == durationMinutes
          ? _value.durationMinutes
          : durationMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      hostId: null == hostId
          ? _value.hostId
          : hostId // ignore: cast_nullable_to_non_nullable
              as String,
      hostName: null == hostName
          ? _value.hostName
          : hostName // ignore: cast_nullable_to_non_nullable
              as String,
      participantIds: null == participantIds
          ? _value._participantIds
          : participantIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isRecording: null == isRecording
          ? _value.isRecording
          : isRecording // ignore: cast_nullable_to_non_nullable
              as bool,
      primaryLanguage: null == primaryLanguage
          ? _value.primaryLanguage
          : primaryLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      translationLanguages: null == translationLanguages
          ? _value._translationLanguages
          : translationLanguages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GcbMeetingModelImpl
    with DiagnosticableTreeMixin
    implements _GcbMeetingModel {
  const _$GcbMeetingModelImpl(
      {required this.id,
      required this.code,
      required this.topic,
      required this.startTime,
      required this.durationMinutes,
      required this.hostId,
      required this.hostName,
      required final List<String> participantIds,
      required this.isRecording,
      required this.primaryLanguage,
      required final List<String> translationLanguages,
      this.description,
      this.password})
      : _participantIds = participantIds,
        _translationLanguages = translationLanguages;

  factory _$GcbMeetingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GcbMeetingModelImplFromJson(json);

  @override
  final String id;
  @override
  final String code;
  @override
  final String topic;
  @override
  final DateTime startTime;
  @override
  final int durationMinutes;
  @override
  final String hostId;
  @override
  final String hostName;
  final List<String> _participantIds;
  @override
  List<String> get participantIds {
    if (_participantIds is EqualUnmodifiableListView) return _participantIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participantIds);
  }

  @override
  final bool isRecording;
  @override
  final String primaryLanguage;
  final List<String> _translationLanguages;
  @override
  List<String> get translationLanguages {
    if (_translationLanguages is EqualUnmodifiableListView)
      return _translationLanguages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_translationLanguages);
  }

  @override
  final String? description;
  @override
  final String? password;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GcbMeetingModel(id: $id, code: $code, topic: $topic, startTime: $startTime, durationMinutes: $durationMinutes, hostId: $hostId, hostName: $hostName, participantIds: $participantIds, isRecording: $isRecording, primaryLanguage: $primaryLanguage, translationLanguages: $translationLanguages, description: $description, password: $password)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GcbMeetingModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('topic', topic))
      ..add(DiagnosticsProperty('startTime', startTime))
      ..add(DiagnosticsProperty('durationMinutes', durationMinutes))
      ..add(DiagnosticsProperty('hostId', hostId))
      ..add(DiagnosticsProperty('hostName', hostName))
      ..add(DiagnosticsProperty('participantIds', participantIds))
      ..add(DiagnosticsProperty('isRecording', isRecording))
      ..add(DiagnosticsProperty('primaryLanguage', primaryLanguage))
      ..add(DiagnosticsProperty('translationLanguages', translationLanguages))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('password', password));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GcbMeetingModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.hostId, hostId) || other.hostId == hostId) &&
            (identical(other.hostName, hostName) ||
                other.hostName == hostName) &&
            const DeepCollectionEquality()
                .equals(other._participantIds, _participantIds) &&
            (identical(other.isRecording, isRecording) ||
                other.isRecording == isRecording) &&
            (identical(other.primaryLanguage, primaryLanguage) ||
                other.primaryLanguage == primaryLanguage) &&
            const DeepCollectionEquality()
                .equals(other._translationLanguages, _translationLanguages) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      code,
      topic,
      startTime,
      durationMinutes,
      hostId,
      hostName,
      const DeepCollectionEquality().hash(_participantIds),
      isRecording,
      primaryLanguage,
      const DeepCollectionEquality().hash(_translationLanguages),
      description,
      password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GcbMeetingModelImplCopyWith<_$GcbMeetingModelImpl> get copyWith =>
      __$$GcbMeetingModelImplCopyWithImpl<_$GcbMeetingModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GcbMeetingModelImplToJson(
      this,
    );
  }
}

abstract class _GcbMeetingModel implements GcbMeetingModel {
  const factory _GcbMeetingModel(
      {required final String id,
      required final String code,
      required final String topic,
      required final DateTime startTime,
      required final int durationMinutes,
      required final String hostId,
      required final String hostName,
      required final List<String> participantIds,
      required final bool isRecording,
      required final String primaryLanguage,
      required final List<String> translationLanguages,
      final String? description,
      final String? password}) = _$GcbMeetingModelImpl;

  factory _GcbMeetingModel.fromJson(Map<String, dynamic> json) =
      _$GcbMeetingModelImpl.fromJson;

  @override
  String get id;
  @override
  String get code;
  @override
  String get topic;
  @override
  DateTime get startTime;
  @override
  int get durationMinutes;
  @override
  String get hostId;
  @override
  String get hostName;
  @override
  List<String> get participantIds;
  @override
  bool get isRecording;
  @override
  String get primaryLanguage;
  @override
  List<String> get translationLanguages;
  @override
  String? get description;
  @override
  String? get password;
  @override
  @JsonKey(ignore: true)
  _$$GcbMeetingModelImplCopyWith<_$GcbMeetingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
