class AttendanceRecord {
  String id;
  String userId; // Member or staff ID
  String name;
  String role; // Member, Trainer, Staff
  DateTime checkIn;
  DateTime? checkOut;

  AttendanceRecord({
    required this.id,
    required this.userId,
    required this.name,
    required this.role,
    required this.checkIn,
    this.checkOut,
  });
}
