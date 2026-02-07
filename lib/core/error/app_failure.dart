class AppFailure {
  final String message;
  final String? code;

  const AppFailure({required this.message, this.code});

  @override
  String toString() {
    return 'AppFailure(code: $code, message: $message)';
  }
}
