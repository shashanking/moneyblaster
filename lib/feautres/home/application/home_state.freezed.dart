// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  bool get isLoading => throw _privateConstructorUsedError;
  GameState get selectedHomeTab => throw _privateConstructorUsedError;
  ProfileTabState get selectedProfileTab => throw _privateConstructorUsedError;
  List<Tournament> get tournaments => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  Tournament? get selectedTournament => throw _privateConstructorUsedError;
  List<UserModel> get topUsers => throw _privateConstructorUsedError;
  List<Ad> get adsList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {bool isLoading,
      GameState selectedHomeTab,
      ProfileTabState selectedProfileTab,
      List<Tournament> tournaments,
      String errorMessage,
      Tournament? selectedTournament,
      List<UserModel> topUsers,
      List<Ad> adsList});

  $TournamentCopyWith<$Res>? get selectedTournament;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? selectedHomeTab = null,
    Object? selectedProfileTab = null,
    Object? tournaments = null,
    Object? errorMessage = null,
    Object? selectedTournament = freezed,
    Object? topUsers = null,
    Object? adsList = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedHomeTab: null == selectedHomeTab
          ? _value.selectedHomeTab
          : selectedHomeTab // ignore: cast_nullable_to_non_nullable
              as GameState,
      selectedProfileTab: null == selectedProfileTab
          ? _value.selectedProfileTab
          : selectedProfileTab // ignore: cast_nullable_to_non_nullable
              as ProfileTabState,
      tournaments: null == tournaments
          ? _value.tournaments
          : tournaments // ignore: cast_nullable_to_non_nullable
              as List<Tournament>,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      selectedTournament: freezed == selectedTournament
          ? _value.selectedTournament
          : selectedTournament // ignore: cast_nullable_to_non_nullable
              as Tournament?,
      topUsers: null == topUsers
          ? _value.topUsers
          : topUsers // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
      adsList: null == adsList
          ? _value.adsList
          : adsList // ignore: cast_nullable_to_non_nullable
              as List<Ad>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TournamentCopyWith<$Res>? get selectedTournament {
    if (_value.selectedTournament == null) {
      return null;
    }

    return $TournamentCopyWith<$Res>(_value.selectedTournament!, (value) {
      return _then(_value.copyWith(selectedTournament: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      GameState selectedHomeTab,
      ProfileTabState selectedProfileTab,
      List<Tournament> tournaments,
      String errorMessage,
      Tournament? selectedTournament,
      List<UserModel> topUsers,
      List<Ad> adsList});

  @override
  $TournamentCopyWith<$Res>? get selectedTournament;
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? selectedHomeTab = null,
    Object? selectedProfileTab = null,
    Object? tournaments = null,
    Object? errorMessage = null,
    Object? selectedTournament = freezed,
    Object? topUsers = null,
    Object? adsList = null,
  }) {
    return _then(_$HomeStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedHomeTab: null == selectedHomeTab
          ? _value.selectedHomeTab
          : selectedHomeTab // ignore: cast_nullable_to_non_nullable
              as GameState,
      selectedProfileTab: null == selectedProfileTab
          ? _value.selectedProfileTab
          : selectedProfileTab // ignore: cast_nullable_to_non_nullable
              as ProfileTabState,
      tournaments: null == tournaments
          ? _value._tournaments
          : tournaments // ignore: cast_nullable_to_non_nullable
              as List<Tournament>,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      selectedTournament: freezed == selectedTournament
          ? _value.selectedTournament
          : selectedTournament // ignore: cast_nullable_to_non_nullable
              as Tournament?,
      topUsers: null == topUsers
          ? _value._topUsers
          : topUsers // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
      adsList: null == adsList
          ? _value._adsList
          : adsList // ignore: cast_nullable_to_non_nullable
              as List<Ad>,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl extends _HomeState {
  const _$HomeStateImpl(
      {this.isLoading = false,
      this.selectedHomeTab = GameState.ongoing,
      this.selectedProfileTab = ProfileTabState.profile,
      final List<Tournament> tournaments = const [],
      this.errorMessage = '',
      this.selectedTournament,
      final List<UserModel> topUsers = const [],
      final List<Ad> adsList = const []})
      : _tournaments = tournaments,
        _topUsers = topUsers,
        _adsList = adsList,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final GameState selectedHomeTab;
  @override
  @JsonKey()
  final ProfileTabState selectedProfileTab;
  final List<Tournament> _tournaments;
  @override
  @JsonKey()
  List<Tournament> get tournaments {
    if (_tournaments is EqualUnmodifiableListView) return _tournaments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tournaments);
  }

  @override
  @JsonKey()
  final String errorMessage;
  @override
  final Tournament? selectedTournament;
  final List<UserModel> _topUsers;
  @override
  @JsonKey()
  List<UserModel> get topUsers {
    if (_topUsers is EqualUnmodifiableListView) return _topUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topUsers);
  }

  final List<Ad> _adsList;
  @override
  @JsonKey()
  List<Ad> get adsList {
    if (_adsList is EqualUnmodifiableListView) return _adsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_adsList);
  }

  @override
  String toString() {
    return 'HomeState(isLoading: $isLoading, selectedHomeTab: $selectedHomeTab, selectedProfileTab: $selectedProfileTab, tournaments: $tournaments, errorMessage: $errorMessage, selectedTournament: $selectedTournament, topUsers: $topUsers, adsList: $adsList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.selectedHomeTab, selectedHomeTab) ||
                other.selectedHomeTab == selectedHomeTab) &&
            (identical(other.selectedProfileTab, selectedProfileTab) ||
                other.selectedProfileTab == selectedProfileTab) &&
            const DeepCollectionEquality()
                .equals(other._tournaments, _tournaments) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.selectedTournament, selectedTournament) ||
                other.selectedTournament == selectedTournament) &&
            const DeepCollectionEquality().equals(other._topUsers, _topUsers) &&
            const DeepCollectionEquality().equals(other._adsList, _adsList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      selectedHomeTab,
      selectedProfileTab,
      const DeepCollectionEquality().hash(_tournaments),
      errorMessage,
      selectedTournament,
      const DeepCollectionEquality().hash(_topUsers),
      const DeepCollectionEquality().hash(_adsList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState extends HomeState {
  const factory _HomeState(
      {final bool isLoading,
      final GameState selectedHomeTab,
      final ProfileTabState selectedProfileTab,
      final List<Tournament> tournaments,
      final String errorMessage,
      final Tournament? selectedTournament,
      final List<UserModel> topUsers,
      final List<Ad> adsList}) = _$HomeStateImpl;
  const _HomeState._() : super._();

  @override
  bool get isLoading;
  @override
  GameState get selectedHomeTab;
  @override
  ProfileTabState get selectedProfileTab;
  @override
  List<Tournament> get tournaments;
  @override
  String get errorMessage;
  @override
  Tournament? get selectedTournament;
  @override
  List<UserModel> get topUsers;
  @override
  List<Ad> get adsList;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
