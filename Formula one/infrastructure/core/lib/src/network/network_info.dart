
import 'package:dependencies/dependencies.dart';
abstract class NetworkInfo{
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo{
  final InternetConnectionChecker connectionChecker;
  NetworkInfoImpl(this.connectionChecker);

  Future<bool> get isConnected => connectionChecker.hasConnection;

}