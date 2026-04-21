import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Ayyam'**
  String get appName;

  /// No description provided for @appSlogan.
  ///
  /// In en, this message translates to:
  /// **'Your companion to seize the seasons of goodness'**
  String get appSlogan;

  /// No description provided for @onboardingCard1Title.
  ///
  /// In en, this message translates to:
  /// **'Closer to What Matters'**
  String get onboardingCard1Title;

  /// No description provided for @onboardingCard1Body.
  ///
  /// In en, this message translates to:
  /// **'In the rush of daily life, Ayyam pulls you back to the spiritual moments that truly count.'**
  String get onboardingCard1Body;

  /// No description provided for @onboardingCard2Title.
  ///
  /// In en, this message translates to:
  /// **'The Golden Radar'**
  String get onboardingCard2Title;

  /// No description provided for @onboardingCard2Body.
  ///
  /// In en, this message translates to:
  /// **'Track sacred seasons with a dynamic countdown that builds anticipation for the days Allah loves most.'**
  String get onboardingCard2Body;

  /// No description provided for @onboardingCard3Title.
  ///
  /// In en, this message translates to:
  /// **'Never Miss a Moment'**
  String get onboardingCard3Title;

  /// No description provided for @onboardingCard3Body.
  ///
  /// In en, this message translates to:
  /// **'Gentle, precise local notifications tailored to your routine. Set your preferred alert time and dates to always be prepared for times of answered prayers.'**
  String get onboardingCard3Body;

  /// No description provided for @onboardingContinueBtn.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get onboardingContinueBtn;

  /// No description provided for @onboardingFinishBtn.
  ///
  /// In en, this message translates to:
  /// **'Finish & Start'**
  String get onboardingFinishBtn;

  /// No description provided for @notificationSetupTitle.
  ///
  /// In en, this message translates to:
  /// **'Notify me before events'**
  String get notificationSetupTitle;

  /// No description provided for @notificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsTitle;

  /// No description provided for @notificationOneWeek.
  ///
  /// In en, this message translates to:
  /// **'1 Week'**
  String get notificationOneWeek;

  /// No description provided for @notificationOneMonth.
  ///
  /// In en, this message translates to:
  /// **'1 Month'**
  String get notificationOneMonth;

  /// No description provided for @notificationThreeMonths.
  ///
  /// In en, this message translates to:
  /// **'3 Months'**
  String get notificationThreeMonths;

  /// No description provided for @notificationSixMonths.
  ///
  /// In en, this message translates to:
  /// **'6 Months'**
  String get notificationSixMonths;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile & Settings'**
  String get profileTitle;

  /// No description provided for @personalInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Personal Info'**
  String get personalInfoTitle;

  /// No description provided for @nameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameLabel;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @phoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phoneLabel;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'App Settings'**
  String get settingsTitle;

  /// No description provided for @languageLabel.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageLabel;

  /// No description provided for @themeLabel.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get themeLabel;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System Default'**
  String get themeSystem;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get themeDark;

  /// No description provided for @cardColorLabel.
  ///
  /// In en, this message translates to:
  /// **'Card Color'**
  String get cardColorLabel;

  /// No description provided for @notificationTimeLabel.
  ///
  /// In en, this message translates to:
  /// **'Notification Time'**
  String get notificationTimeLabel;

  /// No description provided for @developerInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Developer Info'**
  String get developerInfoTitle;

  /// No description provided for @feedbackTitle.
  ///
  /// In en, this message translates to:
  /// **'Suggestions & Feedback'**
  String get feedbackTitle;

  /// No description provided for @feedbackHint.
  ///
  /// In en, this message translates to:
  /// **'Share your thoughts or suggest a new feature...'**
  String get feedbackHint;

  /// No description provided for @sendFeedbackBtn.
  ///
  /// In en, this message translates to:
  /// **'Send Feedback'**
  String get sendFeedbackBtn;

  /// No description provided for @supportAppTitle.
  ///
  /// In en, this message translates to:
  /// **'Support the App'**
  String get supportAppTitle;

  /// No description provided for @vodafoneCashDesc.
  ///
  /// In en, this message translates to:
  /// **'Support development via Vodafone Cash:'**
  String get vodafoneCashDesc;

  /// No description provided for @copyNumberBtn.
  ///
  /// In en, this message translates to:
  /// **'Copy Number'**
  String get copyNumberBtn;

  /// No description provided for @tourProfileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile & Settings'**
  String get tourProfileTitle;

  /// No description provided for @tourProfileDesc.
  ///
  /// In en, this message translates to:
  /// **'Customize your app theme, language, and preferences here.'**
  String get tourProfileDesc;

  /// No description provided for @tourNotificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get tourNotificationsTitle;

  /// No description provided for @tourNotificationsDesc.
  ///
  /// In en, this message translates to:
  /// **'Manage your event alerts and reminders here.'**
  String get tourNotificationsDesc;

  /// No description provided for @tourEventCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Islamic Events'**
  String get tourEventCardTitle;

  /// No description provided for @tourEventCardDesc.
  ///
  /// In en, this message translates to:
  /// **'Tap any event to see countdowns, related Quran verses, hadiths, and tips.'**
  String get tourEventCardDesc;

  /// No description provided for @testNotificationBtn.
  ///
  /// In en, this message translates to:
  /// **'Test Notification'**
  String get testNotificationBtn;

  /// No description provided for @replayTourBtn.
  ///
  /// In en, this message translates to:
  /// **'Replay App Tour'**
  String get replayTourBtn;

  /// No description provided for @replayOnboardingBtn.
  ///
  /// In en, this message translates to:
  /// **'Replay Onboarding'**
  String get replayOnboardingBtn;

  /// No description provided for @privacyPolicyBtn.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicyBtn;

  /// No description provided for @personalInfoSection.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInfoSection;

  /// No description provided for @appSettingsSection.
  ///
  /// In en, this message translates to:
  /// **'App Settings'**
  String get appSettingsSection;

  /// No description provided for @advancedSettingsSection.
  ///
  /// In en, this message translates to:
  /// **'Advanced Settings'**
  String get advancedSettingsSection;

  /// No description provided for @tourSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'App Tour'**
  String get tourSectionTitle;

  /// No description provided for @onboardingSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Onboarding (Home Screens)'**
  String get onboardingSectionTitle;

  /// No description provided for @supportSection.
  ///
  /// In en, this message translates to:
  /// **'Support & Info'**
  String get supportSection;

  /// No description provided for @notificationDaysBeforeSettings.
  ///
  /// In en, this message translates to:
  /// **'Alert Days Preference'**
  String get notificationDaysBeforeSettings;

  /// No description provided for @notificationPermissionLabel.
  ///
  /// In en, this message translates to:
  /// **'Notification Permissions'**
  String get notificationPermissionLabel;

  /// No description provided for @notificationPermissionDesc.
  ///
  /// In en, this message translates to:
  /// **'Manage app notifications in your system settings.'**
  String get notificationPermissionDesc;

  /// No description provided for @testNotificationSuccess.
  ///
  /// In en, this message translates to:
  /// **'Test notification sent successfully!'**
  String get testNotificationSuccess;

  /// No description provided for @testNotificationFail.
  ///
  /// In en, this message translates to:
  /// **'Failed to send. Please check your system notification permissions.'**
  String get testNotificationFail;

  /// No description provided for @notificationExampleTitle.
  ///
  /// In en, this message translates to:
  /// **'Notification Examples'**
  String get notificationExampleTitle;

  /// No description provided for @notificationExampleDesc.
  ///
  /// In en, this message translates to:
  /// **'Here is an illustrative example of how upcoming Islamic events will appear as notifications on your phone.'**
  String get notificationExampleDesc;

  /// No description provided for @notificationExampleEvent1.
  ///
  /// In en, this message translates to:
  /// **'10 days until Ramadan'**
  String get notificationExampleEvent1;

  /// No description provided for @notificationExampleEvent2.
  ///
  /// In en, this message translates to:
  /// **'Tomorrow: Eid Al-Fitr'**
  String get notificationExampleEvent2;

  /// No description provided for @eventsToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get eventsToday;

  /// No description provided for @eventsPassed.
  ///
  /// In en, this message translates to:
  /// **'Passed'**
  String get eventsPassed;

  /// No description provided for @eventsDaysLeft.
  ///
  /// In en, this message translates to:
  /// **'days left'**
  String get eventsDaysLeft;

  /// No description provided for @eventsRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get eventsRetry;

  /// No description provided for @eventsNoEvents.
  ///
  /// In en, this message translates to:
  /// **'No events found.'**
  String get eventsNoEvents;

  /// No description provided for @eventsOfflineMode.
  ///
  /// In en, this message translates to:
  /// **'Offline mode - showing cached events'**
  String get eventsOfflineMode;

  /// No description provided for @noInternetTitle.
  ///
  /// In en, this message translates to:
  /// **'No Internet Connection'**
  String get noInternetTitle;

  /// No description provided for @noInternetMessage.
  ///
  /// In en, this message translates to:
  /// **'Please check your connection and try again. The app needs internet for the first load.'**
  String get noInternetMessage;

  /// No description provided for @eventDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Event Details'**
  String get eventDetailsTitle;

  /// No description provided for @aboutEventLabel.
  ///
  /// In en, this message translates to:
  /// **'About the event:'**
  String get aboutEventLabel;

  /// No description provided for @gregorianDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Gregorian Date'**
  String get gregorianDateLabel;

  /// No description provided for @hijriDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Hijri Date'**
  String get hijriDateLabel;

  /// No description provided for @versesSection.
  ///
  /// In en, this message translates to:
  /// **'Quran Verses'**
  String get versesSection;

  /// No description provided for @hadithsSection.
  ///
  /// In en, this message translates to:
  /// **'Prophetic Hadiths'**
  String get hadithsSection;

  /// No description provided for @tipsSection.
  ///
  /// In en, this message translates to:
  /// **'How to Prepare'**
  String get tipsSection;

  /// No description provided for @practicesSection.
  ///
  /// In en, this message translates to:
  /// **'Recommended Practices'**
  String get practicesSection;

  /// No description provided for @daysRemaining.
  ///
  /// In en, this message translates to:
  /// **'days remaining'**
  String get daysRemaining;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
