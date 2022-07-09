import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class Storage {
  final storage = FirebaseStorage.instance;
  Future<void> uploadFile(String filePath, String fileName) async {
    File file = File(filePath);
    try {
      await storage.ref(fileName).putFile(file);
    } on FirebaseException catch (e) {
      print(e);
    }
  }
  Future<ListResult> listFile() async
  {
    ListResult results=await storage.ref().listAll();
    results.items.forEach((Reference ref)
    {
      print('Found File: $ref');
    });
    return results;
  }
}
