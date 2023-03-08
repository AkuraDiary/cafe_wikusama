import 'package:cafe_wikusama/common/failure.dart';
import 'package:cafe_wikusama/data/models/user_auth_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserAuthModel>> login(String email, String password);
}