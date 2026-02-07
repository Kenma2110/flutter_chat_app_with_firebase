import 'package:fpdart/fpdart.dart';

import '../error/app_failure.dart';

typedef Result<T> = Either<AppFailure, T>;
