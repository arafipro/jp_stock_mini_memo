import 'package:flutter/material.dart';
import 'package:jpstockmemo2/databases/tables.dart';

class ListModel extends ChangeNotifier {
  // DatabaseHelper dbhelp;ではなく下記通りにする
  final StockMemoDatabase _db = StockMemoDatabase(); // データベースに接続
  List<StockMemo> stockmemos = []; // データベースから取得したデータを格納する変数

  Future fetchMemos() async {
    final stockmemos = await _db.getMemos();
    this.stockmemos = stockmemos;
    notifyListeners();
  }

  Future deleteMemo(StockMemo memo) async {
    await _db.deleteMemo(memo.id);
  }
}
