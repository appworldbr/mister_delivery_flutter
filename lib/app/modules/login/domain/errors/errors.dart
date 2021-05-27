abstract class FailureLogin implements Exception {}

class FailureLoginDatasource extends FailureLogin {}

class FailureSessionStore extends FailureLogin {}
