class ServiceModel {
  int id;
  String serviceName;
  num servicePrice;
  num duration;
  int cartCount;
  num rating;
  int totalOrders;
  int ratingOutOf;

  ServiceModel({
    required this.id,
    required this.serviceName,
    required this.servicePrice,
    required this.duration,
    required this.cartCount,
    required this.rating,
    required this.totalOrders,
    required this.ratingOutOf,
  });

  // Factory method to create a new instance from JSON
  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'],
      serviceName: json['searvice_name'],
      servicePrice: json['searvice_price'],
      duration: json['duration'],
      cartCount: json['cart_count'],
      rating: json['rating'],
      totalOrders: json['total_orders'],
      ratingOutOf: json['ratting_out_of'],
    );
  }

  // Method to convert instance into JSON format
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'searvice_name': serviceName,
      'searvice_price': servicePrice,
      'duration': duration,
      'cart_count': cartCount,
      'rating': rating,
      'total_orders': totalOrders,
      'ratting_out_of': ratingOutOf,
    };
  }
}
