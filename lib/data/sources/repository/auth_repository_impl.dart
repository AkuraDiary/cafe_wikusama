import 'package:cafe_wikusama/common/failure.dart';
import 'package:cafe_wikusama/data/models/user_auth_model.dart';
import 'package:cafe_wikusama/data/sources/remote/auth_remote_data_source.dart';
import 'package:cafe_wikusama/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({
   required this.authRemoteDataSource
  });

  @override
  Future<Either<Failure, UserAuthModel>> login(String email, String password) async {
    try{
      final result = await authRemoteDataSource.login(email, password);
      return Right(result);
    } on RequestFailure catch (it){
      return left(it);
    }
  }

}