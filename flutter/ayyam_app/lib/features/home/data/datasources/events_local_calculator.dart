import 'package:hijri/hijri_calendar.dart';
import '../../../../core/constants/islamic_events.dart';
import '../models/islamic_event.dart';

/// Local data source that calculates Hijri→Gregorian dates
/// using the `hijri` package. No internet required.
class EventsLocalCalculator {
  /// Get the current Hijri year from the device clock.
  int getCurrentHijriYear() {
    final today = HijriCalendar.now();
    return today.hYear;
  }

  /// Build the list of upcoming Islamic events.
  /// If an event in the current Hijri year has already passed,
  /// it is recalculated for the NEXT Hijri year so users
  /// always see future events.
  List<IslamicEvent> calculateEvents(int currentHijriYear) {
    final List<IslamicEvent> eventsList = [];
    final converter = HijriCalendar();
    final today = DateTime.now();
    final todayNormalized = DateTime(today.year, today.month, today.day);

    for (final eventData in IslamicEvents.events) {
      // Try current Hijri year first
      var targetYear = currentHijriYear;
      var gregorianDate = converter.hijriToGregorian(
        targetYear,
        eventData.month,
        eventData.day,
      );

      // If the event has already passed, use next Hijri year
      final eventDayNormalized = DateTime(
        gregorianDate.year,
        gregorianDate.month,
        gregorianDate.day,
      );

      if (eventDayNormalized.isBefore(todayNormalized)) {
        targetYear = currentHijriYear + 1;
        gregorianDate = converter.hijriToGregorian(
          targetYear,
          eventData.month,
          eventData.day,
        );
      }

      eventsList.add(IslamicEvent(
        id: eventData.id,
        nameEn: eventData.nameEn,
        nameAr: eventData.nameAr,
        hijriMonth: eventData.month,
        hijriDay: eventData.day,
        hijriYear: targetYear,
        gregorianDate: gregorianDate,
        descriptionEn: eventData.descriptionEn,
        descriptionAr: eventData.descriptionAr,
      ));
    }

    return eventsList;
  }
}
