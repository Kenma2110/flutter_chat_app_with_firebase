import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocUtil {
  const BlocUtil._();

  /// Returns a bloc from context
  static B of<B extends BlocBase<Object?>>(BuildContext context) {
    return context.read<B>();
  }
}
