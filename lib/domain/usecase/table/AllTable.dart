import 'package:cafe_wikusama/common/failure.dart';
import 'package:cafe_wikusama/data/models/table_model.dart';
import 'package:cafe_wikusama/domain/repositories/table_repository.dart';
import 'package:dartz/dartz.dart';

class AllTable {
  final TableRepository repository;
  AllTable(this.repository);
  Future<Either<Failure,List<TableModel>>> execute(){
    return repository.allTable();
  }
}