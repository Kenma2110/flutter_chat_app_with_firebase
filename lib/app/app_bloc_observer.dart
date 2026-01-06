import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (kDebugMode) {
      debugPrint('[BLOC EVENT] ${bloc.runtimeType} → $event');
    }
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      debugPrint(
        '[BLOC CHANGE] ${bloc.runtimeType}\n'
        '  current: ${change.currentState}\n'
        '  next: ${change.nextState}',
      );
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      debugPrint(
        '[BLOC ERROR] ${bloc.runtimeType}\n'
        '  error: $error\n'
        '  stackTrace: $stackTrace',
      );
    }
    super.onError(bloc, error, stackTrace);
  }
}
