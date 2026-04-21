import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/islamic_events.dart';
import '../../../../core/services/api_service.dart';
import '../models/islamic_event.dart';

class EventsRemoteDataSource {
  final Dio _client = ApiService.client;

  Future<List<IslamicEvent>> getIslamicEvents(int targetYear) async {
    final List<IslamicEvent> eventsList = [];

    // Note: The /hToG API can process Hijri to Gregorian
    // For each known event, we fetch its Gregorian equivalent for the given targetYear
    final futures = IslamicEvents.events.map((eventData) async {
      final dayStr = eventData.day.toString().padLeft(2, '0');
      final monthStr = eventData.month.toString().padLeft(2, '0');
      final dateStr = '$dayStr-$monthStr-$targetYear';

      try {
        final response = await _client.get('/hToG/$dateStr');

        if (response.statusCode == 200) {
          final data = response.data['data'];
          final gregorianData = data['gregorian'];
          
          final day = int.parse(gregorianData['day']);
          final month = gregorianData['month']['number'];
          final year = int.parse(gregorianData['year']);

          final parsedDate = DateTime(year, month, day);

          return IslamicEvent(
            id: eventData.id,
            nameEn: eventData.nameEn,
            nameAr: eventData.nameAr,
            hijriMonth: eventData.month,
            hijriDay: eventData.day,
            hijriYear: targetYear,
            gregorianDate: parsedDate,
            descriptionEn: eventData.descriptionEn,
            descriptionAr: eventData.descriptionAr,
          );
        }
      } catch (e) {
        throw Exception('Failed to fetch data for ${eventData.nameEn}: $e');
      }
      return null;
    });

    final results = await Future.wait(futures);
    for (final res in results) {
      if (res != null) {
        eventsList.add(res);
      }
    }

    return eventsList;
  }

  // To know current Hijri year to request for
  Future<int> getCurrentHijriYear() async {
    try {
      final now = DateTime.now();
      final dateStr = DateFormat('dd-MM-yyyy').format(now);
      final response = await _client.get('/gToH/$dateStr');

      if (response.statusCode == 200) {
        final data = response.data['data']['hijri'];
        return int.parse(data['year']);
      }
      throw Exception('Failed to get current Hijri year');
    } catch (e) {
      throw Exception('API error: $e');
    }
  }
}
