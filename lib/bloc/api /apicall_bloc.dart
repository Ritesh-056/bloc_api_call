import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:testertype/model/user.dart';
import 'package:testertype/services/github_api.dart';

part 'apicall_event.dart';
part 'apicall_state.dart';

class ApicallBloc extends Bloc<ApicallEvent, ApicallState> {
  ApicallBloc() : super(ApicallInitial()) {
    on<ApicallEvent>((event, emit) async {
      try {
        //loading state
        emit(ApicallLoading());

        //fetching the api data and store it into varibables.
        final mList  = await ApiService().getApiData();
        emit(ApicallLoaded(mList));

        //check whether the api call gets error
        if (mList.error != null) {
          emit(ApicallError(mList.error!));
        }
      } catch (error) {
        print("Error while reflecting states" + error.toString());
      }
    });
  }
}
