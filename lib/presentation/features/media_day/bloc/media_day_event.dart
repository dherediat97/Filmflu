part of 'media_day_bloc.dart';

@freezed
class MediaDayEvent with _$MediaDayEvent {
  const factory MediaDayEvent.fetchMediaDataDay() = _FetchMediaDataDay;
}
