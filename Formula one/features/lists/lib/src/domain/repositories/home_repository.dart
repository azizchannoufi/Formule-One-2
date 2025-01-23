import 'package:dartz/dartz.dart';
import 'package:core/core.dart';

import '../../data/models/response_driver/drieves.dart';
import '../../data/models/response_user/user_response.dart';

abstract class HomeRepository{
  Future<Either<Failure,DriverResponse>>getAllDrivers();
  Future<Either<Failure, UserResponse>> getUser();

}