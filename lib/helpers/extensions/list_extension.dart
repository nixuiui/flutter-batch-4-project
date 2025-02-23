extension ListExtension on List {
  T? firstWhereOrNull<T>(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}