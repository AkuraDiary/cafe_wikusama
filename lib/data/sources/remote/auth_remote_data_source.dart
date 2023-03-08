
import 'package:cafe_wikusama/common/failure.dart';
import 'package:cafe_wikusama/data/models/user_auth_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

abstract class AuthRemoteDataSource {
  Future<UserAuthModel> login(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  @override
  Future<UserAuthModel> login(String email, String password) async {
    try{
      
      final response = await GetIt.I<Dio>().get("login");
      if(response.statusCode == 200){
        return UserAuthModel.fromJson(response.data["values"]);
      }else{
        throw RequestFailure(response.statusCode ?? 1, response.statusMessage ?? "");
      }

    } on DioError{
      throw RequestFailure(-1, "Not Connected");
    }
  }

}