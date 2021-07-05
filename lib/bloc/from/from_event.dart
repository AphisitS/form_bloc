part of 'from_bloc.dart';

@immutable
abstract class FromEvent {

}

class FromInput extends FromEvent{
  final String name,age,bd;
  FromInput(this.name,this.age,this.bd);
  @override
  String toString() => "FromInput {Input : $name , $age ,$bd}";
}

class FormRefresh extends FromEvent{
  @override
  String toString() => "FormRefesh ";
}
