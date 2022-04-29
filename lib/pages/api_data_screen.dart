import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testertype/bloc/api%20/apicall_bloc.dart';

class ApiCallPage extends StatefulWidget {
  const ApiCallPage({Key? key}) : super(key: key);

  @override
  State<ApiCallPage> createState() => _ApiCallPageState();
}

class _ApiCallPageState extends State<ApiCallPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApicallBloc, ApicallState>(builder: (context, state) {
      if (state is ApicallInitial) {
        print("App is in initial phase");
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is ApicallLoading) {
        print("App is in loading phase");
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is ApicallLoaded) {
          print("App is in loaded phase");
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListTile(
                leading: Text(state.user.id!),
                title: Text(state.user.login!),
                subtitle: Text(state.user.type!),
                trailing: CircleAvatar(
                  child: Image.network(state.user.avatarUrl!),
                ),
              ),
            ]);
      }

      if (state is ApicallError) {
        print("App is in loaded error phase");
        return Center(
          child: Text(state.errorMessage),
        );
      }

      return Container();
    });
  }
}
