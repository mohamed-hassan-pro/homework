import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ayyam_app/l10n/generated/app_localizations.dart';
import 'package:intl/intl.dart';
import '../../../../core/settings/settings_cubit.dart';
import '../../../../core/settings/settings_state.dart';
import '../../data/models/islamic_event.dart';

class EventCard extends StatelessWidget {
  final IslamicEvent event;

  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;
    final isArabic = locale == 'ar';
    final theme = Theme.of(context);

    final displayName = isArabic ? event.nameAr : event.nameEn;
    final dateFormatter = DateFormat('EEEE ( d MMMM yyyy )', locale);
    final formattedDate = dateFormatter.format(event.gregorianDate);

    // Get user's chosen accent color
    final cardColorIndex = context.watch<SettingsCubit>().state.cardColorIndex;
    final accentColor = CardAccentColors.get(cardColorIndex);

    // ══════ GRADIENT FILL LOGIC ══════
    // The color "fills" the card from the left (LTR) or right (RTL).
    // As the event gets closer, the fill shrinks (pulls back).
    // Max fill at 180+ days, min fill at 1 day, gray when passed.
    
    final Color cardColor;
    final double fillRatio; // 0.0 = no fill → 1.0 = full fill
    
    if (event.isPassed) {
      cardColor = Colors.grey.shade600;
      fillRatio = 1.0; // full gray
    } else if (event.isToday) {
      cardColor = const Color(0xFFFFD700); // Gold for today
      fillRatio = 1.0;
    } else {
      cardColor = accentColor;
      // Clamp between 0.15 (minimum visible) and 1.0 (full)
      fillRatio = (event.remainingDays.clamp(0, 180) / 180.0).clamp(0.15, 1.0);
    }

    final isDark = theme.brightness == Brightness.dark;
    
    // Text color: adapts to the mode for better contrast
    // Since the user requested fixing it for white mode specifically.
    final Color textColor;
    final Color subtleTextColor;
    
    if (isDark) {
      textColor = Colors.white;
      subtleTextColor = Colors.white.withValues(alpha: 0.75);
    } else {
      // Darkened for better contrast in Light Mode as requested
      textColor = const Color(0xFF111111);
      subtleTextColor = const Color(0xFF222222);
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: GestureDetector(
        onTap: () => context.push('/event/${event.id}'),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: 90,
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
            ),
            child: Stack(
              children: [
                // ── Gradient Fill Layer ──
                // Fills from the start side and shrinks as event approaches
                Align(
                  alignment: isArabic ? Alignment.centerRight : Alignment.centerLeft,
                  child: FractionallySizedBox(
                    widthFactor: fillRatio,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            cardColor,
                            cardColor.withValues(alpha: 0.75),
                          ],
                          begin: isArabic ? Alignment.centerRight : Alignment.centerLeft,
                          end: isArabic ? Alignment.centerLeft : Alignment.centerRight,
                        ),
                      ),
                    ),
                  ),
                ),

                // ── Content Layer ──
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  child: Row(
                    children: [
                      // Event Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              displayName,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: textColor,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              formattedDate,
                              style: TextStyle(
                                fontSize: 12,
                                color: subtleTextColor,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Days Counter
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            event.isToday
                                ? l10n.eventsToday
                                : (event.isPassed
                                    ? l10n.eventsPassed
                                    : '${event.remainingDays}'),
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w900,
                              color: textColor,
                              height: 1.0,
                            ),
                          ),
                          if (!event.isToday && !event.isPassed)
                            Text(
                              l10n.eventsDaysLeft,
                              style: TextStyle(
                                fontSize: 11,
                                color: subtleTextColor,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
