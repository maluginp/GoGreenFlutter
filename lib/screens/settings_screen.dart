import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gogreen/blocs/settings/bloc.dart';
import 'package:gogreen/di/injector.dart';
import 'package:gogreen/widgets/loading_widget.dart';
import 'screens.dart';

class SettingsScreen extends StatelessWidget {
  static const String ROUTE_PATH = "/settings";

  const SettingsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: BlocConsumer<SettingsBloc, SettingsState>(
        listener: (context, state) {
          if (state is LoggedOutSettingState) {
            Navigator.of(context).pushReplacementNamed(
              LoginScreen.ROUTE_PATH,
            );
          }
        },
        builder: (context, SettingsState state) {
          if (state is LoadingSettingsState) {
            return LoadingWidget();
          }

          if (state is LoadedSettingsState) {
            return _buildListView();
          }

          return Container();
        },
      ),
    );
  }

  _buildListView() {
    return ListView.separated(
      itemCount: 1,
      itemBuilder: (context, i) {
        return ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          title: Text('Logout'),
          onTap: () {
            BlocProvider.of<SettingsBloc>(context).add(LogoutSettingsEvent());
          },
        );
      },
      separatorBuilder: (context, index) => Divider(
        color: Colors.black,
      ),
    );
  }

  static Widget open(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsBloc>(
          create: (ctx) => SettingsBloc(
            Injector().logService,
            Injector().authService,
          )..add(FetchSettingsEvent()),
        )
      ],
      child: SettingsScreen(),
    );
  }
}
