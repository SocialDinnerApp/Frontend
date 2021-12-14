class EventItem {
  final String eventId;
  final String name;
  final String description;
  final String org_id;
  final int fee;
  final String date;
  final String registration_deadline;
  final String time_starter;
  final String time_main;
  final String time_dessert;
  final String city;
  final int zip_code;
  final bool isPublic;
  final int max_participants;

  EventItem({
    required this.eventId,
    required this.name,
    required this.description,
    required this.org_id,
    required this.fee,
    required this.date,
    required this.registration_deadline,
    required this.time_starter,
    required this.time_main,
    required this.time_dessert,
    required this.city,
    required this.zip_code,
    required this.isPublic,
    required this.max_participants,
  });
}