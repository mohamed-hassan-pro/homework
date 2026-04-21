import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/home/logic/events_cubit.dart';
import 'features/home/data/repositories/events_repository.dart';
import 'features/home/data/datasources/events_local_ds.dart';
import 'features/home/data/datasources/events_local_calculator.dart';
import 'features/onboarding/logic/onboarding_cubit.dart';
import 'features/notifications/logic/notification_cubit.dart';
import 'features/notifications/data/notification_repository.dart';

import 'package:ayyam_app/l10n/generated/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/settings/settings_cubit.dart';
import 'core/settings/settings_state.dart';

class AyyamApp extends StatelessWidget {
  const AyyamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => EventsLocalDataSource()),
        RepositoryProvider(create: (context) => EventsLocalCalculator()),
        RepositoryProvider(
          create: (context) => EventsRepository(
            context.read<EventsLocalDataSource>(),
            context.read<EventsLocalCalculator>(),
          ),
        ),
        RepositoryProvider(create: (context) => NotificationRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SettingsCubit()),
          BlocProvider(create: (context) => EventsCubit(context.read<EventsRepository>())),
          BlocProvider(create: (context) => OnboardingCubit()),
          BlocProvider(create: (context) => NotificationCubit(context.read<NotificationRepository>())),
        ],
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, settingsState) {
            return MaterialApp.router(
              title: 'Ayyam',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme(CardAccentColors.get(settingsState.cardColorIndex)),
              darkTheme: AppTheme.darkTheme(CardAccentColors.get(settingsState.cardColorIndex)),
              themeMode: settingsState.themeMode,
              locale: settingsState.locale,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: AppLocalizations.supportedLocales,
              routerConfig: AppRouter.router,
            );
          },
        ),
      ),
    );
  }
}

