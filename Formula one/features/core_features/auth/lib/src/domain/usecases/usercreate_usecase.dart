import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:core/core.dart';
import '../../data/model/body/user_body.dart';
import '../repositories/user_repository.dart';

class UserCreatUseCase extends UseCase<UserBody, UserB> {
  final UserRepository userRepository;

  UserCreatUseCase(this.userRepository);

  @override
  Future<Either<Failure, UserBody>> call(UserB userBody) async {
    return await userRepository.createUser(userBody);
  }
}
