import 'dart:io';

import 'package:finq/data/data_sources/application_data_source.dart';
import 'package:finq/database/db_util.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;

abstract class BackupDataSource {
  Future<void> uploadDbFile(String dbFilePath);
  Future<bool> checkFileExist();
  Future<void> downloadBackupDb();
}

@LazySingleton(as: BackupDataSource)
class BackupDataSourceImpl implements BackupDataSource {
  final FirebaseStorage firebaseStorage;
  final ApplicationDataSource applicationDataSource;
  final DbUtil dbUtil;

  BackupDataSourceImpl(
      {required this.firebaseStorage,
      required this.applicationDataSource,
      required this.dbUtil});

  @override
  Future<void> uploadDbFile(String dbFilePath) async {
    final currentUser = await applicationDataSource.getCacheUser();
    if (currentUser != null) {
      final file = File(dbFilePath);
      final fileName = p.basename(dbFilePath);
      try {
        await firebaseStorage.ref('${currentUser.id}/$fileName').putFile(file);
      } on FirebaseException catch (e) {
        debugPrint(e.message);
      }
    }
  }

  @override
  Future<bool> checkFileExist() async {
    final currentUser = await applicationDataSource.getCacheUser();
    if (currentUser == null) return false;
    try {
      final result = await firebaseStorage
          .ref('${currentUser.id}/db.sqlite')
          .getDownloadURL();
      if (result.isNotEmpty) {
        return true;
      }
      return false;
    } on FirebaseException catch (e) {
      throw e;
    } on Exception {
      return false;
    }
  }

  @override
  Future<void> downloadBackupDb() async {
    final currentUser = await applicationDataSource.getCacheUser();
    if (currentUser == null) return;
    await dbUtil.restoreDatabase((file) async {
      try {
        await firebaseStorage
            .ref('${currentUser.id}/db.sqlite')
            .writeToFile(file);
      } on Exception catch (e) {
        // e.g, e.code == 'canceled'
        debugPrint(e.toString());
        throw e;
      }
    });
  }
}
