// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SignupState extends SignupState {
  @override
  final bool? isSuccess;
  @override
  final bool? isLoading;
  @override
  final String? error;
  @override
  final SignupModel? signupModel;
  @override
  final bool? otpSuccess;
  @override
  final bool? otpError;

  factory _$SignupState([void Function(SignupStateBuilder)? updates]) =>
      (new SignupStateBuilder()..update(updates))._build();

  _$SignupState._(
      {this.isSuccess,
      this.isLoading,
      this.error,
      this.signupModel,
      this.otpSuccess,
      this.otpError})
      : super._();

  @override
  SignupState rebuild(void Function(SignupStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignupStateBuilder toBuilder() => new SignupStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignupState &&
        isSuccess == other.isSuccess &&
        isLoading == other.isLoading &&
        error == other.error &&
        signupModel == other.signupModel &&
        otpSuccess == other.otpSuccess &&
        otpError == other.otpError;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isSuccess.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, signupModel.hashCode);
    _$hash = $jc(_$hash, otpSuccess.hashCode);
    _$hash = $jc(_$hash, otpError.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SignupState')
          ..add('isSuccess', isSuccess)
          ..add('isLoading', isLoading)
          ..add('error', error)
          ..add('signupModel', signupModel)
          ..add('otpSuccess', otpSuccess)
          ..add('otpError', otpError))
        .toString();
  }
}

class SignupStateBuilder implements Builder<SignupState, SignupStateBuilder> {
  _$SignupState? _$v;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  SignupModel? _signupModel;
  SignupModel? get signupModel => _$this._signupModel;
  set signupModel(SignupModel? signupModel) =>
      _$this._signupModel = signupModel;

  bool? _otpSuccess;
  bool? get otpSuccess => _$this._otpSuccess;
  set otpSuccess(bool? otpSuccess) => _$this._otpSuccess = otpSuccess;

  bool? _otpError;
  bool? get otpError => _$this._otpError;
  set otpError(bool? otpError) => _$this._otpError = otpError;

  SignupStateBuilder();

  SignupStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isSuccess = $v.isSuccess;
      _isLoading = $v.isLoading;
      _error = $v.error;
      _signupModel = $v.signupModel;
      _otpSuccess = $v.otpSuccess;
      _otpError = $v.otpError;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignupState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SignupState;
  }

  @override
  void update(void Function(SignupStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SignupState build() => _build();

  _$SignupState _build() {
    final _$result = _$v ??
        new _$SignupState._(
            isSuccess: isSuccess,
            isLoading: isLoading,
            error: error,
            signupModel: signupModel,
            otpSuccess: otpSuccess,
            otpError: otpError);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
