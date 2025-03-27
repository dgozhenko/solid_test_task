// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'color_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ColorDetailState {
  Color? get backgroundColor => throw _privateConstructorUsedError;
  String? get initialHexString => throw _privateConstructorUsedError;
  bool? get navigateBack => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of ColorDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ColorDetailStateCopyWith<ColorDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorDetailStateCopyWith<$Res> {
  factory $ColorDetailStateCopyWith(
    ColorDetailState value,
    $Res Function(ColorDetailState) then,
  ) = _$ColorDetailStateCopyWithImpl<$Res, ColorDetailState>;
  @useResult
  $Res call({
    Color? backgroundColor,
    String? initialHexString,
    bool? navigateBack,
    String? error,
  });
}

/// @nodoc
class _$ColorDetailStateCopyWithImpl<$Res, $Val extends ColorDetailState>
    implements $ColorDetailStateCopyWith<$Res> {
  _$ColorDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ColorDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = freezed,
    Object? initialHexString = freezed,
    Object? navigateBack = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            backgroundColor:
                freezed == backgroundColor
                    ? _value.backgroundColor
                    : backgroundColor // ignore: cast_nullable_to_non_nullable
                        as Color?,
            initialHexString:
                freezed == initialHexString
                    ? _value.initialHexString
                    : initialHexString // ignore: cast_nullable_to_non_nullable
                        as String?,
            navigateBack:
                freezed == navigateBack
                    ? _value.navigateBack
                    : navigateBack // ignore: cast_nullable_to_non_nullable
                        as bool?,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ColorDetailStateImplCopyWith<$Res>
    implements $ColorDetailStateCopyWith<$Res> {
  factory _$$ColorDetailStateImplCopyWith(
    _$ColorDetailStateImpl value,
    $Res Function(_$ColorDetailStateImpl) then,
  ) = __$$ColorDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Color? backgroundColor,
    String? initialHexString,
    bool? navigateBack,
    String? error,
  });
}

/// @nodoc
class __$$ColorDetailStateImplCopyWithImpl<$Res>
    extends _$ColorDetailStateCopyWithImpl<$Res, _$ColorDetailStateImpl>
    implements _$$ColorDetailStateImplCopyWith<$Res> {
  __$$ColorDetailStateImplCopyWithImpl(
    _$ColorDetailStateImpl _value,
    $Res Function(_$ColorDetailStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ColorDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? backgroundColor = freezed,
    Object? initialHexString = freezed,
    Object? navigateBack = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _$ColorDetailStateImpl(
        backgroundColor:
            freezed == backgroundColor
                ? _value.backgroundColor
                : backgroundColor // ignore: cast_nullable_to_non_nullable
                    as Color?,
        initialHexString:
            freezed == initialHexString
                ? _value.initialHexString
                : initialHexString // ignore: cast_nullable_to_non_nullable
                    as String?,
        navigateBack:
            freezed == navigateBack
                ? _value.navigateBack
                : navigateBack // ignore: cast_nullable_to_non_nullable
                    as bool?,
        error:
            freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$ColorDetailStateImpl implements _ColorDetailState {
  const _$ColorDetailStateImpl({
    required this.backgroundColor,
    required this.initialHexString,
    this.navigateBack,
    this.error,
  });

  @override
  final Color? backgroundColor;
  @override
  final String? initialHexString;
  @override
  final bool? navigateBack;
  @override
  final String? error;

  @override
  String toString() {
    return 'ColorDetailState(backgroundColor: $backgroundColor, initialHexString: $initialHexString, navigateBack: $navigateBack, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorDetailStateImpl &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.initialHexString, initialHexString) ||
                other.initialHexString == initialHexString) &&
            (identical(other.navigateBack, navigateBack) ||
                other.navigateBack == navigateBack) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    backgroundColor,
    initialHexString,
    navigateBack,
    error,
  );

  /// Create a copy of ColorDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ColorDetailStateImplCopyWith<_$ColorDetailStateImpl> get copyWith =>
      __$$ColorDetailStateImplCopyWithImpl<_$ColorDetailStateImpl>(
        this,
        _$identity,
      );
}

abstract class _ColorDetailState implements ColorDetailState {
  const factory _ColorDetailState({
    required final Color? backgroundColor,
    required final String? initialHexString,
    final bool? navigateBack,
    final String? error,
  }) = _$ColorDetailStateImpl;

  @override
  Color? get backgroundColor;
  @override
  String? get initialHexString;
  @override
  bool? get navigateBack;
  @override
  String? get error;

  /// Create a copy of ColorDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ColorDetailStateImplCopyWith<_$ColorDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
