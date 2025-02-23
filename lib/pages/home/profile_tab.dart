import 'package:flutter/material.dart';
import 'package:flutter_batch_4_project/blocs/auth/auth_cubit.dart';
import 'package:flutter_batch_4_project/blocs/auth/auth_state.dart';
import 'package:flutter_batch_4_project/blocs/theme/theme_cubit.dart';
import 'package:flutter_batch_4_project/consts/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Tab"),
      ),
      body: RefreshIndicator(
        onRefresh: () => context.read<AuthCubit>().refreshProfile(),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            children: [
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        spacing: 16,
                        children: [
                          const CircleAvatar(
                            backgroundImage: NetworkImage("https://akcdn.detik.net.id/community/media/visual/2022/12/25/lionel-messi_169.jpeg?w=600&q=90"),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.user?.name ?? '',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                state.user?.email ?? '',
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 8,
                    children: [
                      Expanded(
                        child: Text("PILIHAN TEMA")
                      ),
                      BlocBuilder<ThemeCubit, ThemeMode>(
                        builder: (context, themeMode) => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 4,
                          children: [
                            IconButton.outlined(
                                onPressed: () => context.read<ThemeCubit>().switchTheme(ThemeMode.dark),
                                icon: Icon(themeMode == ThemeMode.dark
                                    ? Icons.dark_mode
                                    : Icons.dark_mode_outlined)
                            ),
                            IconButton.outlined(
                                onPressed: () => context.read<ThemeCubit>().switchTheme(ThemeMode.light),
                                icon: Icon(Icons.light_mode)
                            ),
                          ],
                        )
                      )
                    ],
                  ),
                ),
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () async {
                    await context.read<AuthCubit>().logout();
                    if(context.mounted) {
                      Navigator.pushReplacementNamed(context, AppRoutes.login);
                    }
                  }, 
                  label: const Text("Logout"),
                  icon: Icon(Icons.logout),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}