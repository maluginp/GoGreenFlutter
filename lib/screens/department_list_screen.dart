import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gogreen/blocs/department_list/bloc.dart';
import 'package:gogreen/di/injector.dart';
import 'package:gogreen/models/store_models.dart';
import 'package:gogreen/widgets/loading_widget.dart';

class DepartmentListScreen extends StatelessWidget {
  static const String ROUTE_PATH = "/departments";

  const DepartmentListScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Departments'),
      ),
      body: BlocBuilder<DepartmentListBloc, DepartmentListState>(
          builder: (context, DepartmentListState state) {
        if (state is LoadingDepartmentListState) {
          return LoadingWidget();
        }

        if (state is FetchedDepartmentListState) {
          return _buildListView(state.departments);
        }

        return Container();
      }),
    );
  }

  _buildListView(List<Department> departments) {
    return ListView.builder(
      itemCount: departments.length,
      itemBuilder: (context, i) {
        var department = departments[i];
        return ListTile(
          title: Text(department.name),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
//            Navigator.of(context).pushNamed(TransactionListScreen.ROUTE_PATH,
//                arguments: TransactionListArguments(location));
          },
        );
      },
    );
  }

  static Widget open(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DepartmentListBloc>(
            create: (ctx) => DepartmentListBloc(
                Injector().logService, Injector().storeService)
              ..add(FetchDepartmentListEvent())),
      ],
      child: DepartmentListScreen(),
    );
  }
}
