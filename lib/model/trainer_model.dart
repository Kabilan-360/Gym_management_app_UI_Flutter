class Trainer {
  String id;
  String name;
  String specialization;
  String contact;
  String availability;
  List<String> assignedMembers; // Member IDs
  double rating;

  Trainer({
    required this.id,
    required this.name,
    required this.specialization,
    required this.contact,
    required this.availability,
    this.assignedMembers = const [],
    this.rating = 0.0,
  });
}
