import 'package:cafe_wikusama/common/failure.dart';
import 'package:cafe_wikusama/data/models/user_auth_model.dart';
import 'package:cafe_wikusama/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class Login{
  final AuthRepository repository;

  Login(this.repository);

  Future<Either<Failure, UserAuthModel>> execute(String email, String password){
    return repository.login(email, password);
  }
}