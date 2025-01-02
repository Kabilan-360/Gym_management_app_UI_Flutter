// import 'package:flutter/material.dart';
// import 'resolve_complaint_screen.dart';
// import 'feedback_service.dart';
//
// class ComplaintsDashboard extends StatelessWidget {
//   final FeedbackService feedbackService = FeedbackService();
//
//   @override
//   Widget build(BuildContext context) {
//     final unresolvedComplaints = feedbackService.feedbackItems
//         .where((feedback) => !feedback.isResolved)
//         .toList();
//
//     return Scaffold(
//       appBar: AppBar(title: const Text('Complaints Dashboard')),
//       body: unresolvedComplaints.isEmpty
//           ? const Center(child: Text('No unresolved complaints'))
//           : ListView.builder(
//         itemCount: unresolvedComplaints.length,
//         itemBuilder: (context, index) {
//           final complaint = unresolvedComplaints[index];
//           return Card(
//             margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//             child: ListTile(
//               title: Text(
//                 complaint.title,
//                 style: const TextStyle(fontWeight: FontWeight.bold),
//               ),
//               subtitle: Text('${complaint.category} - ${complaint.date}'),
//               trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>
//                         ResolveComplaintScreen(complaint: complaint),
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
