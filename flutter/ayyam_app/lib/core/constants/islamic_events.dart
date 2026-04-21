class IslamicEventData {
  final String id;
  final String nameEn;
  final String nameAr;
  final int month;
  final int day;
  final String descriptionEn;
  final String descriptionAr;

  const IslamicEventData({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.month,
    required this.day,
    required this.descriptionEn,
    required this.descriptionAr,
  });
}

class IslamicEvents {
  static const List<IslamicEventData> events = [
    IslamicEventData(
      id: 'ramadan_start',
      nameEn: 'Ramadan Begins',
      nameAr: 'بداية شهر رمضان',
      month: 9,
      day: 1,
      descriptionEn: 'The holy month of fasting, reflection, and prayer.',
      descriptionAr: 'شهر الصيام والتأمل والدعاء.',
    ),
    IslamicEventData(
      id: 'eid_al_fitr',
      nameEn: 'Eid al-Fitr',
      nameAr: 'عيد الفطر',
      month: 10,
      day: 1,
      descriptionEn: 'Festival of Breaking the Fast.',
      descriptionAr: 'عيد الفطر المبارك.',
    ),
    IslamicEventData(
      id: 'dhul_hijjah_start',
      nameEn: 'Start of Dhul Hijjah',
      nameAr: 'بداية ذي الحجة',
      month: 12,
      day: 1,
      descriptionEn: 'The beginning of the month of Hajj.',
      descriptionAr: 'بداية شهر ذي الحجة وأيام العشر المباركة.',
    ),
    IslamicEventData(
      id: 'day_of_arafah',
      nameEn: 'Day of Arafah',
      nameAr: 'يوم عرفة',
      month: 12,
      day: 9,
      descriptionEn: 'The holiest day of the Islamic year.',
      descriptionAr: 'أعظم أيام السنة عند المسلمين.',
    ),
    IslamicEventData(
      id: 'eid_al_adha',
      nameEn: 'Eid al-Adha',
      nameAr: 'عيد الأضحى',
      month: 12,
      day: 10,
      descriptionEn: 'Festival of Sacrifice.',
      descriptionAr: 'عيد الأضحى المبارك.',
    ),
    IslamicEventData(
      id: 'islamic_new_year',
      nameEn: 'Islamic New Year',
      nameAr: 'رأس السنة الهجرية',
      month: 1,
      day: 1,
      descriptionEn: 'The beginning of the new Islamic (Hijri) year.',
      descriptionAr: 'رأس السنة الهجرية الجديدة.',
    ),
    IslamicEventData(
      id: 'ashura',
      nameEn: 'Ashura',
      nameAr: 'عاشوراء',
      month: 1,
      day: 10,
      descriptionEn: 'The 10th day of Muharram.',
      descriptionAr: 'يوم عاشوراء، العاشر من محرم.',
    ),
    IslamicEventData(
      id: 'mawlid_al_nabi',
      nameEn: 'Mawlid al-Nabi',
      nameAr: 'المولد النبوي',
      month: 3,
      day: 12,
      descriptionEn: 'The observance of the birthday of the Islamic prophet Muhammad.',
      descriptionAr: 'ذكرى المولد النبوي الشريف.',
    ),
    IslamicEventData(
      id: 'isra_miraj',
      nameEn: 'Isra & Mi\'raj',
      nameAr: 'الإسراء والمعراج',
      month: 7,
      day: 27,
      descriptionEn: 'The Night Journey of the Prophet Muhammad.',
      descriptionAr: 'ذكرى الإسراء والمعراج.',
    ),
    IslamicEventData(
      id: 'mid_shaban',
      nameEn: 'Mid-Sha\'ban',
      nameAr: 'النصف من شعبان',
      month: 8,
      day: 15,
      descriptionEn: 'The night of record, a night of forgiveness.',
      descriptionAr: 'ليلة النصف من شعبان، ليلة المغفرة.',
    ),
  ];
}
