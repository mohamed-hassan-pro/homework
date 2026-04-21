import 'package:flutter_bloc/flutter_bloc.dart';
import '../../home/data/models/islamic_event.dart';
import '../data/notification_repository.dart';

abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepository _repository;

  NotificationCubit(this._repository) : super(NotificationInitial()) {
    _init();
  }

  Future<void> _init() async {
    await _repository.init();
  }

  Future<void> updateSchedules(List<IslamicEvent> events) async {
    await _repository.scheduleAll(events);
  }
}
