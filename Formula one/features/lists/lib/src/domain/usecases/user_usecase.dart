import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import '../../data/models/response_user/user_response.dart';
import '../repositories/home_repository.dart';

class UserUseCase extends UseCase<UserResponse, NoParams> {
  final HomeRepository userRepository;

  UserUseCase(this.userRepository);

  @override
  Future<Either<Failure, UserResponse>> call(NoParams params) async {
    return await userRepository.getUser();
  }
}


