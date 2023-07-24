// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LoginState extends LoginState {
  @override
  final bool? isSuccess;
  @override
  final bool? isLoading;
  @override
  final String? error;
  @override
  final LoginModel? loginModel;
  @override
  final bool? otpSuccess;
  @override
  final bool? otpError;

  factory _$LoginState([void Function(LoginStateBuilder)? updates]) =>
      (new LoginStateBuilder()..update(updates))._build();

  _$LoginState._(
      {this.isSuccess,
      this.isLoading,
      this.error,
      this.loginModel,
      this.otpSuccess,
      this.otpError})
      : super._();

  @override
  LoginState rebuild(void Function(LoginStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginStateBuilder toBuilder() => new LoginStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginState &&
        isSuccess == other.isSuccess &&
        isLoading == other.isLoading &&
        error == other.error &&
        loginModel == other.loginModel &&
        otpSuccess == other.otpSuccess &&
        otpError == other.otpError;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isSuccess.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, loginModel.hashCode);
    _$hash = $jc(_$hash, otpSuccess.hashCode);
    _$hash = $jc(_$hash, otpError.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LoginState')
          ..add('isSuccess', isSuccess)
          ..add('isLoading', isLoading)
          ..add('error', error)
          ..add('loginModel', loginModel)
          ..add('otpSuccess', otpSuccess)
          ..add('otpError', otpError))
        .toString();
  }
}

class LoginStateBuilder implements Builder<LoginState, LoginStateBuilder> {
  _$LoginState? _$v;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  LoginModel? _loginModel;
  LoginModel? get loginModel => _$this._loginModel;
  set loginModel(LoginModel? loginModel) => _$this._loginModel = loginModel;

  bool? _otpSuccess;
  bool? get otpSuccess => _$this._otpSuccess;
  set otpSuccess(bool? otpSuccess) => _$this._otpSuccess = otpSuccess;

  bool? _otpError;
  bool? get otpError => _$this._otpError;
  set otpError(bool? otpError) => _$this._otpError = otpError;

  LoginStateBuilder();

  LoginStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isSuccess = $v.isSuccess;
      _isLoading = $v.isLoading;
      _error = $v.error;
      _loginModel = $v.loginModel;
      _otpSuccess = $v.otpSuccess;
      _otpError = $v.otpError;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LoginState;
  }

  @override
  void update(void Function(LoginStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LoginState build() => _build();

  _$LoginState _build() {
    final _$result = _$v ??
        new _$LoginState._(
            isSuccess: isSuccess,
            isLoading: isLoading,
            error: error,
            loginModel: loginModel,
            otpSuccess: otpSuccess,
            otpError: otpError);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
