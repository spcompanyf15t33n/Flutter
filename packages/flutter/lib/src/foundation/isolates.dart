// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import '_isolates_io.dart'
  if (dart.library.js_util) '_isolates_web.dart' as isolates;

/// Signature for the callback passed to [compute].
///
/// {@macro flutter.foundation.compute.types}
///
/// Instances of [ComputeCallback] must be functions that can be sent to an
/// isolate.
/// {@macro flutter.foundation.compute.callback}
///
/// {@macro flutter.foundation.compute.types}
typedef ComputeCallback<M, R> = FutureOr<R> Function(M message);

/// Asynchronously runs the given [callback] - with the provided [message] -
/// in the background and completes with the result.
///
/// {@template flutter.foundation.compute.usecase}
/// This is useful for operations that take longer than a few milliseconds, and
/// which would therefore risk skipping frames. For tasks that will only take a
/// few milliseconds, consider [SchedulerBinding.scheduleTask] instead.
/// {@endtemplate}
///
/// {@youtube 560 315 https://www.youtube.com/watch?v=5AxWC49ZMzs}
///
/// {@tool snippet}
/// The following code uses the [compute] function to check whether a given
/// integer is a prime number.
///
/// ```dart
/// Future<bool> isPrime(int value) {
///   return compute(_calculate, value);
/// }
///
/// bool _calculate(int value) {
///   if (value == 1) {
///     return false;
///   }
///   for (int i = 2; i < value; ++i) {
///     if (value % i == 0) {
///       return false;
///     }
///   }
///   return true;
/// }
/// ```
/// {@end-tool}
///
/// On web platforms this will run [callback] on the current eventloop.
///
/// On native platforms this will run [callback] in a separate isolate. The 
/// provided [callback], the [message] given to it as well as the result have
/// to be objects that can be sent across isolates (as they may be transitively
/// copied if needed). The majority of objects can be sent across isolates.
///
/// See [SendPort.send] for more information about exceptions as well as a note
/// of warning when sending closures, which can capture more state than needed.
///
/// On native platforms `await compute(fun, message)` is equivalent to 
/// `await Isolate.run(() => fun(message))`. See also [Isolate.run].
Future<R> compute<M, R>(ComputeCallback<M, R> callback, M message, {String? debugLabel}) {
  return isolates.compute<M, R>(callback, message, debugLabel: debugLabel);
}
