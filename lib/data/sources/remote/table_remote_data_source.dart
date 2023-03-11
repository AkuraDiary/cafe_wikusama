import 'package:cafe_wikusama/common/failure.dart';
import 'package:cafe_wikusama/data/models/table_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

abstract class TableRemoteDataSource {
  Future<List<TableModel>> getAllTable();
}

class TableRemoteDataSourceImpl implements TableRemoteDataSource {
  @override
  Future<List<TableModel>> getAllTable() async {
    try {
      final response = await GetIt.I<Dio>().get("meja");
      if (response.statusCode == 200) {
        var jsonDatas = response.data['values'];
        List<TableModel> datas = [];
        for (var jsonData in jsonDatas) {
          datas.add(TableModel.fromJson(jsonData));
        }
        return datas;
      } else {
        throw RequestFailure(
            response.statusCode ?? 1, response.statusMessage ?? "");
      }
    } on DioError {
      throw RequestFailure(-1, "Not Connected");
    }
  }
}