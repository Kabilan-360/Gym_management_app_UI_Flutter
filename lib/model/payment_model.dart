class Payment {
  String id;
  String memberId;
  String method; // Cash, Card, Online
  double amount;
  String status; // Paid, Pending
  DateTime date;

  Payment({
    required this.id,
    required this.memberId,
    required this.method,
    required this.amount,
    required this.status,
    required this.date,
  });
}
