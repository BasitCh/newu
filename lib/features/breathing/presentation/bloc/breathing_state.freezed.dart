// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'breathing_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BreathingState {

 BreathingPhase get phase; BreathingSession get session; int get currentRound; int get secondsRemaining; bool get isDarkMode;
/// Create a copy of BreathingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BreathingStateCopyWith<BreathingState> get copyWith => _$BreathingStateCopyWithImpl<BreathingState>(this as BreathingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BreathingState&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.session, session) || other.session == session)&&(identical(other.currentRound, currentRound) || other.currentRound == currentRound)&&(identical(other.secondsRemaining, secondsRemaining) || other.secondsRemaining == secondsRemaining)&&(identical(other.isDarkMode, isDarkMode) || other.isDarkMode == isDarkMode));
}


@override
int get hashCode => Object.hash(runtimeType,phase,session,currentRound,secondsRemaining,isDarkMode);

@override
String toString() {
  return 'BreathingState(phase: $phase, session: $session, currentRound: $currentRound, secondsRemaining: $secondsRemaining, isDarkMode: $isDarkMode)';
}


}

/// @nodoc
abstract mixin class $BreathingStateCopyWith<$Res>  {
  factory $BreathingStateCopyWith(BreathingState value, $Res Function(BreathingState) _then) = _$BreathingStateCopyWithImpl;
@useResult
$Res call({
 BreathingPhase phase, BreathingSession session, int currentRound, int secondsRemaining, bool isDarkMode
});


$BreathingSessionCopyWith<$Res> get session;

}
/// @nodoc
class _$BreathingStateCopyWithImpl<$Res>
    implements $BreathingStateCopyWith<$Res> {
  _$BreathingStateCopyWithImpl(this._self, this._then);

  final BreathingState _self;
  final $Res Function(BreathingState) _then;

/// Create a copy of BreathingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phase = null,Object? session = null,Object? currentRound = null,Object? secondsRemaining = null,Object? isDarkMode = null,}) {
  return _then(_self.copyWith(
phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as BreathingPhase,session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as BreathingSession,currentRound: null == currentRound ? _self.currentRound : currentRound // ignore: cast_nullable_to_non_nullable
as int,secondsRemaining: null == secondsRemaining ? _self.secondsRemaining : secondsRemaining // ignore: cast_nullable_to_non_nullable
as int,isDarkMode: null == isDarkMode ? _self.isDarkMode : isDarkMode // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of BreathingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BreathingSessionCopyWith<$Res> get session {
  
  return $BreathingSessionCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}


/// Adds pattern-matching-related methods to [BreathingState].
extension BreathingStatePatterns on BreathingState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BreathingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BreathingState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BreathingState value)  $default,){
final _that = this;
switch (_that) {
case _BreathingState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BreathingState value)?  $default,){
final _that = this;
switch (_that) {
case _BreathingState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BreathingPhase phase,  BreathingSession session,  int currentRound,  int secondsRemaining,  bool isDarkMode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BreathingState() when $default != null:
return $default(_that.phase,_that.session,_that.currentRound,_that.secondsRemaining,_that.isDarkMode);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BreathingPhase phase,  BreathingSession session,  int currentRound,  int secondsRemaining,  bool isDarkMode)  $default,) {final _that = this;
switch (_that) {
case _BreathingState():
return $default(_that.phase,_that.session,_that.currentRound,_that.secondsRemaining,_that.isDarkMode);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BreathingPhase phase,  BreathingSession session,  int currentRound,  int secondsRemaining,  bool isDarkMode)?  $default,) {final _that = this;
switch (_that) {
case _BreathingState() when $default != null:
return $default(_that.phase,_that.session,_that.currentRound,_that.secondsRemaining,_that.isDarkMode);case _:
  return null;

}
}

}

/// @nodoc


class _BreathingState implements BreathingState {
  const _BreathingState({this.phase = BreathingPhase.setup, this.session = const BreathingSession(), this.currentRound = 0, this.secondsRemaining = 0, this.isDarkMode = false});
  

@override@JsonKey() final  BreathingPhase phase;
@override@JsonKey() final  BreathingSession session;
@override@JsonKey() final  int currentRound;
@override@JsonKey() final  int secondsRemaining;
@override@JsonKey() final  bool isDarkMode;

/// Create a copy of BreathingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BreathingStateCopyWith<_BreathingState> get copyWith => __$BreathingStateCopyWithImpl<_BreathingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BreathingState&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.session, session) || other.session == session)&&(identical(other.currentRound, currentRound) || other.currentRound == currentRound)&&(identical(other.secondsRemaining, secondsRemaining) || other.secondsRemaining == secondsRemaining)&&(identical(other.isDarkMode, isDarkMode) || other.isDarkMode == isDarkMode));
}


@override
int get hashCode => Object.hash(runtimeType,phase,session,currentRound,secondsRemaining,isDarkMode);

@override
String toString() {
  return 'BreathingState(phase: $phase, session: $session, currentRound: $currentRound, secondsRemaining: $secondsRemaining, isDarkMode: $isDarkMode)';
}


}

/// @nodoc
abstract mixin class _$BreathingStateCopyWith<$Res> implements $BreathingStateCopyWith<$Res> {
  factory _$BreathingStateCopyWith(_BreathingState value, $Res Function(_BreathingState) _then) = __$BreathingStateCopyWithImpl;
@override @useResult
$Res call({
 BreathingPhase phase, BreathingSession session, int currentRound, int secondsRemaining, bool isDarkMode
});


@override $BreathingSessionCopyWith<$Res> get session;

}
/// @nodoc
class __$BreathingStateCopyWithImpl<$Res>
    implements _$BreathingStateCopyWith<$Res> {
  __$BreathingStateCopyWithImpl(this._self, this._then);

  final _BreathingState _self;
  final $Res Function(_BreathingState) _then;

/// Create a copy of BreathingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phase = null,Object? session = null,Object? currentRound = null,Object? secondsRemaining = null,Object? isDarkMode = null,}) {
  return _then(_BreathingState(
phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as BreathingPhase,session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as BreathingSession,currentRound: null == currentRound ? _self.currentRound : currentRound // ignore: cast_nullable_to_non_nullable
as int,secondsRemaining: null == secondsRemaining ? _self.secondsRemaining : secondsRemaining // ignore: cast_nullable_to_non_nullable
as int,isDarkMode: null == isDarkMode ? _self.isDarkMode : isDarkMode // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of BreathingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BreathingSessionCopyWith<$Res> get session {
  
  return $BreathingSessionCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}

// dart format on
