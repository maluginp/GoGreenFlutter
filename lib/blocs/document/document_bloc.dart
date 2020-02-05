import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:gogreen/models/common_models.dart';
import 'package:gogreen/services/services.dart';
import './bloc.dart';

class DocumentBloc extends Bloc<DocumentEvent, DocumentState> {
  final DocumentType _type;
  final ILogService _logService;
  final IFileService _fileService;

  DocumentBloc(this._type, this._logService, this._fileService);

  @override
  DocumentState get initialState => LoadingDocumentState();

  @override
  Stream<DocumentState> mapEventToState(
    DocumentEvent event,
  ) async* {
    if (event is LoadDocumentEvent) {
      String html = await _fileService.loadContentFromAssets(_getFilenameByType());
      yield LoadedHtmlDocumentState(html);
    }
  }

  String _getFilenameByType() {
    return "assets/license.html";
  }
}
