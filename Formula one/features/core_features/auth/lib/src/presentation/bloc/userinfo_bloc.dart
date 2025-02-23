import 'package:meta/meta.dart';
import '../../data/model/body/user_body.dart';
import '../../domain/usecases/usercreate_usecase.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
part 'userinfo_event.dart';
part 'userinfo_state.dart';
part 'userinfo_bloc.freezed.dart';

class UserinfoBloc extends Bloc<UserinfoEvent, UserinfoState> {
  final UserCreatUseCase userUseCase;

  UserinfoBloc( this.userUseCase): super(UserinfoState.intial()){
    on<firstnameChanged>(onfirstnameChanged);
    on<lastnameChanged>(onlastnameChanged);
    on<Submit>(onSubmit);
  }

  Future<void>onfirstnameChanged(firstnameChanged event, Emitter<UserinfoState>emit)async{
    final firstname = FirstName.dirty(event.firstname);
    FormzStatus status = Formz.validate([firstname , state.lastname]);

    emit(
      state.copyWith(
        firstname: firstname,
        isValid: status.isValid,
      ),
    );
  }
  Future<void>onlastnameChanged(lastnameChanged event, Emitter<UserinfoState>emit)async{
    final lastname = LastName.dirty(event.lastname);
    FormzStatus status = Formz.validate([lastname , state.firstname]);
    emit(
      state.copyWith(
        lastname: lastname,
        isValid: status.isValid,
      )
    );
  }
  Future<void> onSubmit(Submit event, Emitter<UserinfoState> emit) async {
    if (!state.isValid) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
      return;
    }

    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    try {
      // Appel au cas d'utilisation pour créer l'utilisateur
      final result = await userUseCase.call(UserB(
        first_name: state.firstname.value,
        last_name: state.lastname.value,
      )
      );

      // Vérification du résultat
      result.fold(
            (failure) {
          emit(state.copyWith(
            status: FormzStatus.submissionFailure,
            errorMessage: failure.message, // Affiche un message d'erreur
          ));
        },
            (success) {
          emit(state.copyWith(
            status: FormzStatus.submissionInProgress,
          ));
        },
      );
    } catch (e) {
      emit(state.copyWith(
        status: FormzStatus.submissionFailure,
        errorMessage: e.toString(), // Affiche l'erreur si inattendue
      ));
    }
  }

}
