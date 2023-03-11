import 'package:cafe_wikusama/common/failure.dart';
import 'package:cafe_wikusama/data/models/table_model.dart';
import 'package:cafe_wikusama/data/sources/remote/table_remote_data_source.dart';
import 'package:cafe_wikusama/domain/repositories/table_repository.dart';
import 'package:dartz/dartz.dart';

class TableRepositoryImpl extends TableRepository {
  final TableRemoteDataSource tableRemoteDataSource;

  TableRepositoryImpl({required this.tableRemoteDataSource});

  @override
  Future<Either<Failure, List<TableModel>>> allTable() async {
    try {
      final result = await tableRemoteDataSource.getAllTable();
      return Right(result);
    } on RequestFailure catch (it) {
      return left(it);
    }
  }
}