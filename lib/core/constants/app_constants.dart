class AppConstants {
  // API Configuration
  static const String baseUrl = 'https://buku.jagoflutter.com/api';
  static const String apiVersion = 'v1';

  // App Configuration
  static const String appName = 'Buku Bisnis App';
  static const String appVersion = '1.0.0';

  // Local Storage Keys
  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userDataKey = 'user_data';
  static const String themeKey = 'theme_mode';

  // API Endpoints
  static const String loginEndpoint = '/auth/login';
  static const String registerEndpoint = '/auth/register';
  static const String logoutEndpoint = '/auth/logout';
  static const String refreshTokenEndpoint = '/auth/refresh';
  static const String userProfileEndpoint = '/user/profile';

  // Bookkeeping Endpoints
  static const String transactionsEndpoint = '/transactions';
  static const String accountsEndpoint = '/accounts';
  static const String categoriesEndpoint = '/categories';
  static const String reportsEndpoint = '/reports';
  static const String dashboardEndpoint = '/dashboard';

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // Time Formats
  static const String dateFormat = 'dd/MM/yyyy';
  static const String dateTimeFormat = 'dd/MM/yyyy HH:mm';
  static const String timeFormat = 'HH:mm';

  // Validation
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 50;
  static const int maxNameLength = 100;
}
