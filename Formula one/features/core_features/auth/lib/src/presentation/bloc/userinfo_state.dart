part of 'userinfo_bloc.dart';

@freezed
class UserinfoState  with _$UserinfoState{
  factory UserinfoState({
    required FirstName firstname,
    required LastName lastname,
    required bool isValid,
    required FormzStatus status,
    required String? errorMessage,

  }) = _UserinfoState;

  factory UserinfoState.intial()=>UserinfoState(
    firstname: FirstName.pure(),
    lastname: LastName.pure(),
    isValid: false,
    status: FormzStatus.pure,
    errorMessage: "",
  );
}

