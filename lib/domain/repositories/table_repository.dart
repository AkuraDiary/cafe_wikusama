import 'package:cafe_wikusama/common/failure.dart';
import 'package:cafe_wikusama/data/models/table_model.dart';
import 'package:dartz/dartz.dart';

abstract class TableRepository {
  Future<Either<Failure, List<TableModel>>> allTable();
}