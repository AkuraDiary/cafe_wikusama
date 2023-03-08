import 'package:cafe_wikusama/common/app_shared_preferences.dart';
import 'package:cafe_wikusama/common/failure.dart';
import 'package:cafe_wikusama/common/state_enum.dart';
import 'package:cafe_wikusama/data/models/user_auth_model.dart';
import 'package:cafe_wikusama/domain/usecase/auth/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class AuthNotifier extends ChangeNotifier {
  final Login loginCase;

  AuthNotifier({required this.loginCase});

  UserAuthModel? _loginResult;

  UserAuthModel? get loginResult => _loginResult;

  RequestFailure? _failure;

  RequestFailure? get failuer => _failure;

  RequestState _loginState = RequestState.Empty;

  RequestState get loginState => _loginState;

  Future<void> login({required String email, required String password}) async {
    _loginState = RequestState.Loading;
    notifyListeners();

    final result = await loginCase.execute(email, password);

    result.fold(
      (failure) {
        _failure = failure as RequestFailure?;
        _loginState = RequestState.Error;
      },
      (data) {
        _loginResult = data;
        _loginState = RequestState.Loaded;
        GetIt.I<AppSharedPreferences>().updateToken(
            data.token!
        );
        notifyListeners();
      },
    );
  }
}
