import 'package:flutter/material.dart';
import 'package:jpstockmemo2/databases/tables.dart';
import 'package:drift/drift.dart' as drift;

class EditModel extends ChangeNotifier {
  List<String> markets = ["プライム", "スタンダード", "グロース", "その他"];
  String _dropdownValue = "プライム";
  String get dropdownValue => _dropdownValue;

  String stockName = '';
  String stockCode = '';
  String stockMarket = '';
  String stockMemo = '';
  // datetime型をDateFormatで日時のフォーマットを整える
  // String stockCreatedAt = DateFormat('yyyy/MM/dd HH:mm').format(DateTime.now()).toString();
  // String stockUpdatedAt = '';

  bool isLoading = false;

  final StockMemoDatabase _db = StockMemoDatabase(); // データベースに接続

  onChanged(String newValue) {
    _dropdownValue = newValue;
    notifyListeners();
  }

  startLoading() {
    isLoading = true;
    notifyListeners();
  }

  endLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future addMemo(StockMemosCompanion entity) async {
    final entity = StockMemosCompanion(
      code: drift.Value(stockCode),
      stockname: drift.Value(stockName),
      market: drift.Value(_dropdownValue),
      memo: drift.Value(stockMemo),
    );
    await _db.insertMemo(entity);
  }

  Future updateMemo(StockMemo memo) async {
    final entity = StockMemosCompanion(
      code: drift.Value(stockCode),
      stockname: drift.Value(stockName),
      market: drift.Value(_dropdownValue),
      memo: drift.Value(stockMemo),
    );
    await _db.updateMemo(entity);
  }
}
