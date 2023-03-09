import 'package:cafe_wikusama/common/failure.dart';
import 'package:cafe_wikusama/data/models/transaksi_model.dart';
import 'package:dartz/dartz.dart';

abstract class TransaksiRepository {
  Future<Either<Failure, List<TransaksiModel>>> allTransaksi();
}
