// lib/app.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/app_theme.dart';
import 'core/navigation/router.dart';
import 'core/config/app_config.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'di/injection_container.dart';

class OttApp extends StatelessWidget {
  const OttApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => serviceLocator<HomeBloc>()..add(LoadHomeContent()),
        ),
        // Add other BLoC providers as needed
      ],
      child: MaterialApp(
        title: AppConfig.instance.appName,
        theme: AppTheme.darkTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: AppRouter.initialRoute,
      ),
    );
  }
}