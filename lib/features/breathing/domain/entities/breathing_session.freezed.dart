// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'breathing_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BreathingSession {

 int get inhaleDuration; int get holdInDuration; int get exhaleDuration; int get holdOutDuration; int get rounds; bool get soundEnabled;
/// Create a copy of BreathingSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BreathingSessionCopyWith<BreathingSession> get copyWith => _$BreathingSessionCopyWithImpl<BreathingSession>(this as BreathingSession, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BreathingSession&&(identical(other.inhaleDuration, inhaleDuration) || other.inhaleDuration == inhaleDuration)&&(identical(other.holdInDuration, holdInDuration) || other.holdInDuration == holdInDuration)&&(identical(other.exhaleDuration, exhaleDuration) || other.exhaleDuration == exhaleDuration)&&(identical(other.holdOutDuration, holdOutDuration) || other.holdOutDuration == holdOutDuration)&&(identical(other.rounds, rounds) || other.rounds == rounds)&&(identical(other.soundEnabled, soundEnabled) || other.soundEnabled == soundEnabled));
}


@override
int get hashCode => Object.hash(runtimeType,inhaleDuration,holdInDuration,exhaleDuration,holdOutDuration,rounds,soundEnabled);

@override
String toString() {
  return 'BreathingSession(inhaleDuration: $inhaleDuration, holdInDuration: $holdInDuration, exhaleDuration: $exhaleDuration, holdOutDuration: $holdOutDuration, rounds: $rounds, soundEnabled: $soundEnabled)';
}


}

