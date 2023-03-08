import 'package:cafe_wikusama/common/failure.dart';
import 'package:cafe_wikusama/data/models/menu_model.dart';
import 'package:cafe_wikusama/data/models/user_auth_model.dart';
import 'package:dartz/dartz.dart';

abstract class MenuRepository {
  Future<Either<Failure, List<MenuModel>>> allMenu();
}