// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finq_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Transaction extends DataClass implements Insertable<Transaction> {
  final int? id;
  final String description;
  final String categoryType;
  final double amount;
  final DateTime transactionDate;
  final TransactionType transactionType;
  Transaction(
      {this.id,
      required this.description,
      required this.categoryType,
      required this.amount,
      required this.transactionDate,
      required this.transactionType});
  factory Transaction.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Transaction(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      categoryType: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category_type'])!,
      amount: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}amount'])!,
      transactionDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}transaction_date'])!,
      transactionType: $TransactionsTable.$converter0.mapToDart(const IntType()
          .mapFromDatabaseResponse(
              data['${effectivePrefix}transaction_type']))!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['description'] = Variable<String>(description);
    map['category_type'] = Variable<String>(categoryType);
    map['amount'] = Variable<double>(amount);
    map['transaction_date'] = Variable<DateTime>(transactionDate);
    {
      final converter = $TransactionsTable.$converter0;
      map['transaction_type'] =
          Variable<int>(converter.mapToSql(transactionType)!);
    }
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      description: Value(description),
      categoryType: Value(categoryType),
      amount: Value(amount),
      transactionDate: Value(transactionDate),
      transactionType: Value(transactionType),
    );
  }

  factory Transaction.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Transaction(
      id: serializer.fromJson<int?>(json['id']),
      description: serializer.fromJson<String>(json['description']),
      categoryType: serializer.fromJson<String>(json['categoryType']),
      amount: serializer.fromJson<double>(json['amount']),
      transactionDate: serializer.fromJson<DateTime>(json['transactionDate']),
      transactionType:
          serializer.fromJson<TransactionType>(json['transactionType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'description': serializer.toJson<String>(description),
      'categoryType': serializer.toJson<String>(categoryType),
      'amount': serializer.toJson<double>(amount),
      'transactionDate': serializer.toJson<DateTime>(transactionDate),
      'transactionType': serializer.toJson<TransactionType>(transactionType),
    };
  }

  Transaction copyWith(
          {int? id,
          String? description,
          String? categoryType,
          double? amount,
          DateTime? transactionDate,
          TransactionType? transactionType}) =>
      Transaction(
        id: id ?? this.id,
        description: description ?? this.description,
        categoryType: categoryType ?? this.categoryType,
        amount: amount ?? this.amount,
        transactionDate: transactionDate ?? this.transactionDate,
        transactionType: transactionType ?? this.transactionType,
      );
  @override
  String toString() {
    return (StringBuffer('Transaction(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('categoryType: $categoryType, ')
          ..write('amount: $amount, ')
          ..write('transactionDate: $transactionDate, ')
          ..write('transactionType: $transactionType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          description.hashCode,
          $mrjc(
              categoryType.hashCode,
              $mrjc(
                  amount.hashCode,
                  $mrjc(
                      transactionDate.hashCode, transactionType.hashCode))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Transaction &&
          other.id == this.id &&
          other.description == this.description &&
          other.categoryType == this.categoryType &&
          other.amount == this.amount &&
          other.transactionDate == this.transactionDate &&
          other.transactionType == this.transactionType);
}

class TransactionsCompanion extends UpdateCompanion<Transaction> {
  final Value<int?> id;
  final Value<String> description;
  final Value<String> categoryType;
  final Value<double> amount;
  final Value<DateTime> transactionDate;
  final Value<TransactionType> transactionType;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.categoryType = const Value.absent(),
    this.amount = const Value.absent(),
    this.transactionDate = const Value.absent(),
    this.transactionType = const Value.absent(),
  });
  TransactionsCompanion.insert({
    this.id = const Value.absent(),
    required String description,
    required String categoryType,
    required double amount,
    required DateTime transactionDate,
    required TransactionType transactionType,
  })  : description = Value(description),
        categoryType = Value(categoryType),
        amount = Value(amount),
        transactionDate = Value(transactionDate),
        transactionType = Value(transactionType);
  static Insertable<Transaction> custom({
    Expression<int?>? id,
    Expression<String>? description,
    Expression<String>? categoryType,
    Expression<double>? amount,
    Expression<DateTime>? transactionDate,
    Expression<TransactionType>? transactionType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (categoryType != null) 'category_type': categoryType,
      if (amount != null) 'amount': amount,
      if (transactionDate != null) 'transaction_date': transactionDate,
      if (transactionType != null) 'transaction_type': transactionType,
    });
  }

  TransactionsCompanion copyWith(
      {Value<int?>? id,
      Value<String>? description,
      Value<String>? categoryType,
      Value<double>? amount,
      Value<DateTime>? transactionDate,
      Value<TransactionType>? transactionType}) {
    return TransactionsCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      categoryType: categoryType ?? this.categoryType,
      amount: amount ?? this.amount,
      transactionDate: transactionDate ?? this.transactionDate,
      transactionType: transactionType ?? this.transactionType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (categoryType.present) {
      map['category_type'] = Variable<String>(categoryType.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (transactionDate.present) {
      map['transaction_date'] = Variable<DateTime>(transactionDate.value);
    }
    if (transactionType.present) {
      final converter = $TransactionsTable.$converter0;
      map['transaction_type'] =
          Variable<int>(converter.mapToSql(transactionType.value)!);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('categoryType: $categoryType, ')
          ..write('amount: $amount, ')
          ..write('transactionDate: $transactionDate, ')
          ..write('transactionType: $transactionType')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, Transaction> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TransactionsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedTextColumn description = _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      false,
    );
  }

  final VerificationMeta _categoryTypeMeta =
      const VerificationMeta('categoryType');
  @override
  late final GeneratedTextColumn categoryType = _constructCategoryType();
  GeneratedTextColumn _constructCategoryType() {
    return GeneratedTextColumn(
      'category_type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedRealColumn amount = _constructAmount();
  GeneratedRealColumn _constructAmount() {
    return GeneratedRealColumn(
      'amount',
      $tableName,
      false,
    );
  }

  final VerificationMeta _transactionDateMeta =
      const VerificationMeta('transactionDate');
  @override
  late final GeneratedDateTimeColumn transactionDate =
      _constructTransactionDate();
  GeneratedDateTimeColumn _constructTransactionDate() {
    return GeneratedDateTimeColumn(
      'transaction_date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _transactionTypeMeta =
      const VerificationMeta('transactionType');
  @override
  late final GeneratedIntColumn transactionType = _constructTransactionType();
  GeneratedIntColumn _constructTransactionType() {
    return GeneratedIntColumn(
      'transaction_type',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, description, categoryType, amount, transactionDate, transactionType];
  @override
  $TransactionsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'transactions';
  @override
  final String actualTableName = 'transactions';
  @override
  VerificationContext validateIntegrity(Insertable<Transaction> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('category_type')) {
      context.handle(
          _categoryTypeMeta,
          categoryType.isAcceptableOrUnknown(
              data['category_type']!, _categoryTypeMeta));
    } else if (isInserting) {
      context.missing(_categoryTypeMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('transaction_date')) {
      context.handle(
          _transactionDateMeta,
          transactionDate.isAcceptableOrUnknown(
              data['transaction_date']!, _transactionDateMeta));
    } else if (isInserting) {
      context.missing(_transactionDateMeta);
    }
    context.handle(_transactionTypeMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Transaction map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Transaction.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(_db, alias);
  }

  static TypeConverter<TransactionType, int> $converter0 =
      const EnumIndexConverter<TransactionType>(TransactionType.values);
}

abstract class _$FinqDb extends GeneratedDatabase {
  _$FinqDb(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  late final TransactionsDao transactionsDao = TransactionsDao(this as FinqDb);
  Selectable<double> sumofTransactionAmount(
      DateTime startDate, DateTime endDate, int transType) {
    return customSelect(
        'SELECT SUM(amount) FROM transactions WHERE transaction_date>=:startDate AND transaction_date<=:endDate AND transaction_type=:transType',
        variables: [
          Variable<DateTime>(startDate),
          Variable<DateTime>(endDate),
          Variable<int>(transType)
        ],
        readsFrom: {
          transactions
        }).map((QueryRow row) => row.read<double>('SUM(amount)'));
  }

  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [transactions];
}
