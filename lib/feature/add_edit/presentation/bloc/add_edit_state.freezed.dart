// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_edit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddEditState {
  ExpenseWithCategoryModel? get data => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get isFormValid => throw _privateConstructorUsedError;
  BaseStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddEditStateCopyWith<AddEditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddEditStateCopyWith<$Res> {
  factory $AddEditStateCopyWith(
          AddEditState value, $Res Function(AddEditState) then) =
      _$AddEditStateCopyWithImpl<$Res, AddEditState>;
  @useResult
  $Res call(
      {ExpenseWithCategoryModel? data,
      String message,
      bool isFormValid,
      BaseStatus status});
}

/// @nodoc
class _$AddEditStateCopyWithImpl<$Res, $Val extends AddEditState>
    implements $AddEditStateCopyWith<$Res> {
  _$AddEditStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? message = null,
    Object? isFormValid = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ExpenseWithCategoryModel?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isFormValid: null == isFormValid
          ? _value.isFormValid
          : isFormValid // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddEditStateImplCopyWith<$Res>
    implements $AddEditStateCopyWith<$Res> {
  factory _$$AddEditStateImplCopyWith(
          _$AddEditStateImpl value, $Res Function(_$AddEditStateImpl) then) =
      __$$AddEditStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ExpenseWithCategoryModel? data,
      String message,
      bool isFormValid,
      BaseStatus status});
}

/// @nodoc
class __$$AddEditStateImplCopyWithImpl<$Res>
    extends _$AddEditStateCopyWithImpl<$Res, _$AddEditStateImpl>
    implements _$$AddEditStateImplCopyWith<$Res> {
  __$$AddEditStateImplCopyWithImpl(
      _$AddEditStateImpl _value, $Res Function(_$AddEditStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? message = null,
    Object? isFormValid = null,
    Object? status = null,
  }) {
    return _then(_$AddEditStateImpl(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ExpenseWithCategoryModel?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isFormValid: null == isFormValid
          ? _value.isFormValid
          : isFormValid // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus,
    ));
  }
}

/// @nodoc

class _$AddEditStateImpl with DiagnosticableTreeMixin implements _AddEditState {
  const _$AddEditStateImpl(
      {this.data = null,
      this.message = "",
      this.isFormValid = false,
      this.status = BaseStatus.initial});

  @override
  @JsonKey()
  final ExpenseWithCategoryModel? data;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final bool isFormValid;
  @override
  @JsonKey()
  final BaseStatus status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddEditState(data: $data, message: $message, isFormValid: $isFormValid, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AddEditState'))
      ..add(DiagnosticsProperty('data', data))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('isFormValid', isFormValid))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddEditStateImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isFormValid, isFormValid) ||
                other.isFormValid == isFormValid) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, data, message, isFormValid, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddEditStateImplCopyWith<_$AddEditStateImpl> get copyWith =>
      __$$AddEditStateImplCopyWithImpl<_$AddEditStateImpl>(this, _$identity);
}

abstract class _AddEditState implements AddEditState {
  const factory _AddEditState(
      {final ExpenseWithCategoryModel? data,
      final String message,
      final bool isFormValid,
      final BaseStatus status}) = _$AddEditStateImpl;

  @override
  ExpenseWithCategoryModel? get data;
  @override
  String get message;
  @override
  bool get isFormValid;
  @override
  BaseStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$AddEditStateImplCopyWith<_$AddEditStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
