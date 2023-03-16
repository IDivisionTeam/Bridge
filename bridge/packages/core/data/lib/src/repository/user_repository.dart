import 'package:core_datastore/datastore.dart';
import 'package:core_model/model.dart';

class UserRepository {
  final _localSource = UserLocalDataSource();

  Future<User?> getUser() async => _localSource.getUser();
}
