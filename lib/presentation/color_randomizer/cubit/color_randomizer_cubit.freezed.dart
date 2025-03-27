// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'color_randomizer_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ColorRandomizerState {
  Color get backgroundColor => throw _privateConstructorUsedError;
  Color get textColor => throw _privateConstructorUsedError;
  bool get firstColorGenerated => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  bool? get showDatabaseSaveSuccess => throw _privateConstructorUsedError;

  /// Create a copy of ColorRandomizerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ColorRandomizerStateCopyWith<ColorRandomizerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorRandomizerStateCopyWith<$Res> {
  factory $ColorRandomizerStateCopyWith(
    ColorRandomizerState value,
    $Res Function(ColorRandomizerState) then,
  ) = _$ColorRandomizerStateCopyWithImpl<$Res, ColorRandomizerState>;
  @useResult
  $Res call({
    Color backgroundColor,
    Color textColor,
    bool firstColorGenerated,
    String? error,
    bool? showDatabaseSaveSuccess,
  });
}

/// @nodoc
class _$ColorRandomizerStateCopyWithImpl<
  $Res,
  $Val extends ColorRandomizerState
>
    implements $ColorRandomizerStateCopyWith<$Res> {
  _$ColorRandomizerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ColorRandomizerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = null,
    Object? textColor = null,
    Object? firstColorGenerated = null,
    Object? error = freezed,
    Object? showDatabaseSaveSuccess = freezed,
  }) {
    return _then(
      _value.copyWith(
            backgroundColor:
                null == backgroundColor
                    ? _value.backgroundColor
                    : backgroundColor // ignore: cast_nullable_to_non_nullable
                        as Color,
            textColor:
                null == textColor
                    ? _value.textColor
                    : textColor // ignore: cast_nullable_to_non_nullable
                        as Color,
            firstColorGenerated:
                null == firstColorGenerated
                    ? _value.firstColorGenerated
                    : firstColorGenerated // ignore: cast_nullable_to_non_nullable
                        as bool,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as String?,
            showDatabaseSaveSuccess:
                freezed == showDatabaseSaveSuccess
                    ? _value.showDatabaseSaveSuccess
                    : showDatabaseSaveSuccess // ignore: cast_nullable_to_non_nullable
                        as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ColorRandomizerStateImplCopyWith<$Res>
    implements $ColorRandomizerStateCopyWith<$Res> {
  factory _$$ColorRandomizerStateImplCopyWith(
    _$ColorRandomizerStateImpl value,
    $Res Function(_$ColorRandomizerStateImpl) then,
  ) = __$$ColorRandomizerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Color backgroundColor,
    Color textColor,
    bool firstColorGenerated,
    String? error,
    bool? showDatabaseSaveSuccess,
  });
}

/// @nodoc
class __$$ColorRandomizerStateImplCopyWithImpl<$Res>
    extends _$ColorRandomizerStateCopyWithImpl<$Res, _$ColorRandomizerStateImpl>
    implements _$$ColorRandomizerStateImplCopyWith<$Res> {
  __$$ColorRandomizerStateImplCopyWithImpl(
    _$ColorRandomizerStateImpl _value,
    $Res Function(_$ColorRandomizerStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ColorRandomizerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = null,
    Object? textColor = null,
    Object? firstColorGenerated = null,
    Object? error = freezed,
    Object? showDatabaseSaveSuccess = freezed,
  }) {
    return _then(
      _$ColorRandomizerStateImpl(
        backgroundColor:
            null == backgroundColor
                ? _value.backgroundColor
                : backgroundColor // ignore: cast_nullable_to_non_nullable
                    as Color,
        textColor:
            null == textColor
                ? _value.textColor
                : textColor // ignore: cast_nullable_to_non_nullable
                    as Color,
        firstColorGenerated:
            null == firstColorGenerated
                ? _value.firstColorGenerated
                : firstColorGenerated // ignore: cast_nullable_to_non_nullable
                    as bool,
        error:
            freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as String?,
        showDatabaseSaveSuccess:
            freezed == showDatabaseSaveSuccess
                ? _value.showDatabaseSaveSuccess
                : showDatabaseSaveSuccess // ignore: cast_nullable_to_non_nullable
                    as bool?,
      ),
    );
  }
}

/// @nodoc

class _$ColorRandomizerStateImpl implements _ColorRandomizerState {
  const _$ColorRandomizerStateImpl({
    required this.backgroundColor,
    required this.textColor,
    required this.firstColorGenerated,
    this.error,
    this.showDatabaseSaveSuccess,
  });

  @override
  final Color backgroundColor;
  @override
  final Color textColor;
  @override
  final bool firstColorGenerated;
  @override
  final String? error;
  @override
  final bool? showDatabaseSaveSuccess;

  @override
  String toString() {
    return 'ColorRandomizerState(backgroundColor: $backgroundColor, textColor: $textColor, firstColorGenerated: $firstColorGenerated, error: $error, showDatabaseSaveSuccess: $showDatabaseSaveSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorRandomizerStateImpl &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.textColor, textColor) ||
                other.textColor == textColor) &&
            (identical(other.firstColorGenerated, firstColorGenerated) ||
                other.firstColorGenerated == firstColorGenerated) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(
                  other.showDatabaseSaveSuccess,
                  showDatabaseSaveSuccess,
                ) ||
                other.showDatabaseSaveSuccess == showDatabaseSaveSuccess));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    backgroundColor,
    textColor,
    firstColorGenerated,
    error,
    showDatabaseSaveSuccess,
  );

  /// Create a copy of ColorRandomizerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ColorRandomizerStateImplCopyWith<_$ColorRandomizerStateImpl>
  get copyWith =>
      __$$ColorRandomizerStateImplCopyWithImpl<_$ColorRandomizerStateImpl>(
        this,
        _$identity,
      );
}

abstract class _ColorRandomizerState implements ColorRandomizerState {
  const factory _ColorRandomizerState({
    required final Color backgroundColor,
    required final Color textColor,
    required final bool firstColorGenerated,
    final String? error,
    final bool? showDatabaseSaveSuccess,
  }) = _$ColorRandomizerStateImpl;

  @override
  Color get backgroundColor;
  @override
  Color get textColor;
  @override
  bool get firstColorGenerated;
  @override
  String? get error;
  @override
  bool? get showDatabaseSaveSuccess;

  /// Create a copy of ColorRandomizerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ColorRandomizerStateImplCopyWith<_$ColorRandomizerStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
