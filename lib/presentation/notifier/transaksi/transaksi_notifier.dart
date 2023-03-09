import 'package:cafe_wikusama/common/failure.dart';
import 'package:cafe_wikusama/common/state_enum.dart';
import 'package:cafe_wikusama/data/models/transaksi_model.dart';
import 'package:cafe_wikusama/domain/usecase/transaksi/AllTransaksi.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class TransaksiNotifier extends ChangeNotifier {
  final AllTransaksi allTransaksi;

  TransaksiNotifier({required this.allTransaksi});

  List<TransaksiModel?> _transaksiResult = [];

  List<TransaksiModel?> get transaksiResult => _transaksiResult;

  RequestFailure? _failure;

  RequestFailure? get failuer => _failure;

  RequestState _transaksiState = RequestState.Empty;

  RequestState get loginState => _transaksiState;

  Future<void> transaksi() async {
    _transaksiState = RequestState.Loading;
    notifyListeners();

    final result = await allTransaksi.execute();

    result.fold(
      (failure) {
        _failure = failure as RequestFailure?;
        _transaksiState = RequestState.Error;
        notifyListeners();
      },
      (data) {
        _transaksiResult = data;
        _transaksiState = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
