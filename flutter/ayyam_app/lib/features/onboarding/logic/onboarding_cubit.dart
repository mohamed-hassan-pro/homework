import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/services/storage_service.dart';

abstract class OnboardingState extends Equatable {
  const OnboardingState();
  @override
  List<Object?> get props => [];
}

class OnboardingInitial extends OnboardingState {}

class OnboardingSaving extends OnboardingState {}

class OnboardingComplete extends OnboardingState {}

class OnboardingError extends OnboardingState {
  final String message;
  const OnboardingError(this.message);
  @override
  List<Object?> get props => [message];
}

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  Future<void> completeOnboarding({
    required Map<int, bool> notificationPrefs,
  }) async {
    emit(OnboardingSaving());
    try {
      // Mark onboarded
      await StorageService.userBox.put('is_onboarded', true);

      // Save notification preferences
      for (final entry in notificationPrefs.entries) {
        await StorageService.saveNotificationPreference(entry.key, entry.value);
      }
      
      emit(OnboardingComplete());
    } catch (e) {
      emit(OnboardingError(e.toString()));
      emit(OnboardingInitial()); // Reset after error
    }
  }
}
