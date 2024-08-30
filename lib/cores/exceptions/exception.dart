class ServerException implements Exception {
  final String message;

  ServerException({required this.message});
}

class InvalidUrlException implements Exception {
  final String message;

  InvalidUrlException({required this.message});
}

class UnkownException implements Exception {
  final String message;

  UnkownException({required this.message});
}

class CacheException implements Exception {
  final String message;

  CacheException({required this.message});
}

class LocationException implements Exception {
  final String message;

  LocationException({required this.message});
}
