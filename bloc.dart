import 'dart:async';

enum Action { task1, task2, task3 }

class NewBloc {
  
  final _stateStreamController = StreamController<List<Name>>();
  StreamSink<List<Name>> get _sink => _stateStreamController.sink;
  Stram<List<Name>> get stream => _stateStreamController.stream;
  
  final _eventStreamController = StreamController<Action>();
  StreamSink<Action> get eventSink => _eventStreamController.sink;
  Stream<Action> get _eventStream => _eventStreamController.stream;
  
  NewBloc() {
    _eventStream.listen((event) async {
      if (event == NewAction.task1) {
        try {
          var new = await getTask();
          _sink.add(new.task);
        } on Exception catch (e) {
          _newSink.addError('Something went wrong');
        }
      }
    });
  }
  
  Future<DataModel> getTask() async {
    var client = http.Client();
    var dataModel;
    
    try {
      //// code to fetchdata from api or anything else
    } catch (Exception) {
      return dataModel;
    }
    return dataModel;
  }
  
}

----------------------------------------------
  
  final newBloc = NewBloc();

// in init state class
{
  newBlock.eventSink.add(Action.task1);
}

//change futurebuider to stream builder and provide stream instead of future

// use void dispose to close stream

void dispose() {
  newBloc.dispose();
  super.dispose();
}



//https://www.youtube.com/watch?v=K6ETAfGZl4k
