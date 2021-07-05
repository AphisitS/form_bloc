import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:form_bloc_design/service/api_service.dart';
import 'package:meta/meta.dart';

part 'from_event.dart';

part 'from_state.dart';

class FromBloc extends Bloc<FromEvent, FromState> {
   FromBloc() : super(InitialFromState());
   ApiService api = ApiService();
  @override
  Stream<FromState> mapEventToState(FromEvent event) async* {
    if (event is FromInput) {
      yield* _mapIncrementCounterToState(event);
    }
    else if (event is FormRefresh) {
      yield* _mapRefesh(event);
    }
    

  }

  Stream<FromState> _mapIncrementCounterToState( event) async* {
    // var data= await api.getApiService('https://jsonplaceholder.typicode.com/posts');
    // print('$data');
    yield Loading();
    await Future.delayed(Duration(seconds: 3));
    yield  FormInputState(event.name,event.age,event.bd);
    //yield NextScreenState();

  }
  Stream<FromState> _mapRefesh(FromEvent event) async* {
    yield Loading();
    await Future.delayed(Duration(seconds: 3));
    yield  FormRefreshState();
  }



}
