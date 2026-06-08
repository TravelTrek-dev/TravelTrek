class BackendService {
  static const String singupUrl =
      'http://traveltrek.runasp.net/api/auth/register';
  static const String signinUrl = 'http://traveltrek.runasp.net/api/auth/login';

  static const String addExpenseUrl =
      'http://traveltrek.runasp.net/api/trip-plan/expense/';

  static const String getExpenseHistoryUrl =
      'http://traveltrek.runasp.net/api/trip-plan/expense/';
  static const String generatePlanUrl =
      'http://traveltrek.runasp.net/api/trip-plan/generate?';

  static const String getPromptsUrl =
      'http://traveltrek.runasp.net/api/trip-plan/prompts?';

  static const String savePlanUrl =
      'http://traveltrek.runasp.net/api/trip-plan/save-created?';
}

