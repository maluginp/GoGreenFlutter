import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gogreen/blocs/department_list/bloc.dart';
import 'package:gogreen/blocs/total_quantity_order/bloc.dart';
import 'package:gogreen/di/injector.dart';
import 'package:gogreen/models/store_models.dart';
import 'package:gogreen/widgets/loading_widget.dart';
import 'package:gogreen/widgets/total_quantity_order_widget.dart';
import 'screens.dart';

class DepartmentListScreen extends StatelessWidget {
  static const String ROUTE_PATH = "/departments";

  const DepartmentListScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Departments'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.history),
              onPressed: () {
                Navigator.of(context).pushNamed(OrderListScreen.ROUTE_PATH);
              })
        ],
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
      bottomSheet: TotalQuantityOrderWidget(),
    );
  }

  _buildListView(List<Department> departments) {
    return ListView.separated(
      itemCount: departments.length,
      itemBuilder: (context, i) {
        var department = departments[i];
        return ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          title: Text(department.name),
          leading: Image.network(department.image),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.of(context).pushNamed(
                GoodListScreen.ROUTE_PATH,
                arguments: GoodListArgument(department.guid, department.name)
            );
          },
        );
      },
      separatorBuilder: (context, index) => Divider(
        color: Colors.black,
      )
    );
  }

  static Widget open(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DepartmentListBloc>(
            create: (ctx) => DepartmentListBloc(
                Injector().logService, Injector().storeService)
              ..add(FetchDepartmentListEvent())),
        BlocProvider<TotalQuantityOrderBloc>(
            create: (ctx) => TotalQuantityOrderBloc(
                Injector().logService, Injector().orderService)
              ..add(UpdateTotalQuantityOrderEvent())),
      ],
      child: DepartmentListScreen(),
    );
  }
}
