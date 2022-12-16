import 'package:drift/drift.dart';

class StockMemos extends Table {
  IntColumn get id => integer().autoIncrement()();
  // autoIncrementを使うと自動的に主キーとして認識する
  TextColumn get code => text().withLength(max: 4, min: 4)();
  TextColumn get stockname => text()();
  TextColumn get market => text()();
  TextColumn get memo => text()();
}
