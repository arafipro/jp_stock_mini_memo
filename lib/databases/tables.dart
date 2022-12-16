import 'package:drift/drift.dart';

import 'dart:io';
import 'package:drift/native.dart';
import 'package:jpstockmemo2/models/stock_memos.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'tables.g.dart';

@DriftDatabase(
  tables: [StockMemos],
)
class StockMemoDatabase extends _$StockMemoDatabase {
  StockMemoDatabase()
      : super(
          _openConnection(),
        );

  @override
  int get schemaVersion => 1;

  Future<List<StockMemo>> getMemos() async {
    return await select(stockMemos).get();
  }

  Future<StockMemo> getMemo(int id) async {
    return await (select(stockMemos)
          ..where(
            (tbl) => tbl.code.equals(id.toString()),
          ))
        .getSingle();
  }

  Future<bool> updateMemo(StockMemosCompanion entity) async {
    return await update(stockMemos).replace(entity);
  }

  Future<int> insertMemo(StockMemosCompanion entity) async {
    return await into(stockMemos).insert(entity);
  }

  Future<int> deleteMemo(int id) async {
    return await (delete(stockMemos)
          ..where(
            (tbl) => tbl.id.equals(id),
          ))
        .go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(
    () async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(
        path.join(dbFolder.path, 'stock_memos.sqlite'),
      );
      return NativeDatabase(file);
    },
  );
}
