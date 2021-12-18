mixin BasicKit {
  getSafeConfig(value, defaultValue) {
    return value ?? defaultValue;
  }
}