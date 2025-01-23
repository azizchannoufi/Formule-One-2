
import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import '../../data/models/response_driver/drieves.dart';
import '../repositories/home_repository.dart';

class GetAllDriversUseCase extends UseCase<DriverResponse, NoParams> {
  final HomeRepository homeRepository;

  GetAllDriversUseCase(this.homeRepository);

  @override
  Future<Either<Failure, DriverResponse>> call(NoParams params) async {
    return await homeRepository.getAllDrivers();
  }
}


