import 'package:cafe_wikusama/common/failure.dart';
import 'package:cafe_wikusama/data/models/user_auth_model.dart';
import 'package:cafe_wikusama/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../data/models/menu_model.dart';
import '../../repositories/menu_repository.dart';

class AllMenu{
  final MenuRepository repository;
  AllMenu(this.repository);
  Future<Either<Failure,List<MenuModel>>> execute(){
    return repository.allMenu();
  }
}