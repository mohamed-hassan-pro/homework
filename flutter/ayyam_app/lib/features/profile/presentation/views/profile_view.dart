import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ayyam_app/l10n/generated/app_localizations.dart';
import '../../../../core/services/storage_service.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/settings/settings_cubit.dart';
import '../../../../core/settings/settings_state.dart';
import '../../../home/logic/events_cubit.dart';
import '../../../home/logic/events_state.dart';
import '../../../notifications/logic/notification_cubit.dart';
import '../../../notifications/data/notification_repository.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _feedbackCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameCtrl.text = StorageService.userBox.get('name', defaultValue: '');
    _emailCtrl.text = StorageService.userBox.get('email', defaultValue: '');
    _phoneCtrl.text = StorageService.userBox.get('phone', defaultValue: '');

    _nameCtrl.addListener(_saveData);
    _emailCtrl.addListener(_saveData);
    _phoneCtrl.addListener(_saveData);
  }

  void _saveData() {
    StorageService.saveUser(_nameCtrl.text, _emailCtrl.text, _phoneCtrl.text);
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _feedbackCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final fillColor = isDark ? AppTheme.surfaceDark : Colors.grey.shade200;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.profileTitle)),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Icon(Icons.account_circle,
              size: 80, color: Theme.of(context).primaryColor),
          const SizedBox(height: 24),
          _buildExpansionTile(
            context: context,
            title: l10n.personalInfoSection,
            icon: Icons.person_outline,
            initiallyExpanded: true,
            children: [
              _buildTextField(_nameCtrl, l10n.nameLabel, Icons.person),
              const SizedBox(height: 12),
              _buildTextField(_emailCtrl, l10n.emailLabel, Icons.email,
                  TextInputType.emailAddress),
              const SizedBox(height: 12),
              _buildTextField(_phoneCtrl, l10n.phoneLabel, Icons.phone,
                  TextInputType.phone),
            ],
          ),
          const SizedBox(height: 12),
          _buildExpansionTile(
            context: context,
            title: "إعدادات المظهر", // Theme Settings
            icon: Icons.palette,
            children: [
              _buildSettingsTile(
                  context: context,
                  icon: Icons.language,
                  label: l10n.languageLabel,
                  fillColor: fillColor,
                  child: _buildLanguageSelector(l10n)),
              const SizedBox(height: 12),
              _buildSettingsTile(
                  context: context,
                  icon: Icons.dark_mode,
                  label: l10n.themeLabel,
                  fillColor: fillColor,
                  child: _buildThemeSelector(l10n)),
              const SizedBox(height: 12),
              _buildSettingsTile(
                  context: context,
                  icon: Icons.color_lens,
                  label: l10n.cardColorLabel,
                  fillColor: fillColor,
                  child: _buildCardColorSelector(l10n)),
            ],
          ),
          const SizedBox(height: 12),
          _buildExpansionTile(
            context: context,
            title: l10n.notificationsTitle, // Notification Settings
            icon: Icons.notifications_active,
            children: [
              _buildSettingsTile(
                context: context,
                icon: Icons.security,
                label: l10n.notificationPermissionLabel,
                fillColor: fillColor,
                child: FutureBuilder<bool>(
                  future: context
                      .read<NotificationRepository>()
                      .isPermissionGranted(),
                  builder: (context, snapshot) {
                    final isGranted = snapshot.data ?? false;
                    return ListTile(
                      leading: Icon(
                          isGranted ? Icons.check_circle : Icons.error,
                          color: isGranted ? Colors.green : Colors.orange),
                      title: Text(l10n.notificationPermissionLabel),
                      subtitle: Text(l10n.notificationPermissionDesc,
                          style: const TextStyle(fontSize: 12)),
                      trailing: Switch(
                        value: isGranted,
                        onChanged: (val) async {
                          if (val) {
                            await context
                                .read<NotificationRepository>()
                                .requestPermission();
                          } else {
                            await context
                                .read<NotificationRepository>()
                                .openSystemSettings();
                          }
                          if (mounted) setState(() {});
                        },
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              _buildSettingsTile(
                  context: context,
                  icon: Icons.music_note,
                  label: "صوت التنبيه",
                  fillColor: fillColor,
                  child: _buildSoundSelector(l10n)),
              const SizedBox(height: 12),
              _buildSettingsTile(
                  context: context,
                  icon: Icons.access_time,
                  label: l10n.notificationTimeLabel,
                  fillColor: fillColor,
                  child: _buildNotificationTimeSelector(l10n)),
              const SizedBox(height: 12),
              _buildSettingsTile(
                  context: context,
                  icon: Icons.date_range,
                  label: l10n.notificationDaysBeforeSettings,
                  fillColor: fillColor,
                  child: _buildNotificationDaysSelector(l10n)),
              const SizedBox(height: 12),
              _buildSettingsTile(
                context: context,
                icon: Icons.notifications_none,
                label: l10n.testNotificationBtn,
                fillColor: fillColor,
                child: ListTile(
                  leading:
                      Icon(Icons.send, color: Theme.of(context).primaryColor),
                  title: Text(l10n.testNotificationBtn),
                  onTap: () async {
                    final messenger = ScaffoldMessenger.of(context);
                    final success = await context
                        .read<NotificationRepository>()
                        .showTestNotification(
                            l10n.appName, l10n.testNotificationBtn);
                    messenger.showSnackBar(
                      SnackBar(
                        content: Text(success
                            ? l10n.testNotificationSuccess
                            : l10n.testNotificationFail),
                        backgroundColor: success ? Colors.green : Colors.red,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildExpansionTile(
            context: context,
            title: "إدارة التطبيق", // App Management
            icon: Icons.settings_applications,
            children: [
              _buildSettingsTile(
                context: context,
                icon: Icons.explore,
                label: l10n.tourSectionTitle,
                fillColor: fillColor,
                child: ListTile(
                  leading: Icon(Icons.explore,
                      color: Theme.of(context).primaryColor),
                  title: Text(l10n.replayTourBtn),
                  onTap: () async {
                    await StorageService.saveForceShowcase(true);
                    if (context.mounted) context.go('/home');
                  },
                ),
              ),
              const SizedBox(height: 12),
              _buildSettingsTile(
                context: context,
                icon: Icons.play_lesson,
                label: l10n.onboardingSectionTitle,
                fillColor: fillColor,
                child: ListTile(
                  leading: Icon(Icons.reset_tv,
                      color: Theme.of(context).primaryColor),
                  title: Text(l10n.replayOnboardingBtn),
                  onTap: () async {
                    await StorageService.resetOnboarding();
                    if (context.mounted) context.go('/onboarding');
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, IconData icon,
      [TextInputType keyboardType = TextInputType.text]) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Theme.of(context).primaryColor),
      ),
    );
  }

  /// A styled container that matches the TextField look — rounded, filled, separate.
  Widget _buildSettingsTile({
    required BuildContext context,
    required IconData icon,
    required String label,
    required Color fillColor,
    required Widget child,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Material(
          color: Colors.transparent,
          child: child,
        ),
      ),
    );
  }

  Widget _buildLanguageSelector(AppLocalizations l10n) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        final currentLabel =
            state.locale.languageCode == 'ar' ? 'العربية' : 'English';
        return ListTile(
          leading: Icon(Icons.language, color: Theme.of(context).primaryColor),
          title: Text(l10n.languageLabel),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                currentLabel,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 4),
              Icon(Icons.chevron_right,
                  color: Theme.of(context).primaryColor, size: 20),
            ],
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          onTap: () => _showSelectionSheet<String>(
            context: context,
            title: l10n.languageLabel,
            options: const ['en', 'ar'],
            labels: const ['English', 'العربية'],
            icons: const [Icons.language, Icons.language],
            currentValue: state.locale.languageCode,
            onSelected: (val) =>
                context.read<SettingsCubit>().changeLanguage(val),
          ),
        );
      },
    );
  }

  Widget _buildThemeSelector(AppLocalizations l10n) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        String currentLabel;
        IconData currentIcon;
        switch (state.themeMode) {
          case ThemeMode.light:
            currentLabel = l10n.themeLight;
            currentIcon = Icons.light_mode;
            break;
          case ThemeMode.dark:
            currentLabel = l10n.themeDark;
            currentIcon = Icons.dark_mode;
            break;
          default:
            currentLabel = l10n.themeSystem;
            currentIcon = Icons.settings_brightness;
        }
        return ListTile(
          leading: Icon(currentIcon, color: Theme.of(context).primaryColor),
          title: Text(l10n.themeLabel),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                currentLabel,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 4),
              Icon(Icons.chevron_right,
                  color: Theme.of(context).primaryColor, size: 20),
            ],
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          onTap: () => _showSelectionSheet<ThemeMode>(
            context: context,
            title: l10n.themeLabel,
            options: const [ThemeMode.system, ThemeMode.light, ThemeMode.dark],
            labels: [l10n.themeSystem, l10n.themeLight, l10n.themeDark],
            icons: const [
              Icons.settings_brightness,
              Icons.light_mode,
              Icons.dark_mode
            ],
            currentValue: state.themeMode,
            onSelected: (val) => context.read<SettingsCubit>().changeTheme(val),
          ),
        );
      },
    );
  }

  Widget _buildCardColorSelector(AppLocalizations l10n) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        final currentColor = CardAccentColors.get(state.cardColorIndex);
        final currentName = isArabic
            ? CardAccentColors.namesAr[state.cardColorIndex]
            : CardAccentColors.namesEn[state.cardColorIndex];
        return ListTile(
          leading: Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: currentColor,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white30, width: 2),
            ),
          ),
          title: Text(l10n.cardColorLabel),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                currentName,
                style: TextStyle(
                  color: currentColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 4),
              Icon(Icons.chevron_right, color: currentColor, size: 20),
            ],
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          onTap: () => _showColorPickerSheet(context, state.cardColorIndex),
        );
      },
    );
  }

  void _showColorPickerSheet(BuildContext context, int currentIndex) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final l10n = AppLocalizations.of(context)!;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) {
        return Container(
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF252525) : Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade500,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Text(
                l10n.cardColorLabel,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.accentGold,
                ),
              ),
              const SizedBox(height: 20),
              // Color Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemCount: CardAccentColors.colors.length,
                itemBuilder: (context, i) {
                  final isSelected = i == currentIndex;
                  final color = CardAccentColors.colors[i];
                  final name = isArabic
                      ? CardAccentColors.namesAr[i]
                      : CardAccentColors.namesEn[i];
                  return GestureDetector(
                    onTap: () {
                      context.read<SettingsCubit>().changeCardColor(i);
                      Navigator.pop(ctx);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected
                                  ? AppTheme.accentGold
                                  : Colors.transparent,
                              width: 3,
                            ),
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                      color: color.withValues(alpha: 0.4),
                                      blurRadius: 12,
                                      spreadRadius: 2,
                                    )
                                  ]
                                : [],
                          ),
                          child: isSelected
                              ? const Icon(Icons.check,
                                  color: Colors.white, size: 22)
                              : null,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: isSelected
                                ? color
                                : (isDark ? Colors.white60 : Colors.black54),
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  /// Shows a beautiful bottom sheet with radio-style selection.
  void _showSelectionSheet<T>({
    required BuildContext context,
    required String title,
    required List<T> options,
    required List<String> labels,
    required List<IconData> icons,
    required T currentValue,
    required ValueChanged<T> onSelected,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) {
        return Container(
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF252525) : Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle bar
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade500,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              // Title
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.accentGold,
                ),
              ),
              const SizedBox(height: 16),
              // Options
              ...List.generate(options.length, (i) {
                final isSelected = options[i] == currentValue;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Material(
                    color: isSelected
                        ? Theme.of(context).primaryColor.withValues(alpha: 0.15)
                        : (isDark
                            ? AppTheme.surfaceDark
                            : Colors.grey.shade100),
                    borderRadius: BorderRadius.circular(12),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        onSelected(options[i]);
                        Navigator.pop(ctx);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                        child: Row(
                          children: [
                            Icon(
                              icons[i],
                              color: isSelected
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey,
                              size: 22,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                labels[i],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: isSelected
                                      ? FontWeight.w700
                                      : FontWeight.w500,
                                  color: isSelected
                                      ? Theme.of(context).primaryColor
                                      : (isDark
                                          ? Colors.white70
                                          : Colors.black87),
                                ),
                              ),
                            ),
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 250),
                              child: isSelected
                                  ? Icon(Icons.check_circle,
                                      color: Theme.of(context).primaryColor,
                                      key: const ValueKey(true))
                                  : Icon(Icons.circle_outlined,
                                      color: Colors.grey.shade400,
                                      key: const ValueKey(false)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSoundSelector(AppLocalizations l10n) {
    final currentUri = StorageService.getNotificationSoundUri();
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    final displayLabel = currentUri != null
        ? (isArabic ? "نغمة مخصصة" : "Custom Tone")
        : (isArabic ? "الافتراضية" : "Default");

    return ListTile(
      leading: Icon(Icons.music_note, color: Theme.of(context).primaryColor),
      title: Text(isArabic ? "صوت التنبيه" : "Notification Sound"),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            displayLabel,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 4),
          Icon(Icons.chevron_right,
              color: Theme.of(context).primaryColor, size: 20),
        ],
      ),
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (ctx) {
            return Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Theme.of(ctx).cardColor,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    isArabic ? "اختر صوت التنبيه" : "Choose Notification Sound",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  // Default system sound
                  ListTile(
                    leading: Icon(Icons.notifications_active,
                        color: Theme.of(ctx).primaryColor),
                    title: Text(isArabic ? "الصوت الافتراضي" : "Default Sound"),
                    trailing: currentUri == null
                        ? Icon(Icons.check_circle,
                            color: Theme.of(ctx).primaryColor)
                        : null,
                    onTap: () async {
                      await StorageService.saveNotificationSoundUri(null);
                      if (mounted) setState(() {});
                      if (ctx.mounted) Navigator.pop(ctx);
                    },
                  ),
                  // Pick from system ringtones (Android)
                  ListTile(
                    leading: Icon(Icons.library_music,
                        color: Theme.of(ctx).primaryColor),
                    title: Text(isArabic
                        ? "اختيار نغمة من الجهاز"
                        : "Pick from Device Ringtones"),
                    subtitle: currentUri != null
                        ? Text(
                            isArabic
                                ? "✓ تم اختيار نغمة مخصصة"
                                : "✓ Custom tone selected",
                            style: const TextStyle(
                                fontSize: 12, color: Colors.green),
                          )
                        : null,
                    onTap: () async {
                      final repo = context.read<NotificationRepository>();
                      final uri = await repo.pickSystemRingtone();
                      if (uri != null) {
                        await StorageService.saveNotificationSoundUri(uri);
                        if (mounted) setState(() {});
                      }
                      if (ctx.mounted) Navigator.pop(ctx);
                    },
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildNotificationTimeSelector(AppLocalizations l10n) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        final timeStr = state.notificationTime.format(context);
        return ListTile(
          leading:
              Icon(Icons.access_time, color: Theme.of(context).primaryColor),
          title: Text(l10n.notificationTimeLabel),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                timeStr,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 4),
              Icon(Icons.chevron_right,
                  color: Theme.of(context).primaryColor, size: 20),
            ],
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          onTap: () async {
            final newTime = await showTimePicker(
              context: context,
              initialTime: state.notificationTime,
            );
            if (newTime != null && context.mounted) {
              await context
                  .read<SettingsCubit>()
                  .changeNotificationTime(newTime);

              if (!context.mounted) return;

              // Reschedule notifications with new time
              final eventsState = context.read<EventsCubit>().state;
              if (eventsState is EventsLoaded) {
                context
                    .read<NotificationCubit>()
                    .updateSchedules(eventsState.events);
              }
            }
          },
        );
      },
    );
  }

  Widget _buildNotificationDaysSelector(AppLocalizations l10n) {
    return ListTile(
      leading: Icon(Icons.date_range, color: Theme.of(context).primaryColor),
      title: Text(l10n.notificationDaysBeforeSettings),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.chevron_right,
              color: Theme.of(context).primaryColor, size: 20),
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onTap: () => _showNotificationDaysSheet(context, l10n),
    );
  }

  void _showNotificationDaysSheet(BuildContext context, AppLocalizations l10n) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final prefs = {
      7: StorageService.getNotificationPreference(7),
      30: StorageService.getNotificationPreference(30),
      90: StorageService.getNotificationPreference(90),
      180: StorageService.getNotificationPreference(180),
    };

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setStateSheet) {
            return Container(
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF252525) : Colors.white,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(24)),
              ),
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  Text(
                    l10n.notificationDaysBeforeSettings,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.accentGold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildDaySwitch(
                      7, l10n.notificationOneWeek, prefs, setStateSheet),
                  _buildDaySwitch(
                      30, l10n.notificationOneMonth, prefs, setStateSheet),
                  _buildDaySwitch(
                      90, l10n.notificationThreeMonths, prefs, setStateSheet),
                  _buildDaySwitch(
                      180, l10n.notificationSixMonths, prefs, setStateSheet),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildDaySwitch(
      int days, String title, Map<int, bool> prefs, StateSetter setStateSheet) {
    return ListTile(
      title: Text(title),
      trailing: Switch(
        value: prefs[days]!,
        activeTrackColor: Theme.of(context).primaryColor,
        onChanged: (val) async {
          setStateSheet(() => prefs[days] = val);
          await StorageService.saveNotificationPreference(days, val);
          if (mounted) {
            final eventsState = context.read<EventsCubit>().state;
            if (eventsState is EventsLoaded) {
              context
                  .read<NotificationCubit>()
                  .updateSchedules(eventsState.events);
            }
          }
        },
      ),
    );
  }

  Widget _buildExpansionTile({
    required BuildContext context,
    required String title,
    required IconData icon,
    required List<Widget> children,
    bool initiallyExpanded = false,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final fillColor = isDark ? AppTheme.surfaceDark : Colors.grey.shade100;

    return Container(
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
            color: Theme.of(context).primaryColor.withValues(alpha: 0.1)),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: initiallyExpanded,
          leading: Icon(icon, color: Theme.of(context).primaryColor),
          title: Text(title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          iconColor: Theme.of(context).primaryColor,
          collapsedIconColor: Colors.grey,
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          children: children,
        ),
      ),
    );
  }
}
