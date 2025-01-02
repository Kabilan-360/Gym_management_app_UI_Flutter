class MembershipPlan {
  String id;
  String name;
  String duration; // Monthly, Quarterly, Yearly
  double price;
  double? discount; // Optional
  String description;

  MembershipPlan({
    required this.id,
    required this.name,
    required this.duration,
    required this.price,
    this.discount,
    required this.description,
  });
}
