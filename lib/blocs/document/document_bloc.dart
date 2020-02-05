import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:gogreen/models/common_models.dart';
import 'package:gogreen/services/services.dart';
import './bloc.dart';

class DocumentBloc extends Bloc<DocumentEvent, DocumentState> {
  final DocumentType _type;
  final ILogService _logService;

  DocumentBloc(this._type, this._logService);

  @override
  DocumentState get initialState => LoadingDocumentState();

  @override
  Stream<DocumentState> mapEventToState(
    DocumentEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
