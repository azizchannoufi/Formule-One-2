part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState  {
  factory HomeState({
    required FormzStatus status,
    String? errorMessage,
    required List<UserR> user,
    required List<Driver> drivers,
})=_HomeState;

  factory HomeState.initial(){
  return  HomeState(
  status: FormzStatus.pure,
  errorMessage: "",
  user: [],
  drivers: [],
  );
  }
      }
