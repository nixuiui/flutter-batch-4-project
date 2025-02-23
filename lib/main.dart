import 'package:flutter/material.dart';
import 'package:flutter_batch_4_project/blocs/auth/auth_cubit.dart';
import 'package:flutter_batch_4_project/blocs/order/order_cubit.dart';
import 'package:flutter_batch_4_project/blocs/theme/theme_cubit.dart';
import 'package:flutter_batch_4_project/consts/routes.dart';
import 'package:flutter_batch_4_project/data/local_storage/auth_local_storage.dart';
import 'package:flutter_batch_4_project/data/remote_data/auth_remote_data.dart';
import 'package:flutter_batch_4_project/helpers/injector.dart';
import 'package:flutter_batch_4_project/helpers/themes/dark_theme.dart';
import 'package:flutter_batch_4_project/helpers/themes/light_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await setupInjector();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit(
          getIt.get<AuthLocalStorage>(),
          getIt.get<AuthRemoteData>(),
        )),
        BlocProvider(create: (context) => OrderCubit(
          getIt.get()
        )),
        BlocProvider(
          create: (context) => ThemeCubit(
            getIt.get()
          )..init(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            title: 'Nusacodes Batch 2',
            debugShowCheckedModeBanner: false,
            themeMode: themeMode,
            theme: lightTheme(context),
            darkTheme: darkTheme(context),
            initialRoute: AppRoutes.splash,
            routes: routes,
          );
        }
      ),
    );
  }
}
