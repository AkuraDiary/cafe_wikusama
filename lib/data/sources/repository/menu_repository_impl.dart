import 'package:cafe_wikusama/common/failure.dart';
import 'package:cafe_wikusama/data/models/menu_model.dart';
import 'package:cafe_wikusama/data/sources/remote/menu_remote_data_source.dart';
import 'package:cafe_wikusama/domain/repositories/menu_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';


class MenuRepositoryImpl extends MenuRepository {
  final MenuRemoteDataSource menuRemoteDataSource;

    MenuRepositoryImpl({
    required this.menuRemoteDataSource
  });

  @override
  Future<Either<Failure, List<MenuModel>>> allMenu() async {

    try{
      final result = await menuRemoteDataSource.getAllMenu();
      return Right(result);
    } on RequestFailure catch (it){
      return left(it);
    }
  }


}