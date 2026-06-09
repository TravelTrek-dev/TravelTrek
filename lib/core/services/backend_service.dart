class BackendService {
  static const String singupUrl =
      'http://traveltrek.runasp.net/api/auth/register';
  static const String signinUrl = 'http://traveltrek.runasp.net/api/auth/login';
  static const String forgotPasswordUrl =
      'http://traveltrek.runasp.net/api/auth/forgot-password';

  static const String refreshTokenUrl =
      'http://traveltrek.runasp.net/api/auth/refresh-token';
  static const String revokeTokenUrl =
      'http://traveltrek.runasp.net/api/auth/revoke-token';
  static const String revokeAllTokensUrl =
      'http://traveltrek.runasp.net/api/auth/revoke-all';

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

  static const String getAllPlans = 'http://traveltrek.runasp.net/api/trip-plan?';    
  static const String deletePlanUrl = 'http://traveltrek.runasp.net/api/trip-plan/';
}