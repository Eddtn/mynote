//login exception
class UserNotFoundAuthException implements Exception {}

class WromgPasswordAuthException implements Exception {}

///regidter exception
class WeakPasswordAuthException implements Exception {}

class EmailAlreadyInUseAuthException implements Exception {}

class InvalidEmailAuthException implements Exception {}

///generic exception

class GenericAuthException implements Exception {}

class UserNotLoggedInAuthException implements Exception {}
