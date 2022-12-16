// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tables.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class StockMemo extends DataClass implements Insertable<StockMemo> {
  final int id;
  final String code;
  final String stockname;
  final String market;
  final String memo;
  const StockMemo(
      {required this.id,
      required this.code,
      required this.stockname,
      required this.market,
      required this.memo});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['code'] = Variable<String>(code);
    map['stockname'] = Variable<String>(stockname);
    map['market'] = Variable<String>(market);
    map['memo'] = Variable<String>(memo);
    return map;
  }

  StockMemosCompanion toCompanion(bool nullToAbsent) {
    return StockMemosCompanion(
      id: Value(id),
      code: Value(code),
      stockname: Value(stockname),
      market: Value(market),
      memo: Value(memo),
    );
  }

  factory StockMemo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StockMemo(
      id: serializer.fromJson<int>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      stockname: serializer.fromJson<String>(json['stockname']),
      market: serializer.fromJson<String>(json['market']),
      memo: serializer.fromJson<String>(json['memo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'code': serializer.toJson<String>(code),
      'stockname': serializer.toJson<String>(stockname),
      'market': serializer.toJson<String>(market),
      'memo': serializer.toJson<String>(memo),
    };
  }

  StockMemo copyWith(
          {int? id,
          String? code,
          String? stockname,
          String? market,
          String? memo}) =>
      StockMemo(
        id: id ?? this.id,
        code: code ?? this.code,
        stockname: stockname ?? this.stockname,
        market: market ?? this.market,
        memo: memo ?? this.memo,
      );
  @override
  String toString() {
    return (StringBuffer('StockMemo(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('stockname: $stockname, ')
          ..write('market: $market, ')
          ..write('memo: $memo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, code, stockname, market, memo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StockMemo &&
          other.id == this.id &&
          other.code == this.code &&
          other.stockname == this.stockname &&
          other.market == this.market &&
          other.memo == this.memo);
}

class StockMemosCompanion extends UpdateCompanion<StockMemo> {
  final Value<int> id;
  final Value<String> code;
  final Value<String> stockname;
  final Value<String> market;
  final Value<String> memo;
  const StockMemosCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.stockname = const Value.absent(),
    this.market = const Value.absent(),
    this.memo = const Value.absent(),
  });
  StockMemosCompanion.insert({
    this.id = const Value.absent(),
    required String code,
    required String stockname,
    required String market,
    required String memo,
  })  : code = Value(code),
        stockname = Value(stockname),
        market = Value(market),
        memo = Value(memo);
  static Insertable<StockMemo> custom({
    Expression<int>? id,
    Expression<String>? code,
    Expression<String>? stockname,
    Expression<String>? market,
    Expression<String>? memo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (stockname != null) 'stockname': stockname,
      if (market != null) 'market': market,
      if (memo != null) 'memo': memo,
    });
  }

  StockMemosCompanion copyWith(
      {Value<int>? id,
      Value<String>? code,
      Value<String>? stockname,
      Value<String>? market,
      Value<String>? memo}) {
    return StockMemosCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      stockname: stockname ?? this.stockname,
      market: market ?? this.market,
      memo: memo ?? this.memo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (stockname.present) {
      map['stockname'] = Variable<String>(stockname.value);
    }
    if (market.present) {
      map['market'] = Variable<String>(market.value);
    }
    if (memo.present) {
      map['memo'] = Variable<String>(memo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StockMemosCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('stockname: $stockname, ')
          ..write('market: $market, ')
          ..write('memo: $memo')
          ..write(')'))
        .toString();
  }
}

class $StockMemosTable extends StockMemos
    with TableInfo<$StockMemosTable, StockMemo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StockMemosTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 4, maxTextLength: 4),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  final VerificationMeta _stocknameMeta = const VerificationMeta('stockname');
  @override
  late final GeneratedColumn<String> stockname = GeneratedColumn<String>(
      'stockname', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _marketMeta = const VerificationMeta('market');
  @override
  late final GeneratedColumn<String> market = GeneratedColumn<String>(
      'market', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _memoMeta = const VerificationMeta('memo');
  @override
  late final GeneratedColumn<String> memo = GeneratedColumn<String>(
      'memo', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, code, stockname, market, memo];
  @override
  String get aliasedName => _alias ?? 'stock_memos';
  @override
  String get actualTableName => 'stock_memos';
  @override
  VerificationContext validateIntegrity(Insertable<StockMemo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('stockname')) {
      context.handle(_stocknameMeta,
          stockname.isAcceptableOrUnknown(data['stockname']!, _stocknameMeta));
    } else if (isInserting) {
      context.missing(_stocknameMeta);
    }
    if (data.containsKey('market')) {
      context.handle(_marketMeta,
          market.isAcceptableOrUnknown(data['market']!, _marketMeta));
    } else if (isInserting) {
      context.missing(_marketMeta);
    }
    if (data.containsKey('memo')) {
      context.handle(
          _memoMeta, memo.isAcceptableOrUnknown(data['memo']!, _memoMeta));
    } else if (isInserting) {
      context.missing(_memoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StockMemo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StockMemo(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      code: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      stockname: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}stockname'])!,
      market: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}market'])!,
      memo: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}memo'])!,
    );
  }

  @override
  $StockMemosTable createAlias(String alias) {
    return $StockMemosTable(attachedDatabase, alias);
  }
}

abstract class _$StockMemoDatabase extends GeneratedDatabase {
  _$StockMemoDatabase(QueryExecutor e) : super(e);
  late final $StockMemosTable stockMemos = $StockMemosTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [stockMemos];
}
