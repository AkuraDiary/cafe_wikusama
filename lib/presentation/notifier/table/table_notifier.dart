import 'package:cafe_wikusama/common/failure.dart';
import 'package:cafe_wikusama/common/state_enum.dart';
import 'package:cafe_wikusama/data/models/table_model.dart';
import 'package:cafe_wikusama/domain/usecase/table/AllTable.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class TableNotifier extends ChangeNotifier {
  final AllTable allTable;

  TableNotifier({required this.allTable});

  List<TableModel?> _tableResult = [];

  List<TableModel?> get tableResult => _tableResult;

  RequestFailure? _failure;

  RequestFailure? get failuer => _failure;

  RequestState _tableState = RequestState.Empty;

  RequestState get loginState => _tableState;

  Future<void> table() async {
    _tableState = RequestState.Loading;
    notifyListeners();

    final result = await allTable.execute();

    result.fold(
      (failure) {
        _failure = failure as RequestFailure?;
        _tableState = RequestState.Error;
        notifyListeners();
      },
      (data) {
        _tableResult = data;
        _tableState = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
