class ServiceSubsetModel {
  final int id;
  final int serviceId;
  final String subsetTitle;
  final String subsetDescription;

  ServiceSubsetModel({
    required this.id,
    required this.serviceId,
    required this.subsetTitle,
    this.subsetDescription = '',
  });

  factory ServiceSubsetModel.fromJson(Map<String, dynamic> json) {
    return ServiceSubsetModel(
      id: json['id'],
      serviceId: json['service_id'],
      subsetTitle: json['subset_title'],
      subsetDescription: json['subset_description'] ?? '',
    );
  }
}
