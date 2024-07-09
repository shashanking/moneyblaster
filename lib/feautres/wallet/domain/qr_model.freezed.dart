// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QrModel _$QrModelFromJson(Map<String, dynamic> json) {
  return _QrModel.fromJson(json);
}

/// @nodoc
mixin _$QrModel {
  String get uid => throw _privateConstructorUsedError;
  String get qrImage => throw _privateConstructorUsedError;
  String get upiId => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;
  dynamic get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QrModelCopyWith<QrModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrModelCopyWith<$Res> {
  factory $QrModelCopyWith(QrModel value, $Res Function(QrModel) then) =
      _$QrModelCopyWithImpl<$Res, QrModel>;
  @useResult
  $Res call(
      {String uid,
      String qrImage,
      String upiId,
      bool isDefault,
      dynamic createdAt});
}

/// @nodoc
class _$QrModelCopyWithImpl<$Res, $Val extends QrModel>
    implements $QrModelCopyWith<$Res> {
  _$QrModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? qrImage = null,
    Object? upiId = null,
    Object? isDefault = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      qrImage: null == qrImage
          ? _value.qrImage
          : qrImage // ignore: cast_nullable_to_non_nullable
              as String,
      upiId: null == upiId
          ? _value.upiId
          : upiId // ignore: cast_nullable_to_non_nullable
              as String,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QrModelImplCopyWith<$Res> implements $QrModelCopyWith<$Res> {
  factory _$$QrModelImplCopyWith(
          _$QrModelImpl value, $Res Function(_$QrModelImpl) then) =
      __$$QrModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String qrImage,
      String upiId,
      bool isDefault,
      dynamic createdAt});
}

/// @nodoc
class __$$QrModelImplCopyWithImpl<$Res>
    extends _$QrModelCopyWithImpl<$Res, _$QrModelImpl>
    implements _$$QrModelImplCopyWith<$Res> {
  __$$QrModelImplCopyWithImpl(
      _$QrModelImpl _value, $Res Function(_$QrModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? qrImage = null,
    Object? upiId = null,
    Object? isDefault = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$QrModelImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      qrImage: null == qrImage
          ? _value.qrImage
          : qrImage // ignore: cast_nullable_to_non_nullable
              as String,
      upiId: null == upiId
          ? _value.upiId
          : upiId // ignore: cast_nullable_to_non_nullable
              as String,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$QrModelImpl implements _QrModel {
  const _$QrModelImpl(
      {required this.uid,
      required this.qrImage,
      required this.upiId,
      required this.isDefault,
      this.createdAt});

  factory _$QrModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QrModelImplFromJson(json);

  @override
  final String uid;
  @override
  final String qrImage;
  @override
  final String upiId;
  @override
  final bool isDefault;
  @override
  final dynamic createdAt;

  @override
  String toString() {
    return 'QrModel(uid: $uid, qrImage: $qrImage, upiId: $upiId, isDefault: $isDefault, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QrModelImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.qrImage, qrImage) || other.qrImage == qrImage) &&
            (identical(other.upiId, upiId) || other.upiId == upiId) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, qrImage, upiId, isDefault,
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QrModelImplCopyWith<_$QrModelImpl> get copyWith =>
      __$$QrModelImplCopyWithImpl<_$QrModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QrModelImplToJson(
      this,
    );
  }
}

abstract class _QrModel implements QrModel {
  const factory _QrModel(
      {required final String uid,
      required final String qrImage,
      required final String upiId,
      required final bool isDefault,
      final dynamic createdAt}) = _$QrModelImpl;

  factory _QrModel.fromJson(Map<String, dynamic> json) = _$QrModelImpl.fromJson;

  @override
  String get uid;
  @override
  String get qrImage;
  @override
  String get upiId;
  @override
  bool get isDefault;
  @override
  dynamic get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$QrModelImplCopyWith<_$QrModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
