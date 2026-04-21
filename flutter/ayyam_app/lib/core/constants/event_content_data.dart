/// Rich Islamic content for each event — curated from authentic sources.
/// Contains Quran verses, Hadiths, preparation tips, and recommended practices.
class EventContent {
  final List<String> versesAr;
  final List<String> versesEn;
  final List<String> hadithsAr;
  final List<String> hadithsEn;
  final List<String> tipsAr;
  final List<String> tipsEn;
  final List<String> practicesAr;
  final List<String> practicesEn;

  const EventContent({
    required this.versesAr,
    required this.versesEn,
    required this.hadithsAr,
    required this.hadithsEn,
    required this.tipsAr,
    required this.tipsEn,
    required this.practicesAr,
    required this.practicesEn,
  });
}

class EventContentData {
  static const Map<String, EventContent> content = {
    // ═══════════════════════════════════════════
    // RAMADAN
    // ═══════════════════════════════════════════
    'ramadan_start': EventContent(
      versesAr: [
        'شَهْرُ رَمَضَانَ الَّذِي أُنزِلَ فِيهِ الْقُرْآنُ هُدًى لِّلنَّاسِ وَبَيِّنَاتٍ مِّنَ الْهُدَىٰ وَالْفُرْقَانِ ۚ (البقرة: 185)',
        'يَا أَيُّهَا الَّذِينَ آمَنُوا كُتِبَ عَلَيْكُمُ الصِّيَامُ كَمَا كُتِبَ عَلَى الَّذِينَ مِن قَبْلِكُمْ لَعَلَّكُمْ تَتَّقُونَ (البقرة: 183)',
      ],
      versesEn: [
        'The month of Ramadan in which the Quran was revealed, a guidance for mankind and clear proofs for guidance and the criterion. (Al-Baqarah: 185)',
        'O you who believe! Fasting is prescribed for you as it was prescribed for those before you, that you may attain Taqwa. (Al-Baqarah: 183)',
      ],
      hadithsAr: [
        'مَن صام رمضان إيماناً واحتساباً غُفِر له ما تقدّم من ذنبه. — متفق عليه',
        'إذا جاء رمضان فُتِحت أبواب الجنة وغُلِقت أبواب النار وصُفِدت الشياطين. — متفق عليه',
        'كل عمل ابن آدم يُضاعف، الحسنة عشر أمثالها إلى سبعمائة ضعف. قال الله عز وجل: إلا الصوم فإنه لي وأنا أجزي به. — متفق عليه',
      ],
      hadithsEn: [
        'Whoever fasts Ramadan out of faith and seeking reward, his previous sins will be forgiven. — Agreed upon',
        'When Ramadan begins, the gates of Paradise are opened, the gates of Hell are closed, and the devils are chained. — Agreed upon',
        'Every deed of the son of Adam is multiplied ten to seven hundred fold. Allah says: Except fasting, for it is for Me and I shall reward for it. — Agreed upon',
      ],
      tipsAr: [
        'ضع جدولاً لختم القرآن خلال الشهر',
        'حدّد وقتاً ثابتاً لقيام الليل',
        'جهّز قائمة أدعية للثلث الأخير من الليل',
        'خطط لصدقاتك مسبقاً',
        'قلّل من وسائل التواصل لتفرغ للعبادة',
      ],
      tipsEn: [
        'Set a schedule to complete the Quran during the month',
        'Fix a consistent time for night prayers (Qiyam)',
        'Prepare a list of duas for the last third of the night',
        'Plan your charity in advance',
        'Reduce social media to focus on worship',
      ],
      practicesAr: [
        'صلاة التراويح',
        'تلاوة القرآن الكريم',
        'الإكثار من الصدقة',
        'الاعتكاف في العشر الأواخر',
        'تحري ليلة القدر',
        'إفطار الصائمين',
      ],
      practicesEn: [
        'Taraweeh prayer',
        'Quran recitation',
        'Increased charity',
        'Itikaf in the last 10 nights',
        'Seeking Laylat al-Qadr',
        'Feeding those who fast',
      ],
    ),

    // ═══════════════════════════════════════════
    // EID AL-FITR
    // ═══════════════════════════════════════════
    'eid_al_fitr': EventContent(
      versesAr: [
        'وَلِتُكْمِلُوا الْعِدَّةَ وَلِتُكَبِّرُوا اللَّهَ عَلَىٰ مَا هَدَاكُمْ وَلَعَلَّكُمْ تَشْكُرُونَ (البقرة: 185)',
        'قَدْ أَفْلَحَ مَن تَزَكَّىٰ ﴿١٤﴾ وَذَكَرَ اسْمَ رَبِّهِ فَصَلَّىٰ ﴿١٥﴾ (الأعلى)',
      ],
      versesEn: [
        'And to complete the period and to glorify Allah for having guided you, and perhaps you will be grateful. (Al-Baqarah: 185)',
        'He has certainly succeeded who purifies himself, and mentions the name of his Lord and prays. (Al-Ala: 14-15)',
      ],
      hadithsAr: [
        'للصائم فرحتان: فرحة عند فطره وفرحة عند لقاء ربه. — متفق عليه',
        'فرض رسول الله ﷺ زكاة الفطر صاعاً من تمر أو صاعاً من شعير. — متفق عليه',
      ],
      hadithsEn: [
        'The fasting person has two moments of joy: when he breaks his fast and when he meets his Lord. — Agreed upon',
        'The Prophet ﷺ made Zakat al-Fitr obligatory: a Sa\' of dates or barley. — Agreed upon',
      ],
      tipsAr: [
        'أخرج زكاة الفطر قبل صلاة العيد',
        'اغتسل والبس أجمل ثيابك',
        'كبّر في الطريق إلى المصلى',
        'صِل أرحامك وأصلح ذات البين',
      ],
      tipsEn: [
        'Pay Zakat al-Fitr before the Eid prayer',
        'Take a bath and wear your best clothes',
        'Say Takbeer on the way to the prayer ground',
        'Visit family and mend relationships',
      ],
      practicesAr: [
        'صلاة العيد',
        'زكاة الفطر',
        'التكبير',
        'صلة الأرحام',
        'إدخال السرور على الأطفال',
      ],
      practicesEn: [
        'Eid prayer',
        'Zakat al-Fitr',
        'Takbeer',
        'Family visits',
        'Bringing joy to children',
      ],
    ),

    // ═══════════════════════════════════════════
    // DHUL HIJJAH START
    // ═══════════════════════════════════════════
    'dhul_hijjah_start': EventContent(
      versesAr: [
        'وَالْفَجْرِ ﴿١﴾ وَلَيَالٍ عَشْرٍ ﴿٢﴾ (الفجر)',
        'وَيَذْكُرُوا اسْمَ اللَّهِ فِي أَيَّامٍ مَّعْلُومَاتٍ (الحج: 28)',
      ],
      versesEn: [
        'By the dawn, and by the ten nights. (Al-Fajr: 1-2)',
        'And mention the name of Allah on known days. (Al-Hajj: 28)',
      ],
      hadithsAr: [
        'ما من أيام العمل الصالح فيها أحب إلى الله من هذه الأيام (يعني أيام العشر). — البخاري',
        'ما رُئي الشيطان يوماً هو فيه أصغر ولا أحقر ولا أدحر ولا أغيظ منه في يوم عرفة. — مالك',
      ],
      hadithsEn: [
        'There are no days in which righteous deeds are more beloved to Allah than these days (the ten days of Dhul Hijjah). — Al-Bukhari',
        'The devil is never seen more humiliated or enraged than on the Day of Arafah. — Malik',
      ],
      tipsAr: [
        'أكثر من التكبير والتهليل والتحميد',
        'صم التسع الأوائل وخاصة يوم عرفة',
        'تصدّق وأحسن إلى الناس',
        'أكثر من تلاوة القرآن',
      ],
      tipsEn: [
        'Increase Takbeer, Tahleel, and Tahmeed',
        'Fast the first nine days, especially Arafah',
        'Give charity and be kind to people',
        'Increase Quran recitation',
      ],
      practicesAr: [
        'التكبير المطلق',
        'صيام التسع',
        'الصدقة',
        'الذكر والدعاء',
      ],
      practicesEn: [
        'Unrestricted Takbeer',
        'Fasting the nine days',
        'Charity',
        'Dhikr and Dua',
      ],
    ),

    // ═══════════════════════════════════════════
    // DAY OF ARAFAH
    // ═══════════════════════════════════════════
    'day_of_arafah': EventContent(
      versesAr: [
        'الْيَوْمَ أَكْمَلْتُ لَكُمْ دِينَكُمْ وَأَتْمَمْتُ عَلَيْكُمْ نِعْمَتِي وَرَضِيتُ لَكُمُ الْإِسْلَامَ دِينًا (المائدة: 3)',
        'وَشَاهِدٍ وَمَشْهُودٍ (البروج: 3) — المشهود هو يوم عرفة',
      ],
      versesEn: [
        'This day I have perfected for you your religion and completed My favor upon you and have approved for you Islam as a religion. (Al-Ma\'idah: 3)',
        'And by the witnessed day. (Al-Buruj: 3) — The witnessed day is the Day of Arafah',
      ],
      hadithsAr: [
        'صيام يوم عرفة أحتسب على الله أن يكفّر السنة التي قبله والسنة التي بعده. — مسلم',
        'خير الدعاء دعاء يوم عرفة، وخير ما قلت أنا والنبيون من قبلي: لا إله إلا الله وحده لا شريك له. — الترمذي',
        'ما من يوم أكثر من أن يعتق الله فيه عبداً من النار من يوم عرفة. — مسلم',
      ],
      hadithsEn: [
        'Fasting on the Day of Arafah expiates the sins of the previous year and the coming year. — Muslim',
        'The best supplication is on the Day of Arafah, and the best I and the prophets before me said is: La ilaha illallah wahdahu la shareeka lah. — At-Tirmidhi',
        'There is no day on which Allah frees more people from the Fire than the Day of Arafah. — Muslim',
      ],
      tipsAr: [
        'صم يوم عرفة (لغير الحاج)',
        'أكثر من الدعاء خاصة بعد العصر',
        'أكثر من التهليل والذكر',
        'تب إلى الله توبة نصوحاً',
      ],
      tipsEn: [
        'Fast the Day of Arafah (for non-pilgrims)',
        'Make abundant dua, especially after Asr',
        'Increase in Tahleel and Dhikr',
        'Make sincere repentance to Allah',
      ],
      practicesAr: [
        'الصيام',
        'الإكثار من الدعاء',
        'التهليل والذكر',
        'التوبة والاستغفار',
      ],
      practicesEn: [
        'Fasting',
        'Abundant supplication',
        'Tahleel and Dhikr',
        'Repentance and seeking forgiveness',
      ],
    ),

    // ═══════════════════════════════════════════
    // EID AL-ADHA
    // ═══════════════════════════════════════════
    'eid_al_adha': EventContent(
      versesAr: [
        'فَصَلِّ لِرَبِّكَ وَانْحَرْ (الكوثر: 2)',
        'لَن يَنَالَ اللَّهَ لُحُومُهَا وَلَا دِمَاؤُهَا وَلَٰكِن يَنَالُهُ التَّقْوَىٰ مِنكُمْ (الحج: 37)',
        'وَفَدَيْنَاهُ بِذِبْحٍ عَظِيمٍ (الصافات: 107)',
      ],
      versesEn: [
        'So pray to your Lord and sacrifice. (Al-Kawthar: 2)',
        'Their meat will not reach Allah, nor will their blood, but what reaches Him is piety from you. (Al-Hajj: 37)',
        'And We ransomed him with a great sacrifice. (As-Saffat: 107)',
      ],
      hadithsAr: [
        'ما عمل ابن آدم يوم النحر أحب إلى الله من إهراقة الدم. — الترمذي',
        'أيام التشريق أيام أكل وشرب وذكر الله. — مسلم',
      ],
      hadithsEn: [
        'No deed of the son of Adam on the Day of Sacrifice is more beloved to Allah than the shedding of blood (sacrifice). — At-Tirmidhi',
        'The days of Tashreeq are days of eating, drinking, and remembering Allah. — Muslim',
      ],
      tipsAr: [
        'لا تأكل حتى تصلي صلاة العيد',
        'كبّر التكبير المقيد بعد كل صلاة',
        'وزّع الأضحية: ثلث لك وثلث للهدية وثلث للفقراء',
        'صِل رحمك وزُر أقاربك',
      ],
      tipsEn: [
        'Don\'t eat until after the Eid prayer',
        'Say the restricted Takbeer after every prayer',
        'Distribute the sacrifice: a third for you, a third as gift, a third for charity',
        'Visit and connect with relatives',
      ],
      practicesAr: [
        'صلاة العيد',
        'الأضحية',
        'التكبير المقيد',
        'صلة الأرحام',
      ],
      practicesEn: [
        'Eid prayer',
        'Sacrifice (Udhiyah)',
        'Restricted Takbeer',
        'Family visits',
      ],
    ),

    // ═══════════════════════════════════════════
    // ISLAMIC NEW YEAR
    // ═══════════════════════════════════════════
    'islamic_new_year': EventContent(
      versesAr: [
        'إِنَّ عِدَّةَ الشُّهُورِ عِندَ اللَّهِ اثْنَا عَشَرَ شَهْرًا فِي كِتَابِ اللَّهِ يَوْمَ خَلَقَ السَّمَاوَاتِ وَالْأَرْضَ مِنْهَا أَرْبَعَةٌ حُرُمٌ (التوبة: 36)',
      ],
      versesEn: [
        'Indeed, the number of months with Allah is twelve months in the register of Allah from the day He created the heavens and the earth; of these, four are sacred. (At-Tawbah: 36)',
      ],
      hadithsAr: [
        'أفضل الصيام بعد رمضان شهر الله المحرم. — مسلم',
      ],
      hadithsEn: [
        'The best fasting after Ramadan is fasting in the month of Allah, Muharram. — Muslim',
      ],
      tipsAr: [
        'تذكّر هجرة النبي ﷺ وتضحيات الصحابة',
        'جدّد نيتك وخطط لعام جديد من الطاعات',
        'أكثر من صيام شهر محرم',
      ],
      tipsEn: [
        'Reflect on the Prophet\'s ﷺ migration and the sacrifices of the Companions',
        'Renew your intentions and plan a year of worship',
        'Fast frequently in Muharram',
      ],
      practicesAr: [
        'التأمل في الهجرة النبوية',
        'صيام شهر محرم',
        'تجديد النية',
      ],
      practicesEn: [
        'Reflecting on the Prophet\'s migration',
        'Fasting in Muharram',
        'Renewing intentions',
      ],
    ),

    // ═══════════════════════════════════════════
    // ASHURA
    // ═══════════════════════════════════════════
    'ashura': EventContent(
      versesAr: [
        'وَلَقَدْ أَوْحَيْنَا إِلَىٰ مُوسَىٰ أَنْ أَسْرِ بِعِبَادِي فَاضْرِبْ لَهُمْ طَرِيقًا فِي الْبَحْرِ يَبَسًا (طه: 77)',
        'وَجَاوَزْنَا بِبَنِي إِسْرَائِيلَ الْبَحْرَ (الأعراف: 138)',
      ],
      versesEn: [
        'And We inspired Moses: Travel by night with My servants and strike for them a dry path through the sea. (Ta-Ha: 77)',
        'And We took the Children of Israel across the sea. (Al-A\'raf: 138)',
      ],
      hadithsAr: [
        'صيام يوم عاشوراء أحتسب على الله أن يكفّر السنة التي قبله. — مسلم',
        'لئن بقيت إلى قابل لأصومن التاسع (يعني مع عاشوراء). — مسلم',
        'نحن أحق بموسى منكم فصامه وأمر بصيامه. — متفق عليه',
      ],
      hadithsEn: [
        'Fasting the day of Ashura, I hope that Allah will expiate the sins of the year before it. — Muslim',
        'If I live until next year, I will fast the ninth day (along with Ashura). — Muslim',
        'We have more right to Moses than you. So he fasted it and ordered fasting on it. — Agreed upon',
      ],
      tipsAr: [
        'صم التاسع والعاشر من محرم',
        'تعلّم قصة موسى عليه السلام',
        'اغتنم الأجر بصيام هذا اليوم العظيم',
      ],
      tipsEn: [
        'Fast the 9th and 10th of Muharram',
        'Learn the story of Prophet Musa (Moses)',
        'Seize the reward by fasting this great day',
      ],
      practicesAr: [
        'صيام عاشوراء',
        'صيام التاسع معه',
        'الصدقة',
      ],
      practicesEn: [
        'Fasting Ashura',
        'Fasting the 9th with it',
        'Charity',
      ],
    ),

    // ═══════════════════════════════════════════
    // MAWLID AL-NABI
    // ═══════════════════════════════════════════
    'mawlid_al_nabi': EventContent(
      versesAr: [
        'لَقَدْ جَاءَكُمْ رَسُولٌ مِّنْ أَنفُسِكُمْ عَزِيزٌ عَلَيْهِ مَا عَنِتُّمْ حَرِيصٌ عَلَيْكُم بِالْمُؤْمِنِينَ رَءُوفٌ رَّحِيمٌ (التوبة: 128)',
        'وَمَا أَرْسَلْنَاكَ إِلَّا رَحْمَةً لِّلْعَالَمِينَ (الأنبياء: 107)',
        'إِنَّ اللَّهَ وَمَلَائِكَتَهُ يُصَلُّونَ عَلَى النَّبِيِّ ۚ يَا أَيُّهَا الَّذِينَ آمَنُوا صَلُّوا عَلَيْهِ وَسَلِّمُوا تَسْلِيمًا (الأحزاب: 56)',
      ],
      versesEn: [
        'There has come to you a Messenger from among yourselves. Grievous to him is what you suffer; concerned about you, and to the believers kind and merciful. (At-Tawbah: 128)',
        'And We have not sent you except as a mercy to the worlds. (Al-Anbiya: 107)',
        'Indeed, Allah and His angels send blessings upon the Prophet. O you who believe, send blessings upon him and greet him with peace. (Al-Ahzab: 56)',
      ],
      hadithsAr: [
        'سُئل النبي ﷺ عن صوم يوم الاثنين فقال: ذاك يوم وُلدت فيه ويوم بُعثت أو أُنزل عليّ فيه. — مسلم',
        'أنا دعوة إبراهيم وبشارة عيسى. — أحمد',
      ],
      hadithsEn: [
        'The Prophet ﷺ was asked about fasting on Monday. He said: That is the day I was born and the day I was sent or revelation came to me. — Muslim',
        'I am the supplication of Ibrahim and the glad tidings of Isa. — Ahmad',
      ],
      tipsAr: [
        'أكثر من الصلاة على النبي ﷺ',
        'ادرس السيرة النبوية',
        'طبّق سنة من سنن النبي ﷺ في حياتك',
        'شارك قصص النبي ﷺ مع عائلتك',
      ],
      tipsEn: [
        'Send abundant blessings upon the Prophet ﷺ',
        'Study the Prophet\'s biography (Seerah)',
        'Apply a Sunnah of the Prophet ﷺ in your life',
        'Share stories of the Prophet ﷺ with your family',
      ],
      practicesAr: [
        'الصلاة على النبي ﷺ',
        'دراسة السيرة',
        'صيام الاثنين',
        'التعلم من أخلاقه ﷺ',
      ],
      practicesEn: [
        'Sending blessings upon the Prophet ﷺ',
        'Studying the Seerah',
        'Fasting on Monday',
        'Learning from his ﷺ character',
      ],
    ),

    // ═══════════════════════════════════════════
    // ISRA & MI'RAJ
    // ═══════════════════════════════════════════
    'isra_miraj': EventContent(
      versesAr: [
        'سُبْحَانَ الَّذِي أَسْرَىٰ بِعَبْدِهِ لَيْلًا مِّنَ الْمَسْجِدِ الْحَرَامِ إِلَى الْمَسْجِدِ الْأَقْصَى الَّذِي بَارَكْنَا حَوْلَهُ (الإسراء: 1)',
        'وَلَقَدْ رَآهُ نَزْلَةً أُخْرَىٰ ﴿١٣﴾ عِندَ سِدْرَةِ الْمُنتَهَىٰ ﴿١٤﴾ (النجم)',
      ],
      versesEn: [
        'Exalted is He who took His Servant by night from al-Masjid al-Haram to al-Masjid al-Aqsa, whose surroundings We have blessed. (Al-Isra: 1)',
        'And he certainly saw him in another descent, at the Lote Tree of the Utmost Boundary. (An-Najm: 13-14)',
      ],
      hadithsAr: [
        'فُرضت الصلاة خمسين صلاة ثم لم أزل أرجع إلى ربي حتى جعلها خمساً. — متفق عليه',
        'أُتيت بالبراق فركبته حتى أتيت بيت المقدس. — مسلم',
      ],
      hadithsEn: [
        'The prayers were enjoined as fifty, then I kept going back to my Lord until He made them five. — Agreed upon',
        'I was brought the Buraq and rode it until I came to Bayt al-Maqdis. — Muslim',
      ],
      tipsAr: [
        'حافظ على الصلوات الخمس في وقتها',
        'تعلم قصة الإسراء والمعراج كاملة',
        'اعرف فضل المسجد الأقصى',
        'تدبّر آيات سورة الإسراء',
      ],
      tipsEn: [
        'Guard the five daily prayers on time',
        'Learn the full story of Isra and Mi\'raj',
        'Know the virtues of Masjid al-Aqsa',
        'Reflect on the verses of Surah Al-Isra',
      ],
      practicesAr: [
        'المحافظة على الصلاة',
        'تلاوة سورة الإسراء',
        'التعلم عن المسجد الأقصى',
      ],
      practicesEn: [
        'Guarding the prayer',
        'Reciting Surah Al-Isra',
        'Learning about Masjid al-Aqsa',
      ],
    ),

    // ═══════════════════════════════════════════
    // MID-SHA'BAN
    // ═══════════════════════════════════════════
    'mid_shaban': EventContent(
      versesAr: [
        'حم ﴿١﴾ وَالْكِتَابِ الْمُبِينِ ﴿٢﴾ إِنَّا أَنزَلْنَاهُ فِي لَيْلَةٍ مُّبَارَكَةٍ (الدخان: 1-3)',
      ],
      versesEn: [
        'Ha, Meem. By the clear Book. Indeed, We sent it down during a blessed night. (Ad-Dukhan: 1-3)',
      ],
      hadithsAr: [
        'إن الله ليطّلع في ليلة النصف من شعبان فيغفر لجميع خلقه إلا لمشرك أو مشاحن. — ابن ماجه',
        'كان النبي ﷺ يصوم شعبان إلا قليلاً. — متفق عليه',
      ],
      hadithsEn: [
        'Allah looks at His creation on the night of mid-Sha\'ban and forgives all except the polytheist and the one who harbors grudges. — Ibn Majah',
        'The Prophet ﷺ used to fast Sha\'ban, almost all of it. — Agreed upon',
      ],
      tipsAr: [
        'أكثر من الصيام في شعبان استعداداً لرمضان',
        'أصلح ذات البين وسامح الناس',
        'أكثر من الاستغفار والدعاء',
        'ابدأ التحضير لرمضان',
      ],
      tipsEn: [
        'Fast frequently in Sha\'ban to prepare for Ramadan',
        'Reconcile with others and forgive',
        'Increase in seeking forgiveness and supplication',
        'Start preparing for Ramadan',
      ],
      practicesAr: [
        'الصيام في شعبان',
        'الاستغفار',
        'إصلاح ذات البين',
        'التحضير لرمضان',
      ],
      practicesEn: [
        'Fasting in Sha\'ban',
        'Seeking forgiveness',
        'Reconciliation',
        'Preparing for Ramadan',
      ],
    ),
  };

  /// Get content for a specific event. Returns null if no content exists.
  static EventContent? getContent(String eventId) {
    return content[eventId];
  }
}
