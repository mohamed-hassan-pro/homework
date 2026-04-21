import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ayyam_app/l10n/generated/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import '../../../../core/theme/app_theme.dart';
import '../../logic/onboarding_cubit.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _isStep2 = false;

  final Map<int, bool> _prefs = {
    7: true,
    30: false,
    90: false,
    180: false,
  };

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      setState(() {
        _isStep2 = true;
      });
    }
  }

  void _submit() {
    context.read<OnboardingCubit>().completeOnboarding(
      notificationPrefs: _prefs,
    );
  }

  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 10,
      width: _currentPage == index ? 24 : 10,
      decoration: BoxDecoration(
        color: _currentPage == index ? AppTheme.accentGold : Colors.grey.shade600,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  Widget _buildValueCard(String title, String body, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 100, color: Theme.of(context).primaryColor),
          const SizedBox(height: 48),
          Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppTheme.accentGold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            body,
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).colorScheme.onSurface,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSwitch(String title, int days) {
    return ListTile(
      title: Text(title, style: TextStyle(color: Theme.of(context).colorScheme.onSurface)),
      trailing: Platform.isIOS
          ? CupertinoSwitch(
              value: _prefs[days]!,
              activeTrackColor: Theme.of(context).primaryColor,
              onChanged: (val) => setState(() => _prefs[days] = val),
            )
          : Switch(
              value: _prefs[days]!,
              activeTrackColor: Theme.of(context).primaryColor,
              onChanged: (val) => setState(() => _prefs[days] = val),
            ),
    );
  }

  Widget _buildNotificationSetup(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(Icons.notifications_active, size: 80, color: Theme.of(context).primaryColor),
          const SizedBox(height: 24),
          Text(
            l10n.notificationSetupTitle,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppTheme.accentGold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Card(
            color: Theme.of(context).cardTheme.color,
            child: Column(
              children: [
                _buildSwitch(l10n.notificationOneWeek, 7),
                _buildSwitch(l10n.notificationOneMonth, 30),
                _buildSwitch(l10n.notificationThreeMonths, 90),
                _buildSwitch(l10n.notificationSixMonths, 180),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocListener<OnboardingCubit, OnboardingState>(
      listener: (context, state) {
        if (state is OnboardingComplete) {
          context.go('/home');
        } else if (state is OnboardingError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message, style: const TextStyle(color: Colors.white)),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: _isStep2 
                    ? _buildNotificationSetup(l10n)
                    : PageView(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipOval(
                                  child: Image.asset(
                                    'assets/ayyam_app_logo.webp',
                                    height: 120,
                                    width: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 48),
                                Text(
                                  l10n.onboardingCard1Title,
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: AppTheme.accentGold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  l10n.onboardingCard1Body,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Theme.of(context).colorScheme.onSurface,
                                    height: 1.5,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          _buildValueCard(
                            l10n.onboardingCard2Title,
                            l10n.onboardingCard2Body,
                            Icons.track_changes,
                          ),
                          _buildValueCard(
                            l10n.onboardingCard3Title,
                            l10n.onboardingCard3Body,
                            Icons.notifications_active,
                          ),
                        ],
                      ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Column(
                  children: [
                    if (!_isStep2)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (index) => _buildDot(index)),
                      ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: BlocBuilder<OnboardingCubit, OnboardingState>(
                        builder: (context, state) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: state is OnboardingSaving 
                                ? null 
                                : (_isStep2 ? _submit : _nextPage),
                            child: state is OnboardingSaving
                                ? const CircularProgressIndicator(color: Colors.white)
                                : Text(
                                    _isStep2 
                                      ? l10n.onboardingFinishBtn 
                                      : l10n.onboardingContinueBtn,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
