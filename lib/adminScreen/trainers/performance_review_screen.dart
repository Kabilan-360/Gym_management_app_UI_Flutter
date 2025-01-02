import 'package:flutter/material.dart';

// A simple model for performance reviews
class PerformanceReview {
  final String memberName;
  final String trainerName;
  final double rating;
  final String feedback;

  PerformanceReview({
    required this.memberName,
    required this.trainerName,
    required this.rating,
    required this.feedback,
  });
}

class PerformanceReviewScreen extends StatefulWidget {
  @override
  _PerformanceReviewScreenState createState() =>
      _PerformanceReviewScreenState();
}

class _PerformanceReviewScreenState extends State<PerformanceReviewScreen> {
  List<PerformanceReview> reviews = [
    PerformanceReview(
      memberName: 'Alice',
      trainerName: 'John Doe',
      rating: 4.5,
      feedback: 'Great training session!',
    ),
    PerformanceReview(
      memberName: 'Bob',
      trainerName: 'Jane Smith',
      rating: 4.8,
      feedback: 'Very knowledgeable and helpful.',
    ),
  ];

  final TextEditingController memberController = TextEditingController();
  final TextEditingController trainerController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();
  final TextEditingController feedbackController = TextEditingController();

  void addReview() {
    final newReview = PerformanceReview(
      memberName: memberController.text,
      trainerName: trainerController.text,
      rating: double.tryParse(ratingController.text) ?? 0.0,
      feedback: feedbackController.text,
    );

    setState(() {
      reviews.add(newReview);
    });

    // Clear the form fields after submission
    memberController.clear();
    trainerController.clear();
    ratingController.clear();
    feedbackController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Performance Reviews'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Display the list of reviews
            Expanded(
              child: ListView.builder(
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  final review = reviews[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text('${review.memberName} - ${review.trainerName}'),
                      subtitle: Text('${review.feedback}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star, color: Colors.amber),
                          Text(review.rating.toString()),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Add new review form
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Add a Performance Review',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.deepPurpleAccent,
                ),
              ),
            ),
            TextField(
              controller: memberController,
              decoration: InputDecoration(
                labelText: 'Member Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: trainerController,
              decoration: InputDecoration(
                labelText: 'Trainer Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.fitness_center),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: ratingController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Rating (1-5)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.star_rate),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: feedbackController,
              decoration: InputDecoration(
                labelText: 'Feedback',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.comment),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: addReview,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                backgroundColor: Colors.deepPurpleAccent,
              ),
              child: Text('Submit Review'),
            ),
          ],
        ),
      ),
    );
  }
}
