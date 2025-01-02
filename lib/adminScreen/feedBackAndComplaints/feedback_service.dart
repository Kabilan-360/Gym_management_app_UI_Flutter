import 'package:gym_management_app/model/feedback_model.dart';

class FeedbackService {
  List<FeedbackItem> _feedbackItems = [];

  List<FeedbackItem> get feedbackItems => _feedbackItems;

  void addFeedback(FeedbackItem feedback) {
    _feedbackItems.add(feedback);
  }

  void resolveFeedback(String id) {
    final index = _feedbackItems.indexWhere((item) => item.id == id);
    if (index != -1) {
      _feedbackItems[index] = FeedbackItem(
        id: _feedbackItems[index].id,
        title: _feedbackItems[index].title,
        description: _feedbackItems[index].description,
        category: _feedbackItems[index].category,
        date: _feedbackItems[index].date,
        isResolved: true,
      );
    }
  }
}
