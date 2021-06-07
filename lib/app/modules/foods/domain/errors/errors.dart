abstract class FailureFood implements Exception {}

class FailureLoginRequired implements FailureFood {}

class FailureFoodSearch implements FailureFood {}

class FailureFoodDatasource implements FailureFood {}

class FailureFoodIdIncorrect implements FailureFood {}

class FailureFoodNotFound implements FailureFood {}

class FailureFoodNotActive implements FailureFood {}

class FailureExtraNotFound implements FailureFood {}

class FailureExtraLimitReached implements FailureFood {}

class FailureAddFoodToCart implements FailureFood {}
