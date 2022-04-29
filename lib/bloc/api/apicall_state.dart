part of 'apicall_bloc.dart';

abstract class ApicallState extends Equatable {
  const ApicallState();

  @override
  List<Object> get props => [];
}

class ApicallInitial extends ApicallState {}

class ApicallLoading extends ApicallState {}

class ApicallLoaded extends ApicallState {
  const ApicallLoaded(this.user);

  //instance of User class
  final User user;

  @override
  List<Object> get props => [user];
}

class ApicallError extends ApicallState {
  const ApicallError(this.errorMessage);

  //error message instance
  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
