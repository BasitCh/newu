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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Started value)?  started,TResult Function( SettingsChanged value)?  settingsChanged,TResult Function( ThemeToggled value)?  themeToggled,TResult Function( StartExercise value)?  startExercise,TResult Function( Tick value)?  tick,TResult Function( Pause value)?  pause,TResult Function( Resume value)?  resume,TResult Function( Reset value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Started() when started != null:
return started(_that);case SettingsChanged() when settingsChanged != null:
return settingsChanged(_that);case ThemeToggled() when themeToggled != null:
return themeToggled(_that);case StartExercise() when startExercise != null:
return startExercise(_that);case Tick() when tick != null:
return tick(_that);case Pause() when pause != null:
return pause(_that);case Resume() when resume != null:
return resume(_that);case Reset() when reset != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Started value)  started,required TResult Function( SettingsChanged value)  settingsChanged,required TResult Function( ThemeToggled value)  themeToggled,required TResult Function( StartExercise value)  startExercise,required TResult Function( Tick value)  tick,required TResult Function( Pause value)  pause,required TResult Function( Resume value)  resume,required TResult Function( Reset value)  reset,}){
final _that = this;
switch (_that) {
case Started():
return started(_that);case SettingsChanged():
return settingsChanged(_that);case ThemeToggled():
return themeToggled(_that);case StartExercise():
return startExercise(_that);case Tick():
return tick(_that);case Pause():
return pause(_that);case Resume():
return resume(_that);case Reset():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Started value)?  started,TResult? Function( SettingsChanged value)?  settingsChanged,TResult? Function( ThemeToggled value)?  themeToggled,TResult? Function( StartExercise value)?  startExercise,TResult? Function( Tick value)?  tick,TResult? Function( Pause value)?  pause,TResult? Function( Resume value)?  resume,TResult? Function( Reset value)?  reset,}){
final _that = this;
switch (_that) {
case Started() when started != null:
return started(_that);case SettingsChanged() when settingsChanged != null:
return settingsChanged(_that);case ThemeToggled() when themeToggled != null:
return themeToggled(_that);case StartExercise() when startExercise != null:
return startExercise(_that);case Tick() when tick != null:
return tick(_that);case Pause() when pause != null:
return pause(_that);case Resume() when resume != null:
return resume(_that);case Reset() when reset != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( BreathingSession session)?  settingsChanged,TResult Function()?  themeToggled,TResult Function()?  startExercise,TResult Function()?  tick,TResult Function()?  pause,TResult Function()?  resume,TResult Function()?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Started() when started != null:
return started();case SettingsChanged() when settingsChanged != null:
return settingsChanged(_that.session);case ThemeToggled() when themeToggled != null:
return themeToggled();case StartExercise() when startExercise != null:
return startExercise();case Tick() when tick != null:
return tick();case Pause() when pause != null:
return pause();case Resume() when resume != null:
return resume();case Reset() when reset != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( BreathingSession session)  settingsChanged,required TResult Function()  themeToggled,required TResult Function()  startExercise,required TResult Function()  tick,required TResult Function()  pause,required TResult Function()  resume,required TResult Function()  reset,}) {final _that = this;
switch (_that) {
case Started():
return started();case SettingsChanged():
return settingsChanged(_that.session);case ThemeToggled():
return themeToggled();case StartExercise():
return startExercise();case Tick():
return tick();case Pause():
return pause();case Resume():
return resume();case Reset():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( BreathingSession session)?  settingsChanged,TResult? Function()?  themeToggled,TResult? Function()?  startExercise,TResult? Function()?  tick,TResult? Function()?  pause,TResult? Function()?  resume,TResult? Function()?  reset,}) {final _that = this;
switch (_that) {
case Started() when started != null:
return started();case SettingsChanged() when settingsChanged != null:
return settingsChanged(_that.session);case ThemeToggled() when themeToggled != null:
return themeToggled();case StartExercise() when startExercise != null:
return startExercise();case Tick() when tick != null:
return tick();case Pause() when pause != null:
return pause();case Resume() when resume != null:
return resume();case Reset() when reset != null:
return reset();case _:
  return null;

}
}

}

/// @nodoc


class Started implements BreathingEvent {
  const Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BreathingEvent.started()';
}


}




/// @nodoc


class SettingsChanged implements BreathingEvent {
  const SettingsChanged(this.session);
  

 final  BreathingSession session;

/// Create a copy of BreathingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsChangedCopyWith<SettingsChanged> get copyWith => _$SettingsChangedCopyWithImpl<SettingsChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsChanged&&(identical(other.session, session) || other.session == session));
}


@override
int get hashCode => Object.hash(runtimeType,session);

@override
String toString() {
  return 'BreathingEvent.settingsChanged(session: $session)';
}


}

/// @nodoc
abstract mixin class $SettingsChangedCopyWith<$Res> implements $BreathingEventCopyWith<$Res> {
  factory $SettingsChangedCopyWith(SettingsChanged value, $Res Function(SettingsChanged) _then) = _$SettingsChangedCopyWithImpl;
@useResult
$Res call({
 BreathingSession session
});


$BreathingSessionCopyWith<$Res> get session;

}
/// @nodoc
class _$SettingsChangedCopyWithImpl<$Res>
    implements $SettingsChangedCopyWith<$Res> {
  _$SettingsChangedCopyWithImpl(this._self, this._then);

  final SettingsChanged _self;
  final $Res Function(SettingsChanged) _then;

/// Create a copy of BreathingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? session = null,}) {
  return _then(SettingsChanged(
null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as BreathingSession,
  ));
}

/// Create a copy of BreathingEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BreathingSessionCopyWith<$Res> get session {
  
  return $BreathingSessionCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}

/// @nodoc


class ThemeToggled implements BreathingEvent {
  const ThemeToggled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemeToggled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BreathingEvent.themeToggled()';
}


}




/// @nodoc


class StartExercise implements BreathingEvent {
  const StartExercise();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StartExercise);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BreathingEvent.startExercise()';
}


}




/// @nodoc


class Tick implements BreathingEvent {
  const Tick();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Tick);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BreathingEvent.tick()';
}


}




/// @nodoc


class Pause implements BreathingEvent {
  const Pause();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Pause);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BreathingEvent.pause()';
}


}




/// @nodoc


class Resume implements BreathingEvent {
  const Resume();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Resume);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BreathingEvent.resume()';
}


}




/// @nodoc


class Reset implements BreathingEvent {
  const Reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BreathingEvent.reset()';
}


}




// dart format on
