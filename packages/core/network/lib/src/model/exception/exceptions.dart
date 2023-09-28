abstract class BridgeException implements Exception {
  final String message;

  const BridgeException(this.message);

  @override
  String toString() => message;
}

class UnexpectedException extends BridgeException {
  const UnexpectedException(super.message);
}

class InternalServerException extends BridgeException {
  const InternalServerException(super.message);
}

class NoContentException extends BridgeException {
  const NoContentException(super.message);
}

class BadRequestException extends BridgeException {
  const BadRequestException(super.message);
}

class UnauthorizedException extends BridgeException {
  const UnauthorizedException(super.message);
}

class ForbiddenException extends BridgeException {
  const ForbiddenException(super.message);
}

class NotFoundException extends BridgeException {
  const NotFoundException(super.message);
}
