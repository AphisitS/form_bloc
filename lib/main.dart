import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/from/from_bloc.dart';
import 'bloc/from/observer.dart';

import 'package:form_bloc_design/ui/myapp.dart';
void main() {
  Bloc.observer = FormObserver();
  runApp(MyApp());
}
