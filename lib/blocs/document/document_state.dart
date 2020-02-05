import 'package:equatable/equatable.dart';

abstract class DocumentState extends Equatable {
  const DocumentState();
}

class LoadingDocumentState extends DocumentState {
  @override
  List<Object> get props => [];
}

class LoadedHtmlDocumentState extends DocumentState {
  final String html;

  LoadedHtmlDocumentState(this.html);

  @override
  List<Object> get props => [html];
}