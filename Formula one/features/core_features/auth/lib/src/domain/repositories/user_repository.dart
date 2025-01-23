import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import '../../data/model/body/user_body.dart';

abstract class UserRepository{
  Future<Either<Failure, UserBody>> createUser(UserB user);
}