// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subtitle_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GcbSubtitleModel _$GcbSubtitleModelFromJson(Map<String, dynamic> json) {
  return _GcbSubtitleModel.fromJson(json);
}

/// @nodoc
mixin _$GcbSubtitleModel {
  String get id => throw _privateConstructorUsedError;
  String get participantId => throw _privateConstructorUsedError;
  String get participantName => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GcbSubtitleModelCopyWith<GcbSubtitleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GcbSubtitleModelCopyWith<$Res> {
  factory $GcbSubtitleModelCopyWith(
          GcbSubtitleModel value, $Res Function(GcbSubtitleModel) then) =
      _$GcbSubtitleModelCopyWithImpl<$Res, GcbSubtitleModel>;
  @useResult
  $Res call(
      {String id,
      String participantId,
      String participantName,
      String text,
      String language,
      DateTime timestamp,
      Duration duration});
}

/// @nodoc
class _$GcbSubtitleModelCopyWithImpl<$Res, $Val extends GcbSubtitleModel>
    implements $GcbSubtitleModelCopyWith<$Res> {
  _$GcbSubtitleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? participantId = null,
    Object? participantName = null,
    Object? text = null,
    Object? language = null,
    Object? timestamp = null,
    Object? duration = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      participantId: null == participantId
          ? _value.participantId
          : participantId // ignore: cast_nullable_to_non_nullable
              as String,
      participantName: null == participantName
          ? _value.participantName
          : participantName // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GcbSubtitleModelImplCopyWith<$Res>
    implements $GcbSubtitleModelCopyWith<$Res> {
  factory _$$GcbSubtitleModelImplCopyWith(_$GcbSubtitleModelImpl value,
          $Res Function(_$GcbSubtitleModelImpl) then) =
      __$$GcbSubtitleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String participantId,
      String participantName,
      String text,
      String language,
      DateTime timestamp,
      Duration duration});
}

/// @nodoc
class __$$GcbSubtitleModelImplCopyWithImpl<$Res>
    extends _$GcbSubtitleModelCopyWithImpl<$Res, _$GcbSubtitleModelImpl>
    implements _$$GcbSubtitleModelImplCopyWith<$Res> {
  __$$GcbSubtitleModelImplCopyWithImpl(_$GcbSubtitleModelImpl _value,
      $Res Function(_$GcbSubtitleModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? participantId = null,
    Object? participantName = null,
    Object? text = null,
    Object? language = null,
    Object? timestamp = null,
    Object? duration = null,
  }) {
    return _then(_$GcbSubtitleModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      participantId: null == participantId
          ? _value.participantId
          : participantId // ignore: cast_nullable_to_non_nullable
              as String,
      participantName: null == participantName
          ? _value.participantName
          : participantName // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GcbSubtitleModelImpl
    with DiagnosticableTreeMixin
    implements _GcbSubtitleModel {
  const _$GcbSubtitleModelImpl(
      {required this.id,
      required this.participantId,
      required this.participantName,
      required this.text,
      required this.language,
      required this.timestamp,
      required this.duration});

  factory _$GcbSubtitleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GcbSubtitleModelImplFromJson(json);

  @override
  final String id;
  @override
  final String participantId;
  @override
  final String participantName;
  @override
  final String text;
  @override
  final String language;
  @override
  final DateTime timestamp;
  @override
  final Duration duration;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GcbSubtitleModel(id: $id, participantId: $participantId, participantName: $participantName, text: $text, language: $language, timestamp: $timestamp, duration: $duration)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GcbSubtitleModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('participantId', participantId))
      ..add(DiagnosticsProperty('participantName', participantName))
      ..add(DiagnosticsProperty('text', text))
      ..add(DiagnosticsProperty('language', language))
      ..add(DiagnosticsProperty('timestamp', timestamp))
      ..add(DiagnosticsProperty('duration', duration));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GcbSubtitleModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.participantId, participantId) ||
                other.participantId == participantId) &&
            (identical(other.participantName, participantName) ||
                other.participantName == participantName) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, participantId,
      participantName, text, language, timestamp, duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GcbSubtitleModelImplCopyWith<_$GcbSubtitleModelImpl> get copyWith =>
      __$$GcbSubtitleModelImplCopyWithImpl<_$GcbSubtitleModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GcbSubtitleModelImplToJson(
      this,
    );
  }
}

abstract class _GcbSubtitleModel implements GcbSubtitleModel {
  const factory _GcbSubtitleModel(
      {required final String id,
      required final String participantId,
      required final String participantName,
      required final String text,
      required final String language,
      required final DateTime timestamp,
      required final Duration duration}) = _$GcbSubtitleModelImpl;

  factory _GcbSubtitleModel.fromJson(Map<String, dynamic> json) =
      _$GcbSubtitleModelImpl.fromJson;

  @override
  String get id;
  @override
  String get participantId;
  @override
  String get participantName;
  @override
  String get text;
  @override
  String get language;
  @override
  DateTime get timestamp;
  @override
  Duration get duration;
  @override
  @JsonKey(ignore: true)
  _$$GcbSubtitleModelImplCopyWith<_$GcbSubtitleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
