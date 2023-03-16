extension NullableStringExtensions on String? {
  String orEmpty() => this ?? '';
}
