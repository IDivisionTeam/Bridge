import 'package:core_datastore/datastore.dart';
import 'package:model/model.dart';

class UserRepository {
  final _localSource = UserLocalDataSource();

  Future<User?> getUser() async => _localSource.getUser();
}
