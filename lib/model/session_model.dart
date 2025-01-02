class Session {
  final String id;
  final String name;
  final String type;
  final DateTime date;
  final String trainerId;
  final List<String> memberIds; // List of member IDs attending
  final int capacity;
  final String status; // E.g., "Active", "Completed", "Cancelled"

  Session({
    required this.id,
    required this.name,
    required this.type,
    required this.date,
    required this.trainerId,
    required this.memberIds,
    required this.capacity,
    required this.status,
  });
}
