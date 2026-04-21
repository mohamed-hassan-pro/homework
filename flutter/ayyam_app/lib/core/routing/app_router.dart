import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../../features/onboarding/presentation/views/splash_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/profile/presentation/views/profile_view.dart';
import '../../features/notifications/presentation/views/notification_settings_view.dart';
import '../../features/event_details/presentation/views/event_details_view.dart';
import '../../core/services/storage_service.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/splash',
    redirect: (context, state) {
      final isOnboarded = StorageService.isOnboarded;
      final currentPath = state.matchedLocation;

      // If user is on splash, let it handle the timed transition
      if (currentPath == '/splash') return null;

      // If NOT onboarded and trying to go anywhere except /onboarding → force onboarding
      if (!isOnboarded && currentPath != '/onboarding') {
        return '/onboarding';
      }

      // If already onboarded and trying to go back to /onboarding → force home
      if (isOnboarded && currentPath == '/onboarding') {
        return '/home';
      }

      return null; // No redirect needed
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: '/notifications',
        builder: (context, state) => const NotificationsView(),
      ),
      GoRoute(
        path: '/event/:eventId',
        builder: (context, state) {
          final eventId = state.pathParameters['eventId']!;
          return EventDetailsView(eventId: eventId);
        },
      ),
    ],
  );
}
