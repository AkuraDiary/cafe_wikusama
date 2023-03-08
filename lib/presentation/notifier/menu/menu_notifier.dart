import 'package:cafe_wikusama/common/app_shared_preferences.dart';
import 'package:cafe_wikusama/common/failure.dart';
import 'package:cafe_wikusama/common/state_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../../../data/models/menu_model.dart';
import '../../pages/Kasir/Menu/menu.dart';
import '../../pages/kasir/menu/menu.dart';

class MenuNotifier extends ChangeNotifier {
  final AllMenu allMenu;
  
  MenuNotifier({required this.allMenu});
  
  MenuModel? _menuResult;

  MenuModel? get menuResult => _menuResult;

  RequestFailure? _failure;
  
  RequestFailure? get failuer => _failure;

  RequestState _menuState = RequestState.Empty;

  RequestState get loginState => _menuState;

  Future<void> menu({required String email, required String password}) async {
    _menuState = RequestState.Loading;
    notifyListeners();

    final result = await allMenuCase.execute(email, password);

    result.fold(
      (failure) {
        _failure = failure as RequestFailure?;
        _menuState = RequestState.Error;
        notifyListeners();
      },
      (data) {
        _menuResult = data;

        GetIt.I<AppSharedPreferences>().updateToken(
            data.token!
        );
        _menuState = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
