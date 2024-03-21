abstract class Results<T> {
  final T value;

  Results({required this.value});
}

//Loading class for loading state
class Loading extends Results {
  Loading({required super.value});
}

//Success state
class Success extends Results {
  Success({required super.value});
}

//Failed state
class Failed extends Results {
  Failed({required super.value});
}
