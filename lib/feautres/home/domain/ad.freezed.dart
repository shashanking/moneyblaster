// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ad.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Ad _$AdFromJson(Map<String, dynamic> json) {
  return _Ad.fromJson(json);
}

/// @nodoc
mixin _$Ad {
  String get uid => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  String get url =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'adDetails')
  List<AdDetails> get adDetails => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdCopyWith<Ad> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdCopyWith<$Res> {
  factory $AdCopyWith(Ad value, $Res Function(Ad) then) =
      _$AdCopyWithImpl<$Res, Ad>;
  @useResult
  $Res call(
      {String uid,
      String? title,
      String? description,
      String imagePath,
      String url,
      @JsonKey(name: 'adDetails') List<AdDetails> adDetails});
}

/// @nodoc
class _$AdCopyWithImpl<$Res, $Val extends Ad> implements $AdCopyWith<$Res> {
  _$AdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? title = freezed,
    Object? description = freezed,
    Object? imagePath = null,
    Object? url = null,
    Object? adDetails = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      adDetails: null == adDetails
          ? _value.adDetails
          : adDetails // ignore: cast_nullable_to_non_nullable
              as List<AdDetails>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdImplCopyWith<$Res> implements $AdCopyWith<$Res> {
  factory _$$AdImplCopyWith(_$AdImpl value, $Res Function(_$AdImpl) then) =
      __$$AdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String? title,
      String? description,
      String imagePath,
      String url,
      @JsonKey(name: 'adDetails') List<AdDetails> adDetails});
}

/// @nodoc
class __$$AdImplCopyWithImpl<$Res> extends _$AdCopyWithImpl<$Res, _$AdImpl>
    implements _$$AdImplCopyWith<$Res> {
  __$$AdImplCopyWithImpl(_$AdImpl _value, $Res Function(_$AdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? title = freezed,
    Object? description = freezed,
    Object? imagePath = null,
    Object? url = null,
    Object? adDetails = null,
  }) {
    return _then(_$AdImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      adDetails: null == adDetails
          ? _value._adDetails
          : adDetails // ignore: cast_nullable_to_non_nullable
              as List<AdDetails>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdImpl implements _Ad {
  const _$AdImpl(
      {required this.uid,
      required this.title,
      required this.description,
      required this.imagePath,
      required this.url,
      @JsonKey(name: 'adDetails') final List<AdDetails> adDetails = const []})
      : _adDetails = adDetails;

  factory _$AdImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdImplFromJson(json);

  @override
  final String uid;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String imagePath;
  @override
  final String url;
// ignore: invalid_annotation_target
  final List<AdDetails> _adDetails;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'adDetails')
  List<AdDetails> get adDetails {
    if (_adDetails is EqualUnmodifiableListView) return _adDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_adDetails);
  }

  @override
  String toString() {
    return 'Ad(uid: $uid, title: $title, description: $description, imagePath: $imagePath, url: $url, adDetails: $adDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality()
                .equals(other._adDetails, _adDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, title, description,
      imagePath, url, const DeepCollectionEquality().hash(_adDetails));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdImplCopyWith<_$AdImpl> get copyWith =>
      __$$AdImplCopyWithImpl<_$AdImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdImplToJson(
      this,
    );
  }
}

abstract class _Ad implements Ad {
  const factory _Ad(
      {required final String uid,
      required final String? title,
      required final String? description,
      required final String imagePath,
      required final String url,
      @JsonKey(name: 'adDetails') final List<AdDetails> adDetails}) = _$AdImpl;

  factory _Ad.fromJson(Map<String, dynamic> json) = _$AdImpl.fromJson;

  @override
  String get uid;
  @override
  String? get title;
  @override
  String? get description;
  @override
  String get imagePath;
  @override
  String get url;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'adDetails')
  List<AdDetails> get adDetails;
  @override
  @JsonKey(ignore: true)
  _$$AdImplCopyWith<_$AdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AdDetails _$AdDetailsFromJson(Map<String, dynamic> json) {
  return _AdDetails.fromJson(json);
}

/// @nodoc
mixin _$AdDetails {
  String? get userId => throw _privateConstructorUsedError;
  int get timesClicked => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdDetailsCopyWith<AdDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdDetailsCopyWith<$Res> {
  factory $AdDetailsCopyWith(AdDetails value, $Res Function(AdDetails) then) =
      _$AdDetailsCopyWithImpl<$Res, AdDetails>;
  @useResult
  $Res call({String? userId, int timesClicked});
}

/// @nodoc
class _$AdDetailsCopyWithImpl<$Res, $Val extends AdDetails>
    implements $AdDetailsCopyWith<$Res> {
  _$AdDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? timesClicked = null,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      timesClicked: null == timesClicked
          ? _value.timesClicked
          : timesClicked // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdDetailsImplCopyWith<$Res>
    implements $AdDetailsCopyWith<$Res> {
  factory _$$AdDetailsImplCopyWith(
          _$AdDetailsImpl value, $Res Function(_$AdDetailsImpl) then) =
      __$$AdDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? userId, int timesClicked});
}

/// @nodoc
class __$$AdDetailsImplCopyWithImpl<$Res>
    extends _$AdDetailsCopyWithImpl<$Res, _$AdDetailsImpl>
    implements _$$AdDetailsImplCopyWith<$Res> {
  __$$AdDetailsImplCopyWithImpl(
      _$AdDetailsImpl _value, $Res Function(_$AdDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? timesClicked = null,
  }) {
    return _then(_$AdDetailsImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      timesClicked: null == timesClicked
          ? _value.timesClicked
          : timesClicked // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdDetailsImpl implements _AdDetails {
  const _$AdDetailsImpl({required this.userId, required this.timesClicked});

  factory _$AdDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdDetailsImplFromJson(json);

  @override
  final String? userId;
  @override
  final int timesClicked;

  @override
  String toString() {
    return 'AdDetails(userId: $userId, timesClicked: $timesClicked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdDetailsImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.timesClicked, timesClicked) ||
                other.timesClicked == timesClicked));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, timesClicked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdDetailsImplCopyWith<_$AdDetailsImpl> get copyWith =>
      __$$AdDetailsImplCopyWithImpl<_$AdDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdDetailsImplToJson(
      this,
    );
  }
}

abstract class _AdDetails implements AdDetails {
  const factory _AdDetails(
      {required final String? userId,
      required final int timesClicked}) = _$AdDetailsImpl;

  factory _AdDetails.fromJson(Map<String, dynamic> json) =
      _$AdDetailsImpl.fromJson;

  @override
  String? get userId;
  @override
  int get timesClicked;
  @override
  @JsonKey(ignore: true)
  _$$AdDetailsImplCopyWith<_$AdDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
