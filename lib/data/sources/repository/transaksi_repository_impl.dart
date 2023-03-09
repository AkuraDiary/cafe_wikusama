import 'package:cafe_wikusama/common/failure.dart';
import 'package:cafe_wikusama/data/models/transaksi_model.dart';
import 'package:cafe_wikusama/data/sources/remote/transaksi_remote_data_source.dart';
import 'package:cafe_wikusama/domain/repositories/transaksi_repository.dart';
import 'package:dartz/dartz.dart';

class TransaksiRepositoryImpl extends TransaksiRepository {
  final TransaksiRemoteDataSource transaksiRemoteDataSource;

  TransaksiRepositoryImpl({required this.transaksiRemoteDataSource});
  
  @override
  Future<Either<Failure, List<TransaksiModel>>> allTransaksi() async {
    try{
      final result = await transaksiRemoteDataSource.getAllTransaksi();
      return Right(result);
    } on RequestFailure catch (it){
      return left(it);
    }
  }
}
