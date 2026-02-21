// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'breathing_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BreathingEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BreathingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BreathingEvent()';
}


}

/// @nodoc
class $BreathingEventCopyWith<$Res>  {
$BreathingEventCopyWith(BreathingEvent _, $Res Function(BreathingEvent) __);
}


/// Adds pattern-matching-related methods to [BreathingEvent].
extension BreathingEventPatterns on BreathingEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _SettingsChanged value)?  settingsChanged,TResult Function( _ThemeToggled value)?  themeToggled,TResult Function( _StartExercise value)?  startExercise,TResult Function( _Tick value)?  tick,TResult Function( _Reset value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _SettingsChanged() when settingsChanged != null:
return settingsChanged(_that);case _ThemeToggled() when themeToggled != null:
return themeToggled(_that);case _StartExercise() when startExercise != null:
return startExercise(_that);case _Tick() when tick != null:
return tick(_that);case _Reset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _SettingsChanged value)  settingsChanged,required TResult Function( _ThemeToggled value)  themeToggled,required TResult Function( _StartExercise value)  startExercise,required TResult Function( _Tick value)  tick,required TResult Function( _Reset value)  reset,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _SettingsChanged():
return settingsChanged(_that);case _ThemeToggled():
return themeToggled(_that);case _StartExercise():
return startExercise(_that);case _Tick():
return tick(_that);case _Reset():
return reset(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _SettingsChanged value)?  settingsChanged,TResult? Function( _ThemeToggled value)?  themeToggled,TResult? Function( _StartExercise value)?  startExercise,TResult? Function( _Tick value)?  tick,TResult? Function( _Reset value)?  reset,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _SettingsChanged() when settingsChanged != null:
return settingsChanged(_that);case _ThemeToggled() when themeToggled != null:
return themeToggled(_that);case _StartExercise() when startExercise != null:
return startExercise(_that);case _Tick() when tick != null:
return tick(_that);case _Reset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( BreathingSession session)?  settingsChanged,TResult Function()?  themeToggled,TResult Function()?  startExercise,TResult Function()?  tick,TResult Function()?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _SettingsChanged() when settingsChanged != null:
return settingsChanged(_that.session);case _ThemeToggled() when themeToggled != null:
return themeToggled();case _StartExercise() when startExercise != null:
return startExercise();case _Tick() when tick != null:
return tick();case _Reset() when reset != null:
return reset();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( BreathingSession session)  settingsChanged,required TResult Function()  themeToggled,required TResult Function()  startExercise,required TResult Function()  tick,required TResult Function()  reset,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _SettingsChanged():
return settingsChanged(_that.session);case _ThemeToggled():
return themeToggled();case _StartExercise():
return startExercise();case _Tick():
return tick();case _Reset():
return reset();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( BreathingSession session)?  settingsChanged,TResult? Function()?  themeToggled,TResult? Function()?  startExercise,TResult? Function()?  tick,TResult? Function()?  reset,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _SettingsChanged() when settingsChanged != null:
return settingsChanged(_that.session);case _ThemeToggled() when themeToggled != null:
return themeToggled();case _StartExercise() when startExercise != null:
return startExercise();case _Tick() when tick != null:
return tick();case _Reset() when reset != null:
return reset();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements BreathingEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BreathingEvent.started()';
}


}




/// @nodoc


class _SettingsChanged implements BreathingEvent {
  const _SettingsChanged(this.session);
  

 final  BreathingSession session;

/// Create a copy of BreathingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingsChangedCopyWith<_SettingsChanged> get copyWith => __$SettingsChangedCopyWithImpl<_SettingsChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingsChanged&&const DeepCollectionEquality().equals(other.session, session));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(session));

@override
String toString() {
  return 'BreathingEvent.settingsChanged(session: $session)';
}


}

/// @nodoc
abstract mixin class _$SettingsChangedCopyWith<$Res> implements $BreathingEventCopyWith<$Res> {
  factory _$SettingsChangedCopyWith(_SettingsChanged value, $Res Function(_SettingsChanged) _then) = __$SettingsChangedCopyWithImpl;
@useResult
$Res call({
 BreathingSession session
});




}
/// @nodoc
class __$SettingsChangedCopyWithImpl<$Res>
    implements _$SettingsChangedCopyWith<$Res> {
  __$SettingsChangedCopyWithImpl(this._self, this._then);

  final _SettingsChanged _self;
  final $Res Function(_SettingsChanged) _then;

/// Create a copy of BreathingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? session = freezed,}) {
  return _then(_SettingsChanged(
freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as BreathingSession,
  ));
}


}

/// @nodoc


class _ThemeToggled implements BreathingEvent {
  const _ThemeToggled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThemeToggled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BreathingEvent.themeToggled()';
}


}




/// @nodoc


class _StartExercise implements BreathingEvent {
  const _StartExercise();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartExercise);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BreathingEvent.startExercise()';
}


}




/// @nodoc


class _Tick implements BreathingEvent {
  const _Tick();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Tick);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BreathingEvent.tick()';
}


}




/// @nodoc


class _Reset implements BreathingEvent {
  const _Reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BreathingEvent.reset()';
}


}




// dart format on
