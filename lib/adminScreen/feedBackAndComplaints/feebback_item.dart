class FeedbackItem {
  final String title;
  final String category;
  final String date;
  final bool isResolved;

  FeedbackItem({
    required this.title,
    required this.category,
    required this.date,
    required this.isResolved,
  });
}

class FeedbackService {
  final List<FeedbackItem> feedbackItems = [
    FeedbackItem(
      title: "Internet not working",
      category: "IT Support",
      date: "2025-01-01",
      isResolved: false,
    ),
    FeedbackItem(
      title: "AC malfunction in Hall A",
      category: "Maintenance",
      date: "2025-01-02",
      isResolved: false,
    ),
    FeedbackItem(
      title: "Late delivery of food",
      category: "Catering",
      date: "2024-12-31",
      isResolved: true, // Resolved
    ),
  ];
}
