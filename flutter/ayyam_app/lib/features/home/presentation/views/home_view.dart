import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:ayyam_app/l10n/generated/app_localizations.dart';
import 'dart:ui';
import '../../../../core/services/storage_service.dart';
import '../../logic/events_cubit.dart';
import '../../logic/events_state.dart';
import '../widgets/event_card.dart';
import '../widgets/developer_info_sheet.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      builder: (context) => const _HomeContent(),
    );
  }
}

class _HomeContent extends StatefulWidget {
  const _HomeContent();

  @override
  State<_HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<_HomeContent> {
  final GlobalKey _profileKey = GlobalKey();
  final GlobalKey _notificationsKey = GlobalKey();
  final GlobalKey _eventCardKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EventsCubit>().loadEvents();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            builder: (_) => const DeveloperInfoSheet(),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).primaryColor.withValues(alpha: 0.3),
                blurRadius: 12,
                spreadRadius: 2,
              )
            ],
          ),
          child: ClipOval(
            child: Image.asset(
              'assets/ayyam_app_logo.webp',
              height: 56,
              width: 56,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 8,
            color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.8),
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Showcase(
                  key: _profileKey,
                  title: l10n.tourProfileTitle,
                  description: l10n.tourProfileDesc,
                  child: IconButton(
                    icon: Icon(Icons.person, size: 28, color: Theme.of(context).colorScheme.onSurface),
                    onPressed: () => context.push('/profile'),
                  ),
                ),
                const SizedBox(width: 48),
                Showcase(
                  key: _notificationsKey,
                  title: l10n.tourNotificationsTitle,
                  description: l10n.tourNotificationsDesc,
                  child: IconButton(
                    icon: Icon(Icons.notifications_active, size: 28, color: Theme.of(context).colorScheme.onSurface),
                    onPressed: () => context.push('/notifications'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<EventsCubit, EventsState>(
        builder: (context, state) {
          if (state is EventsLoading) {
            return Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor));
          } else if (state is EventsError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.wifi_off_rounded, size: 64, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.4)),
                    const SizedBox(height: 24),
                    Text(
                      l10n.noInternetTitle,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      l10n.noInternetMessage,
                      style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6)),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: () => context.read<EventsCubit>().refreshEvents(),
                      icon: const Icon(Icons.refresh),
                      label: Text(l10n.eventsRetry),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is EventsLoaded) {
            final events = state.events;
            if (events.isEmpty) {
              return Center(child: Text(l10n.eventsNoEvents));
            }

            if (!StorageService.getHasSeenShowcase() || StorageService.getForceShowcase()) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) {
                  ShowCaseWidget.of(context).startShowCase([_profileKey, _notificationsKey, _eventCardKey]);
                  StorageService.saveHasSeenShowcase(true);
                  StorageService.saveForceShowcase(false);
                }
              });
            }

            return RefreshIndicator(
              color: Theme.of(context).primaryColor,
              onRefresh: () => context.read<EventsCubit>().refreshEvents(),
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
                itemCount: events.length + (state.isFromCache ? 1 : 0),
                itemBuilder: (context, index) {
                  if (state.isFromCache && index == 0) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(8),
                      color: Colors.orange.withValues(alpha: 0.2),
                      child: Row(
                        children: [
                          const Icon(Icons.offline_bolt, color: Colors.orange),
                          const SizedBox(width: 8),
                          Expanded(child: Text(l10n.eventsOfflineMode, style: const TextStyle(color: Colors.orange))),
                        ],
                      ),
                    );
                  }
                  
                  final eventIndex = state.isFromCache ? index - 1 : index;
                  final event = events[eventIndex];
                  
                  if (eventIndex == 0) {
                    return Showcase(
                      key: _eventCardKey,
                      title: l10n.tourEventCardTitle,
                      description: l10n.tourEventCardDesc,
                      child: EventCard(event: event),
                    );
                  }
                  
                  return EventCard(event: event);
                },
              ),
            );
          }
          return const SizedBox.shrink();
        },
        ),
      ),
    );
  }
}
