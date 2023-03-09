import 'package:cafe_wikusama/common/failure.dart';
import 'package:cafe_wikusama/data/models/transaksi_model.dart';
import 'package:cafe_wikusama/domain/repositories/transaksi_repository.dart';
import 'package:dartz/dartz.dart';

class AllTransaksi {
  final TransaksiRepository repository;
  AllTransaksi(this.repository);
  Future<Either<Failure,List<TransaksiModel>>> execute(){
    return repository.allTransaksi();
  }
}
