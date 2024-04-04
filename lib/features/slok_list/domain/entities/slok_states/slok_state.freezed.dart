// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slok_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SlokState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String failedAppStateResponse) failure,
    required TResult Function(
            DataResponse<List<BhagavadGitaVerse>>? data,
            DataResponse<ChapterInfo>? chapterInfo,
            DataResponse<BhagavadGitaVerse>? detail)
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String failedAppStateResponse)? failure,
    TResult? Function(
            DataResponse<List<BhagavadGitaVerse>>? data,
            DataResponse<ChapterInfo>? chapterInfo,
            DataResponse<BhagavadGitaVerse>? detail)?
        success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String failedAppStateResponse)? failure,
    TResult Function(
            DataResponse<List<BhagavadGitaVerse>>? data,
            DataResponse<ChapterInfo>? chapterInfo,
            DataResponse<BhagavadGitaVerse>? detail)?
        success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Failure value) failure,
    required TResult Function(Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Failure value)? failure,
    TResult? Function(Success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Failure value)? failure,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlokStateCopyWith<$Res> {
  factory $SlokStateCopyWith(SlokState value, $Res Function(SlokState) then) =
      _$SlokStateCopyWithImpl<$Res, SlokState>;
}

/// @nodoc
class _$SlokStateCopyWithImpl<$Res, $Val extends SlokState>
    implements $SlokStateCopyWith<$Res> {
  _$SlokStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SlokStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'SlokState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String failedAppStateResponse) failure,
    required TResult Function(
            DataResponse<List<BhagavadGitaVerse>>? data,
            DataResponse<ChapterInfo>? chapterInfo,
            DataResponse<BhagavadGitaVerse>? detail)
        success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String failedAppStateResponse)? failure,
    TResult? Function(
            DataResponse<List<BhagavadGitaVerse>>? data,
            DataResponse<ChapterInfo>? chapterInfo,
            DataResponse<BhagavadGitaVerse>? detail)?
        success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String failedAppStateResponse)? failure,
    TResult Function(
            DataResponse<List<BhagavadGitaVerse>>? data,
            DataResponse<ChapterInfo>? chapterInfo,
            DataResponse<BhagavadGitaVerse>? detail)?
        success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Failure value) failure,
    required TResult Function(Success value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Failure value)? failure,
    TResult? Function(Success value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Failure value)? failure,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements SlokState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$SlokStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'SlokState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String failedAppStateResponse) failure,
    required TResult Function(
            DataResponse<List<BhagavadGitaVerse>>? data,
            DataResponse<ChapterInfo>? chapterInfo,
            DataResponse<BhagavadGitaVerse>? detail)
        success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String failedAppStateResponse)? failure,
    TResult? Function(
            DataResponse<List<BhagavadGitaVerse>>? data,
            DataResponse<ChapterInfo>? chapterInfo,
            DataResponse<BhagavadGitaVerse>? detail)?
        success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String failedAppStateResponse)? failure,
    TResult Function(
            DataResponse<List<BhagavadGitaVerse>>? data,
            DataResponse<ChapterInfo>? chapterInfo,
            DataResponse<BhagavadGitaVerse>? detail)?
        success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Failure value) failure,
    required TResult Function(Success value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Failure value)? failure,
    TResult? Function(Success value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Failure value)? failure,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements SlokState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String failedAppStateResponse});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$SlokStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedAppStateResponse = null,
  }) {
    return _then(_$FailureImpl(
      null == failedAppStateResponse
          ? _value.failedAppStateResponse
          : failedAppStateResponse // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailureImpl implements Failure {
  const _$FailureImpl(this.failedAppStateResponse);

  @override
  final String failedAppStateResponse;

  @override
  String toString() {
    return 'SlokState.failure(failedAppStateResponse: $failedAppStateResponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.failedAppStateResponse, failedAppStateResponse) ||
                other.failedAppStateResponse == failedAppStateResponse));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failedAppStateResponse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String failedAppStateResponse) failure,
    required TResult Function(
            DataResponse<List<BhagavadGitaVerse>>? data,
            DataResponse<ChapterInfo>? chapterInfo,
            DataResponse<BhagavadGitaVerse>? detail)
        success,
  }) {
    return failure(failedAppStateResponse);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String failedAppStateResponse)? failure,
    TResult? Function(
            DataResponse<List<BhagavadGitaVerse>>? data,
            DataResponse<ChapterInfo>? chapterInfo,
            DataResponse<BhagavadGitaVerse>? detail)?
        success,
  }) {
    return failure?.call(failedAppStateResponse);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String failedAppStateResponse)? failure,
    TResult Function(
            DataResponse<List<BhagavadGitaVerse>>? data,
            DataResponse<ChapterInfo>? chapterInfo,
            DataResponse<BhagavadGitaVerse>? detail)?
        success,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(failedAppStateResponse);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Failure value) failure,
    required TResult Function(Success value) success,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Failure value)? failure,
    TResult? Function(Success value)? success,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Failure value)? failure,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Failure implements SlokState {
  const factory Failure(final String failedAppStateResponse) = _$FailureImpl;

  String get failedAppStateResponse;
  @JsonKey(ignore: true)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {DataResponse<List<BhagavadGitaVerse>>? data,
      DataResponse<ChapterInfo>? chapterInfo,
      DataResponse<BhagavadGitaVerse>? detail});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$SlokStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? chapterInfo = freezed,
    Object? detail = freezed,
  }) {
    return _then(_$SuccessImpl(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DataResponse<List<BhagavadGitaVerse>>?,
      chapterInfo: freezed == chapterInfo
          ? _value.chapterInfo
          : chapterInfo // ignore: cast_nullable_to_non_nullable
              as DataResponse<ChapterInfo>?,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as DataResponse<BhagavadGitaVerse>?,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements Success {
  const _$SuccessImpl(
      {required this.data, required this.chapterInfo, required this.detail});

  @override
  final DataResponse<List<BhagavadGitaVerse>>? data;
  @override
  final DataResponse<ChapterInfo>? chapterInfo;
  @override
  final DataResponse<BhagavadGitaVerse>? detail;

  @override
  String toString() {
    return 'SlokState.success(data: $data, chapterInfo: $chapterInfo, detail: $detail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.chapterInfo, chapterInfo) ||
                other.chapterInfo == chapterInfo) &&
            (identical(other.detail, detail) || other.detail == detail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data, chapterInfo, detail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String failedAppStateResponse) failure,
    required TResult Function(
            DataResponse<List<BhagavadGitaVerse>>? data,
            DataResponse<ChapterInfo>? chapterInfo,
            DataResponse<BhagavadGitaVerse>? detail)
        success,
  }) {
    return success(data, chapterInfo, detail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String failedAppStateResponse)? failure,
    TResult? Function(
            DataResponse<List<BhagavadGitaVerse>>? data,
            DataResponse<ChapterInfo>? chapterInfo,
            DataResponse<BhagavadGitaVerse>? detail)?
        success,
  }) {
    return success?.call(data, chapterInfo, detail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String failedAppStateResponse)? failure,
    TResult Function(
            DataResponse<List<BhagavadGitaVerse>>? data,
            DataResponse<ChapterInfo>? chapterInfo,
            DataResponse<BhagavadGitaVerse>? detail)?
        success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data, chapterInfo, detail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Failure value) failure,
    required TResult Function(Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(Failure value)? failure,
    TResult? Function(Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Failure value)? failure,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements SlokState {
  const factory Success(
      {required final DataResponse<List<BhagavadGitaVerse>>? data,
      required final DataResponse<ChapterInfo>? chapterInfo,
      required final DataResponse<BhagavadGitaVerse>? detail}) = _$SuccessImpl;

  DataResponse<List<BhagavadGitaVerse>>? get data;
  DataResponse<ChapterInfo>? get chapterInfo;
  DataResponse<BhagavadGitaVerse>? get detail;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
