class ServiceDetailModel {
  final int id;
  final int subsetId;
  final String name;
  final double rating;
  final int totalServicesCompleted;
  final double cost;
  final String duration;

  ServiceDetailModel({
    required this.id,
    required this.subsetId,
    required this.name,
    required this.rating,
    required this.totalServicesCompleted,
    required this.cost,
    required this.duration,
  });

  factory ServiceDetailModel.fromJson(Map<String, dynamic> json) {
    return ServiceDetailModel(
      id: json['id'],
      subsetId: json['subset_id'],
      name: json['name'],
      rating: json['rating'].toDouble(),
      totalServicesCompleted: json['total_services_completed'],
      cost: json['cost'].toDouble(),
      duration: json['duration'],
    );
  }
}
