import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class ConnectionChecker {
  final InternetConnection internetConnection;
  ConnectionChecker(this.internetConnection);

  Future<bool> get isConnected async =>
      await internetConnection.hasInternetAccess;
}