/// @nodoc
abstract mixin class $BreathingSessionCopyWith<$Res>  {
  factory $BreathingSessionCopyWith(BreathingSession value, $Res Function(BreathingSession) _then) = _$BreathingSessionCopyWithImpl;
@useResult
$Res call({
 int inhaleDuration, int holdInDuration, int exhaleDuration, int holdOutDuration, int rounds, bool soundEnabled
});




}
/// @nodoc
class _$BreathingSessionCopyWithImpl<$Res>
    implements $BreathingSessionCopyWith<$Res> {
  _$BreathingSessionCopyWithImpl(this._self, this._then);

  final BreathingSession _self;
  final $Res Function(BreathingSession) _then;

/// Create a copy of BreathingSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? inhaleDuration = null,Object? holdInDuration = null,Object? exhaleDuration = null,Object? holdOutDuration = null,Object? rounds = null,Object? soundEnabled = null,}) {
  return _then(_self.copyWith(
inhaleDuration: null == inhaleDuration ? _self.inhaleDuration : inhaleDuration // ignore: cast_nullable_to_non_nullable
as int,holdInDuration: null == holdInDuration ? _self.holdInDuration : holdInDuration // ignore: cast_nullable_to_non_nullable
as int,exhaleDuration: null == exhaleDuration ? _self.exhaleDuration : exhaleDuration // ignore: cast_nullable_to_non_nullable
as int,holdOutDuration: null == holdOutDuration ? _self.holdOutDuration : holdOutDuration // ignore: cast_nullable_to_non_nullable
as int,rounds: null == rounds ? _self.rounds : rounds // ignore: cast_nullable_to_non_nullable
as int,soundEnabled: null == soundEnabled ? _self.soundEnabled : soundEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [BreathingSession].
extension BreathingSessionPatterns on BreathingSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BreathingSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BreathingSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BreathingSession value)  $default,){
final _that = this;
switch (_that) {
case _BreathingSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BreathingSession value)?  $default,){
final _that = this;
switch (_that) {
case _BreathingSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int inhaleDuration,  int holdInDuration,  int exhaleDuration,  int holdOutDuration,  int rounds,  bool soundEnabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BreathingSession() when $default != null:
return $default(_that.inhaleDuration,_that.holdInDuration,_that.exhaleDuration,_that.holdOutDuration,_that.rounds,_that.soundEnabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int inhaleDuration,  int holdInDuration,  int exhaleDuration,  int holdOutDuration,  int rounds,  bool soundEnabled)  $default,) {final _that = this;
switch (_that) {
case _BreathingSession():
return $default(_that.inhaleDuration,_that.holdInDuration,_that.exhaleDuration,_that.holdOutDuration,_that.rounds,_that.soundEnabled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int inhaleDuration,  int holdInDuration,  int exhaleDuration,  int holdOutDuration,  int rounds,  bool soundEnabled)?  $default,) {final _that = this;
switch (_that) {
case _BreathingSession() when $default != null:
return $default(_that.inhaleDuration,_that.holdInDuration,_that.exhaleDuration,_that.holdOutDuration,_that.rounds,_that.soundEnabled);case _:
  return null;

}
}

}

/// @nodoc


class _BreathingSession implements BreathingSession {
  const _BreathingSession({this.inhaleDuration = 4, this.holdInDuration = 0, this.exhaleDuration = 4, this.holdOutDuration = 0, this.rounds = 4, this.soundEnabled = false});
  

@override@JsonKey() final  int inhaleDuration;
@override@JsonKey() final  int holdInDuration;
@override@JsonKey() final  int exhaleDuration;
@override@JsonKey() final  int holdOutDuration;
@override@JsonKey() final  int rounds;
@override@JsonKey() final  bool soundEnabled;

/// Create a copy of BreathingSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BreathingSessionCopyWith<_BreathingSession> get copyWith => __$BreathingSessionCopyWithImpl<_BreathingSession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BreathingSession&&(identical(other.inhaleDuration, inhaleDuration) || other.inhaleDuration == inhaleDuration)&&(identical(other.holdInDuration, holdInDuration) || other.holdInDuration == holdInDuration)&&(identical(other.exhaleDuration, exhaleDuration) || other.exhaleDuration == exhaleDuration)&&(identical(other.holdOutDuration, holdOutDuration) || other.holdOutDuration == holdOutDuration)&&(identical(other.rounds, rounds) || other.rounds == rounds)&&(identical(other.soundEnabled, soundEnabled) || other.soundEnabled == soundEnabled));
}


@override
int get hashCode => Object.hash(runtimeType,inhaleDuration,holdInDuration,exhaleDuration,holdOutDuration,rounds,soundEnabled);

@override
String toString() {
  return 'BreathingSession(inhaleDuration: $inhaleDuration, holdInDuration: $holdInDuration, exhaleDuration: $exhaleDuration, holdOutDuration: $holdOutDuration, rounds: $rounds, soundEnabled: $soundEnabled)';
}


}

/// @nodoc
abstract mixin class _$BreathingSessionCopyWith<$Res> implements $BreathingSessionCopyWith<$Res> {
  factory _$BreathingSessionCopyWith(_BreathingSession value, $Res Function(_BreathingSession) _then) = __$BreathingSessionCopyWithImpl;
@override @useResult
$Res call({
 int inhaleDuration, int holdInDuration, int exhaleDuration, int holdOutDuration, int rounds, bool soundEnabled
});




}
/// @nodoc
class __$BreathingSessionCopyWithImpl<$Res>
    implements _$BreathingSessionCopyWith<$Res> {
  __$BreathingSessionCopyWithImpl(this._self, this._then);

  final _BreathingSession _self;
  final $Res Function(_BreathingSession) _then;

/// Create a copy of BreathingSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? inhaleDuration = null,Object? holdInDuration = null,Object? exhaleDuration = null,Object? holdOutDuration = null,Object? rounds = null,Object? soundEnabled = null,}) {
  return _then(_BreathingSession(
inhaleDuration: null == inhaleDuration ? _self.inhaleDuration : inhaleDuration // ignore: cast_nullable_to_non_nullable
as int,holdInDuration: null == holdInDuration ? _self.holdInDuration : holdInDuration // ignore: cast_nullable_to_non_nullable
as int,exhaleDuration: null == exhaleDuration ? _self.exhaleDuration : exhaleDuration // ignore: cast_nullable_to_non_nullable
as int,holdOutDuration: null == holdOutDuration ? _self.holdOutDuration : holdOutDuration // ignore: cast_nullable_to_non_nullable
as int,rounds: null == rounds ? _self.rounds : rounds // ignore: cast_nullable_to_non_nullable
as int,soundEnabled: null == soundEnabled ? _self.soundEnabled : soundEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
