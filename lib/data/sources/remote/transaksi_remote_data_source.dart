import 'package:cafe_wikusama/common/failure.dart';
import 'package:cafe_wikusama/data/models/transaksi_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

abstract class TransaksiRemoteDataSource {
  Future<List<TransaksiModel>> getAllTransaksi();
}

class TransaksiRemoteDataSourceImpl implements TransaksiRemoteDataSource {
  @override
  Future<List<TransaksiModel>> getAllTransaksi() async {
    try {
      final response = await GetIt.I<Dio>().get("transaksi");
      if (response.statusCode == 200) {
        var jsonDatas = response.data['values'];
        List<TransaksiModel> datas = [];
        for (var jsonData in jsonDatas) {
          datas.add(TransaksiModel.fromJson(jsonData));
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
