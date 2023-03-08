
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

        Map<String, String> map = {
          'email': email,
          'password': password
        };

        print(map);
       // var formData = FormData.fromMap(map);

        // print(formData.fields);
        final response = await GetIt.I<Dio>().post("login", data: map);
        if(response.statusCode == 200){
          return UserAuthModel.fromJson(response.data);
        }else{
          throw RequestFailure(response.statusCode ?? 1, response.statusMessage ?? "");
        }

      } on DioError{
        throw RequestFailure(-1, "Not Connected");
      }
    }

}