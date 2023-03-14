import 'package:cafe_wikusama/common/failure.dart';
import 'package:cafe_wikusama/data/models/menu_model.dart';
import 'package:cafe_wikusama/data/models/user_auth_model.dart';
import 'package:cafe_wikusama/data/response/base_response.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';



abstract class MenuRemoteDataSource {
  static const String path = 'https://api.zackym.com/transaksi';
  Future<List<MenuModel>> getAllMenu();
}

class MenuRemoteDataSourceImpl implements MenuRemoteDataSource{
  @override
  Future<List<MenuModel>> getAllMenu()async {

    // TODO: implement getAllMenu
    try{
      // var formData = FormData.fromMap(map);

      // print(formData.fields);
      final response = await GetIt.I<Dio>().get("menu");
      if(response.statusCode == 200){
        var jsonDatas = response.data['values'];
        List<MenuModel> datas=[];
        for (var jsonData in jsonDatas) {
          datas.add(MenuModel.fromJson(jsonData));
        }
        return datas;
        //return List.generate(length, (index) => null).fromJson(response.data);
      }else{
        throw RequestFailure(response.statusCode ?? 1, response.statusMessage ?? "");
      }

    } on DioError{
      throw RequestFailure(-1, "Not Connected");
    }
  }
  static Future<MenuModel?> createComment(
      int postId, String name, String email, String body) async {
    try {
      var response = await Dio().post('https://api.zackym.com/transaksi',
          data: {'postId': postId, 'name': name, 'email': email, 'body': body});
      if (response.statusCode == 201) {
        return MenuModel(
            id: response.data['id'],
            name: response.data['name'],
            email: response.data['email'],
            body: response.data['body'],
            postId: response.data['postId']);
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  }


