/// All 'shared_preferences' keywords
enum SPKeyword{
  // App keywords
  locale,
  theme,
  isFirstBootstrap,  /// Used app was downloaded first time or cache was cleaned
  isFirstSetup,   /// Used when app was completely suspended and re-opened

  // Firestore keywords
  category,
  hotel,

}