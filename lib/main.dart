import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testertype/bloc/api%20/apicall_bloc.dart';
import 'package:testertype/pages/api_data_screen.dart';
import 'package:testertype/services/github_api.dart';

import 'bloc/counter/counter_bloc.dart';
import 'bloc/counter/counter_event_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final bloc = Bloc_Counter();

  @override
  void initState() {
    ApiService().getApiData().then((usr) {
      
      
    }).catchError((err) {
      print("Error ==>${err.toString()}");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ApicallBloc(),
        child: const ApiCallPage(),
      ),
      // home: Scaffold(
      //     body: Center(
      //   child: StreamBuilder(
      //     stream: bloc.counter,
      //     initialData: 0,
      //     builder: (BuildContext context,AsyncSnapshot<int> snapshot){
      //       return Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: <Widget>[
      //           Image.network("https://raw.githubusercontent.com/felangel/bloc/master/docs/assets/flutter_bloc_logo_full.png",width: 250,height: 200,),
      //          Text("Flutter Bloc Example", style: TextStyle(fontStyle: FontStyle.italic,fontSize: 25),),
      //           Text("Press Below Button "),
      //           Text(
      //             '${snapshot.data}',
      //             style: TextStyle(fontSize: 30)
      //           ),
      //         ],
      //       );
      //     },
      //   ),
      // ),
      //   floatingActionButton: Column(
      //     mainAxisAlignment: MainAxisAlignment.end,
      //     children: [
      //       FloatingActionButton(
      //         onPressed: () {
      //           bloc.counterEventSink.add(IncrementEvent());
      //         },
      //         tooltip: 'Increment',
      //         child: Icon(Icons.add),
      //       ),
      //       const SizedBox(height: 10),
      //       FloatingActionButton(
      //         onPressed: () {
      //           bloc.counterEventSink.add(DecrementEvent());
      //         },
      //         tooltip: 'Decrement',
      //         child: Icon(Icons.remove),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
