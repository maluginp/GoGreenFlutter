import 'package:flutter/material.dart';

abstract class IFileService {
  Future<String> loadContentFromAssets(String filename);
}

class FileService extends IFileService {
  final BuildContext _context;

  FileService(this._context);

  @override
  Future<String> loadContentFromAssets(String filename) async {
    return await DefaultAssetBundle.of(_context).loadString(filename);
  }
}