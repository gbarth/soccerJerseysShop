class AuthException implements Exception {
  static const Map<String, String> errors = {
    'EMAIL_EXISTS': 'Email already exists',
    'OPERATION_NOT_ALLOWED': 'Operation not allowed',
    'TOO_MANY_ATTEMPTS_TRY_LATER': 'Too many login attempts. Try again later',
    'EMAIL_NOT_FOUND': 'Email not found',
    'INVALID_PASSWORD': 'Invalid Password',
    'USER_DISABLED': 'User is disabled',
  };

  final String key;

  AuthException(this.key);

  @override
  String toString() {
    return errors[key] ?? 'An unexpected error occurred';
  }
}
