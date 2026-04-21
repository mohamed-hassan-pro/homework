import 'package:hive/hive.dart';
import 'package:equatable/equatable.dart';

part 'islamic_event.g.dart';

@HiveType(typeId: 0)
class IslamicEvent extends Equatable {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String nameEn;

  @HiveField(2)
  final String nameAr;

  @HiveField(3)
  final int hijriMonth;

  @HiveField(4)
  final int hijriDay;

  @HiveField(5)
  final int hijriYear;

  @HiveField(6)
  final DateTime gregorianDate;

  @HiveField(7)
  final String descriptionEn;

  @HiveField(8)
  final String descriptionAr;

  const IslamicEvent({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.hijriMonth,
    required this.hijriDay,
    required this.hijriYear,
    required this.gregorianDate,
    required this.descriptionEn,
    required this.descriptionAr,
  });

  int get remainingDays {
    final now = DateTime.now();
    // Neutralize time parts for true day bounds
    final today = DateTime(now.year, now.month, now.day);
    final eventDay = DateTime(gregorianDate.year, gregorianDate.month, gregorianDate.day);
    return eventDay.difference(today).inDays;
  }

  bool get isPassed => remainingDays < 0;
  bool get isToday => remainingDays == 0;

  @override
  List<Object?> get props => [
        id,
        nameEn,
        nameAr,
        hijriMonth,
        hijriDay,
        hijriYear,
        gregorianDate,
        descriptionEn,
        descriptionAr,
      ];
}
