enum State { initial, loading, success, error }

abstract class BaseState<T> {
  final State state;
  final T? data;
  final String? errorMessage;
  BaseState({this.state = State.initial, this.data, this.errorMessage});
}
