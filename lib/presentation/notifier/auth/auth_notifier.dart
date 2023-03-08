import 'package:cafe_wikusama/domain/usecase/auth/Login.dart';
import 'package:flutter/cupertino.dart';

class AuthNotifier extends ChangeNotifier {
  final Login loginCase;

  AuthNotifier({required this.loginCase});

  
}
