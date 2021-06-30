// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finq_db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorFinqDb {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FinqDbBuilder databaseBuilder(String name) => _$FinqDbBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FinqDbBuilder inMemoryDatabaseBuilder() => _$FinqDbBuilder(null);
}

class _$FinqDbBuilder {
  _$FinqDbBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$FinqDbBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$FinqDbBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<FinqDb> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$FinqDb();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$FinqDb extends FinqDb {
  _$FinqDb([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TransactionDao? _transactionDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Transaction` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `description` TEXT NOT NULL, `categoryType` TEXT NOT NULL, `amount` REAL NOT NULL, `transactionType` INTEGER NOT NULL, `transactionDate` INTEGER NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TransactionDao get transactionDao {
    return _transactionDaoInstance ??=
        _$TransactionDao(database, changeListener);
  }
}

class _$TransactionDao extends TransactionDao {
  _$TransactionDao(this.database, this.changeListener)
      : _transactionInsertionAdapter = InsertionAdapter(
            database,
            'Transaction',
            (Transaction item) => <String, Object?>{
                  'id': item.id,
                  'description': item.description,
                  'categoryType': item.categoryType,
                  'amount': item.amount,
                  'transactionType':
                      _transactionTypeConverter.encode(item.transactionType),
                  'transactionDate':
                      _dateTimeConverter.encode(item.transactionDate)
                }),
        _transactionUpdateAdapter = UpdateAdapter(
            database,
            'Transaction',
            ['id'],
            (Transaction item) => <String, Object?>{
                  'id': item.id,
                  'description': item.description,
                  'categoryType': item.categoryType,
                  'amount': item.amount,
                  'transactionType':
                      _transactionTypeConverter.encode(item.transactionType),
                  'transactionDate':
                      _dateTimeConverter.encode(item.transactionDate)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final InsertionAdapter<Transaction> _transactionInsertionAdapter;

  final UpdateAdapter<Transaction> _transactionUpdateAdapter;

  @override
  Future<void> insertTransaction(Transaction transaction) async {
    await _transactionInsertionAdapter.insert(
        transaction, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateTransaction(Transaction transaction) async {
    await _transactionUpdateAdapter.update(
        transaction, OnConflictStrategy.abort);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
final _transactionTypeConverter = TransactionTypeConverter();
