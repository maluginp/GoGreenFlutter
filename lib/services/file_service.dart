abstract class IFileService {
  String getAssetFilePath(String filename);
}

class FileService extends IFileService {

  @override
  String getAssetFilePath(String filename) {
    return "";
  }
}