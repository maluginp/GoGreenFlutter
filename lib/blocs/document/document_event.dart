import 'package:equatable/equatable.dart';

abstract class DocumentEvent extends Equatable {
  const DocumentEvent();
}

class LoadDocumentEvent extends DocumentEvent {
  @override
  List<Object> get props => [];
}
