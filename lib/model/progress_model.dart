class Progress {
  final String memberId;
  final DateTime date;
  final double weight;
  final double bmi;
  final double goalWeight;
  final double goalBmi;

  Progress({
    required this.memberId,
    required this.date,
    required this.weight,
    required this.bmi,
    required this.goalWeight,
    required this.goalBmi,
  });

  // Method to check if a milestone is achieved (goal weight or BMI)
  bool isMilestoneAchieved() {
    return weight <= goalWeight && bmi <= goalBmi;
  }
}
