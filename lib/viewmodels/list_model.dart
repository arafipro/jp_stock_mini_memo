import 'package:flutter/material.dart';
import 'package:jp_stock_mini_memo/models/stock_memo.dart';
import 'package:jp_stock_mini_memo/utils/dbhelper.dart';

class ListModel extends ChangeNotifier {
  List<StockMemo> stockmemos = [];
  // DatabaseHelper dbhelp;ではなく下記通りにする
  final dbhelp = DatabaseHelper();

  Future fetchMemos() async {
    final memos = await dbhelp.getMemoList();
    stockmemos = memos;
    notifyListeners();
  }

  Future deleteMemo(StockMemo memo) async {
    await dbhelp.deleteMemo(memo.id!);
  }
}
