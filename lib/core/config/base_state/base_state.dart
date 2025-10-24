enum StateType { initial, loading, success, error }

abstract class BaseState<T> {
  final StateType state;
  final T? data;
  final Exception? exception;
  BaseState({this.state = StateType.initial, this.data, this.exception});
}
