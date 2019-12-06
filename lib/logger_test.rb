require_relative 'reported_errors_logger'
logger = ReportedErrorsLogger.instance
logger.logInformation("This is the first information")
logger.logInformation("This is the second information")
