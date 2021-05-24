abstract class FailureLogin implements Exception {}

class FailureLoginDatasource extends FailureLogin {}

class FailureUserAlreadyLogged extends FailureLogin {}
