// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'color_gallery_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ColorGalleryState {
  bool get loading => throw _privateConstructorUsedError;
  List<ColorModel> get colors => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of ColorGalleryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ColorGalleryStateCopyWith<ColorGalleryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorGalleryStateCopyWith<$Res> {
  factory $ColorGalleryStateCopyWith(
    ColorGalleryState value,
    $Res Function(ColorGalleryState) then,
  ) = _$ColorGalleryStateCopyWithImpl<$Res, ColorGalleryState>;
  @useResult
  $Res call({bool loading, List<ColorModel> colors, String? error});
}

/// @nodoc
class _$ColorGalleryStateCopyWithImpl<$Res, $Val extends ColorGalleryState>
    implements $ColorGalleryStateCopyWith<$Res> {
  _$ColorGalleryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ColorGalleryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? colors = null,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            loading:
                null == loading
                    ? _value.loading
                    : loading // ignore: cast_nullable_to_non_nullable
                        as bool,
            colors:
                null == colors
                    ? _value.colors
                    : colors // ignore: cast_nullable_to_non_nullable
                        as List<ColorModel>,
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
abstract class _$$ColorGalleryStateImplCopyWith<$Res>
    implements $ColorGalleryStateCopyWith<$Res> {
  factory _$$ColorGalleryStateImplCopyWith(
    _$ColorGalleryStateImpl value,
    $Res Function(_$ColorGalleryStateImpl) then,
  ) = __$$ColorGalleryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, List<ColorModel> colors, String? error});
}

/// @nodoc
class __$$ColorGalleryStateImplCopyWithImpl<$Res>
    extends _$ColorGalleryStateCopyWithImpl<$Res, _$ColorGalleryStateImpl>
    implements _$$ColorGalleryStateImplCopyWith<$Res> {
  __$$ColorGalleryStateImplCopyWithImpl(
    _$ColorGalleryStateImpl _value,
    $Res Function(_$ColorGalleryStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ColorGalleryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? colors = null,
    Object? error = freezed,
  }) {
    return _then(
      _$ColorGalleryStateImpl(
        loading:
            null == loading
                ? _value.loading
                : loading // ignore: cast_nullable_to_non_nullable
                    as bool,
        colors:
            null == colors
                ? _value._colors
                : colors // ignore: cast_nullable_to_non_nullable
                    as List<ColorModel>,
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

class _$ColorGalleryStateImpl implements _ColorGalleryState {
  const _$ColorGalleryStateImpl({
    required this.loading,
    required final List<ColorModel> colors,
    this.error,
  }) : _colors = colors;

  @override
  final bool loading;
  final List<ColorModel> _colors;
  @override
  List<ColorModel> get colors {
    if (_colors is EqualUnmodifiableListView) return _colors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_colors);
  }

  @override
  final String? error;

  @override
  String toString() {
    return 'ColorGalleryState(loading: $loading, colors: $colors, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ColorGalleryStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(other._colors, _colors) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    loading,
    const DeepCollectionEquality().hash(_colors),
    error,
  );

  /// Create a copy of ColorGalleryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ColorGalleryStateImplCopyWith<_$ColorGalleryStateImpl> get copyWith =>
      __$$ColorGalleryStateImplCopyWithImpl<_$ColorGalleryStateImpl>(
        this,
        _$identity,
      );
}

abstract class _ColorGalleryState implements ColorGalleryState {
  const factory _ColorGalleryState({
    required final bool loading,
    required final List<ColorModel> colors,
    final String? error,
  }) = _$ColorGalleryStateImpl;

  @override
  bool get loading;
  @override
  List<ColorModel> get colors;
  @override
  String? get error;

  /// Create a copy of ColorGalleryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ColorGalleryStateImplCopyWith<_$ColorGalleryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
