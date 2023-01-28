import 'dart:async';

enum Action { task1, task2, task3 }

class NewBloc {
  
  final _stateStreamController = StreamController<List<Name>>();
  StreamSink<List<Name>> get _counterSink => _stateStreamController.sink;
  Stram<List<Name>> get counterStream => _stateStreamController.stream;
  
  final _eventStreamController = StreamController<Action>();
  StreamSink<Action> get eventSink => _eventStreamController.sink;
  Stream<Action> get _eventStream => _eventStreamController.stream;
  
}
