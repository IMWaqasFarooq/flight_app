// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FlightState extends FlightState {
  @override
  final bool? isSuccess;
  @override
  final bool? isLoading;
  @override
  final String? error;
  @override
  final FlightModel? flightModel;

  factory _$FlightState([void Function(FlightStateBuilder)? updates]) =>
      (new FlightStateBuilder()..update(updates))._build();

  _$FlightState._(
      {this.isSuccess, this.isLoading, this.error, this.flightModel})
      : super._();

  @override
  FlightState rebuild(void Function(FlightStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FlightStateBuilder toBuilder() => new FlightStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FlightState &&
        isSuccess == other.isSuccess &&
        isLoading == other.isLoading &&
        error == other.error &&
        flightModel == other.flightModel;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isSuccess.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, flightModel.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FlightState')
          ..add('isSuccess', isSuccess)
          ..add('isLoading', isLoading)
          ..add('error', error)
          ..add('flightModel', flightModel))
        .toString();
  }
}

class FlightStateBuilder implements Builder<FlightState, FlightStateBuilder> {
  _$FlightState? _$v;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  FlightModel? _flightModel;
  FlightModel? get flightModel => _$this._flightModel;
  set flightModel(FlightModel? flightModel) =>
      _$this._flightModel = flightModel;

  FlightStateBuilder();

  FlightStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isSuccess = $v.isSuccess;
      _isLoading = $v.isLoading;
      _error = $v.error;
      _flightModel = $v.flightModel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FlightState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FlightState;
  }

  @override
  void update(void Function(FlightStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FlightState build() => _build();

  _$FlightState _build() {
    final _$result = _$v ??
        new _$FlightState._(
            isSuccess: isSuccess,
            isLoading: isLoading,
            error: error,
            flightModel: flightModel);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
