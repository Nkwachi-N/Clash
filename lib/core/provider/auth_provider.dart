import '../repository/auth_repository.dart';

class AuthProvider{
  final _repository = AuthRepository();


  Future<bool> authorize() async {
    return await _repository.authorize();
  }
}