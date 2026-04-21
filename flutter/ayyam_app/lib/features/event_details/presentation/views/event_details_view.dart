import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ayyam_app/l10n/generated/app_localizations.dart';
import '../../../../core/constants/event_content_data.dart';
import '../../../home/logic/events_cubit.dart';
import '../../../home/logic/events_state.dart';

class EventDetailsView extends StatelessWidget {
  final String eventId;

  const EventDetailsView({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;
    final isArabic = locale == 'ar';
    final theme = Theme.of(context);

    return BlocBuilder<EventsCubit, EventsState>(
      builder: (context, state) {
        if (state is! EventsLoaded) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        final event = state.events.firstWhere(
          (e) => e.id == eventId,
          orElse: () => state.events.first,
        );

        final dateFormat = DateFormat('EEEE ( d MMMM yyyy )', locale);
        final displayName = isArabic ? event.nameAr : event.nameEn;
        final displayDescription = isArabic ? event.descriptionAr : event.descriptionEn;
        final content = EventContentData.getContent(event.id);

        return Scaffold(
          body: CustomScrollView(
            slivers: [
              // ═══════════ COLLAPSING HEADER ═══════════
              SliverAppBar(
                expandedHeight: 260,
                pinned: true,
                backgroundColor: Theme.of(context).primaryColor,
                iconTheme: const IconThemeData(color: Colors.white),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    displayName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Theme.of(context).primaryColor,
                          Theme.of(context).primaryColor.withValues(alpha: 0.7),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 40),
                          // Countdown circle
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withValues(alpha: 0.2),
                              border: Border.all(
                                color: Colors.white.withValues(alpha: 0.5),
                                width: 3,
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    event.isToday
                                        ? l10n.eventsToday
                                        : (event.isPassed
                                            ? l10n.eventsPassed
                                            : '${event.remainingDays}'),
                                    style: const TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                    ),
                                  ),
                                  if (!event.isToday && !event.isPassed)
                                    Text(
                                      l10n.daysRemaining,
                                      style: const TextStyle(
                                        fontSize: 11,
                                        color: Colors.white70,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // ═══════════ BODY CONTENT ═══════════
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // ── Date Info Cards ──
                      Row(
                        children: [
                          Expanded(
                            child: _buildDateCard(
                              context,
                              icon: Icons.calendar_today,
                              label: l10n.gregorianDateLabel,
                              value: dateFormat.format(event.gregorianDate),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildDateCard(
                              context,
                              icon: Icons.calendar_month,
                              label: l10n.hijriDateLabel,
                              value: '${event.hijriDay}/${event.hijriMonth}/${event.hijriYear}',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // ── About Section ──
                      _buildSectionTitle(context, l10n.aboutEventLabel, Icons.info_outline, Theme.of(context).primaryColor),
                      const SizedBox(height: 8),
                      Text(
                        displayDescription,
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.6,
                          color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
                        ),
                      ),
                      const SizedBox(height: 28),

                      // ── Rich Content Sections ──
                      if (content != null) ...[
                        // Quran Verses
                        if ((isArabic ? content.versesAr : content.versesEn).isNotEmpty) ...[
                          _buildSectionTitle(context, l10n.versesSection, Icons.menu_book, const Color(0xFF1565C0)),
                          const SizedBox(height: 12),
                          ...(isArabic ? content.versesAr : content.versesEn).map(
                            (verse) => _buildVerseCard(context, verse),
                          ),
                          const SizedBox(height: 24),
                        ],

                        // Hadiths
                        if ((isArabic ? content.hadithsAr : content.hadithsEn).isNotEmpty) ...[
                          _buildSectionTitle(context, l10n.hadithsSection, Icons.auto_stories, const Color(0xFF2E7D32)),
                          const SizedBox(height: 12),
                          ...(isArabic ? content.hadithsAr : content.hadithsEn).map(
                            (hadith) => _buildHadithCard(context, hadith),
                          ),
                          const SizedBox(height: 24),
                        ],

                        // Preparation Tips
                        if ((isArabic ? content.tipsAr : content.tipsEn).isNotEmpty) ...[
                          _buildSectionTitle(context, l10n.tipsSection, Icons.lightbulb_outline, const Color(0xFFE65100)),
                          const SizedBox(height: 12),
                          ...(isArabic ? content.tipsAr : content.tipsEn).asMap().entries.map(
                            (entry) => _buildTipItem(context, entry.key + 1, entry.value),
                          ),
                          const SizedBox(height: 24),
                        ],

                        // Recommended Practices
                        if ((isArabic ? content.practicesAr : content.practicesEn).isNotEmpty) ...[
                          _buildSectionTitle(context, l10n.practicesSection, Icons.check_circle_outline, Theme.of(context).primaryColor),
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: (isArabic ? content.practicesAr : content.practicesEn)
                                .map((practice) => _buildPracticeChip(context, practice))
                                .toList(),
                          ),
                          const SizedBox(height: 24),
                        ],
                      ],

                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ═══════════ HELPER WIDGETS ═══════════

  Widget _buildDateCard(BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: theme.cardTheme.color ?? theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: Theme.of(context).primaryColor),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title, IconData icon, Color color) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color, size: 22),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }

  Widget _buildVerseCard(BuildContext context, String verse) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF1565C0).withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(14),
        border: Border(
          right: BorderSide(color: const Color(0xFF1565C0).withValues(alpha: 0.4), width: 4),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.format_quote, color: const Color(0xFF1565C0).withValues(alpha: 0.4), size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              verse,
              style: TextStyle(
                fontSize: 16,
                height: 1.8,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHadithCard(BuildContext context, String hadith) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF2E7D32).withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(14),
        border: Border(
          right: BorderSide(color: const Color(0xFF2E7D32).withValues(alpha: 0.4), width: 4),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.auto_stories, color: const Color(0xFF2E7D32).withValues(alpha: 0.4), size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              hadith,
              style: TextStyle(
                fontSize: 15,
                height: 1.7,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTipItem(BuildContext context, int index, String tip) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: const Color(0xFFE65100).withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                '$index',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE65100),
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              tip,
              style: TextStyle(
                fontSize: 15,
                height: 1.5,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPracticeChip(BuildContext context, String practice) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).primaryColor.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check_circle, color: Theme.of(context).primaryColor, size: 16),
          const SizedBox(width: 6),
          Text(
            practice,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
