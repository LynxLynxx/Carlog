part of 'events_cubit.dart';

enum FirebaseEventType {
  contactPage,
  homePage,
  suggestPage,
  sendMail,
  redirecToRSApps,
}

@freezed
class EventsState with _$EventsState {
  const factory EventsState() = _EventsState;
}
