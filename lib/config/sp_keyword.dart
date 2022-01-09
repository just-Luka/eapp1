/// All 'shared_preferences' keywords
enum SPKeyword{
  // App keywords
  locale,
  theme,
  /// Used app was downloaded first time or cache was cleaned
  isFirstBootstrap,
  /// Used when app was completely suspended and re-opened
  isFirstSetup,

  // Firestore keywords
  category,
  hotel,

}