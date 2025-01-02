class FeedbackItem {
  final String id;
  final String title;
  final String description;
  final String category; // E.g., "Service", "Trainer", "Equipment"
  final DateTime date;
  final bool isResolved;

  FeedbackItem({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.date,
    this.isResolved = false,
  });
}
