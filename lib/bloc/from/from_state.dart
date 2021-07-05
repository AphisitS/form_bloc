part of 'from_bloc.dart';

@immutable
abstract class FromState {}

class InitialFromState extends FromState {
  @override
  String toString() => "InitialFromState{}";
}

class FormInputState extends FromState {
  final String name,age,bd;
  FormInputState(this.name,this.age,this.bd);
  @override
  String toString() => "FormInputState{}";
}

class FormRefreshState extends FromState {
  @override
  String toString() => "FormInputState{}";
}

class Loading extends FromState {
  @override
  String toString() => "FormInputState{}";
}

class NextScreenState extends FromState {

}
