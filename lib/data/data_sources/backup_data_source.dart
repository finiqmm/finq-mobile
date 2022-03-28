import 'dart:io';

import 'package:finq/data/data_sources/application_data_source.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;

abstract class BackupDataSource {
  Future<void> uploadDbFile(String dbFilePath);
}

@LazySingleton(as: BackupDataSource)
class BackupDataSourceImpl implements BackupDataSource {
  final FirebaseStorage firebaseStorage;
  final ApplicationDataSource applicationDataSource;

  BackupDataSourceImpl(
      {required this.firebaseStorage, required this.applicationDataSource});

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
}
