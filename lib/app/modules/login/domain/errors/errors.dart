abstract class FailureLogin implements Exception {}

class FailureLoginDatasource extends FailureLogin {}

class FailureLoginCredentials extends FailureLogin {}
