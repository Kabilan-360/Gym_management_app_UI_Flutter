class Equipment {
  final String id;
  final String name;
  final String type;
  final int quantity;
  final String condition;
  final DateTime purchaseDate;
  final DateTime nextMaintenanceDate;

  Equipment({
    required this.id,
    required this.name,
    required this.type,
    required this.quantity,
    required this.condition,
    required this.purchaseDate,
    required this.nextMaintenanceDate,
  });
}
