import 'package:flutter/material.dart';
import 'package:gogreen/models/filter_model.dart';

class FilterWidget extends StatelessWidget {
  final Filter _filter;
  
  FilterWidget(this._filter);

  @override
  Widget build(BuildContext context) {
    return Text('Filter');
  }
}