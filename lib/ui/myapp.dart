import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_bloc_design/bloc/from/from_bloc.dart';
import 'nextscreen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: BlocProvider<FromBloc>(
          create: (context) => FromBloc(), child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final _youName = TextEditingController();
  final _youAge = TextEditingController();
  final _birthDay = TextEditingController();

  FromBloc _formrBloc;
  String txt = 'tttt';

  Widget build(BuildContext context) {
    _formrBloc = BlocProvider.of<FromBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc"),
        actions: [],
      ),
      body: BlocConsumer<FromBloc, FromState>(
        listener: (BuildContext context, FromState state) {
          // if(state is NextScreenState){
          //   return Navigator.push(context,MaterialPageRoute(builder: (context) => AddScreen(_formrBloc,_youName.text, _youAge.text,_birthDay.text)));
          // }
        },
        bloc: _formrBloc,
        builder: (BuildContext context, FromState state) {
          if (state is InitialFromState) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: _youName,
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter your Name'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: _youAge,
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter your Age'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: _birthDay,
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter your BirthDay'),
                  ),
                ),
                RaisedButton(
                  child: Text('Submit'),
                  onPressed: () {
                    _formrBloc.add(FromInput(
                      _youName.text,
                      _youAge.text,
                      _birthDay.text,
                    ));
                  },
                ),
              ],
            );
          } else if (state is FormInputState) {
            return Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text('Your name is : ' + state.name),
                  Text('Your brithda is : ' + state.bd),
                  Text('Your age : ' + state.age)
                ],
              ),
            );
          } else if (state is Loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is FormRefreshState) {
            _formrBloc.add(FormRefresh());
            return Center(
                child: Column(
              children: [
                Text(_youName.text,
                    style: TextStyle(fontSize: 25, color: Colors.red)),
                Text(_youAge.text, style: TextStyle(fontSize: 25)),
                Text(_birthDay.text, style: TextStyle(fontSize: 25)),
                RaisedButton(
                  child: Text('Next'),
                  color: Colors.red,
                  onPressed: () {
                    _formrBloc.add(FormRefresh());
                    //Navigator.push(context,MaterialPageRoute(builder: (context) => AddScreen(_formrBloc,_youName.text, _youAge.text,_birthDay.text)));
                  },
                ),
              ],
            ));
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
