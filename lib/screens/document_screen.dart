import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gogreen/blocs/document/bloc.dart';
import 'package:gogreen/di/injector.dart';
import 'package:gogreen/models/common_models.dart';
import 'package:gogreen/widgets/loading_widget.dart';

class DocumentScreen extends StatelessWidget {
  static const String ROUTE_PATH = "/documents";

  final DocumentType _type;

  const DocumentScreen(this._type);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getTitleByType()),
      ),
      body: BlocBuilder<DocumentBloc, DocumentState>(
        builder: (context, state) {
          if (state is LoadingDocumentState) {
            return LoadingWidget();
          }
          
          if (state is LoadedHtmlDocumentState) {
            return SingleChildScrollView(
                child: Html(data: state.html)
            );
          }
          
          return Container();
        },
      ),
    );
  }

  String _getTitleByType() {
    switch(_type) {
      case DocumentType.License:
        return "License";
      case DocumentType.PrivacyPolicy:
        return "Privacy Policy";
    }
    return "";
  }

  static Widget open(BuildContext context, DocumentScreenArguments arguments) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DocumentBloc>(
          create: (ctx) => DocumentBloc(
            arguments.type,
            Injector().logService,
            Injector().fileService(context)
          )..add(LoadDocumentEvent()),
        ),
      ],
      child: DocumentScreen(arguments.type),
    );
  }
}

class DocumentScreenArguments {
  final DocumentType type;

  DocumentScreenArguments(this.type);
}
