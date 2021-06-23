class Restuarant {
  final String restaurantName;
  final String rate;
  final String location;
  final String phoneNumber;
  final String restaurantId;

  Restuarant(
      {required this.restaurantName,
      required this.rate,
      required this.location,
      required this.phoneNumber,
      required this.restaurantId});

  factory Restuarant.fromJson(Map<String, dynamic> json) {
    return Restuarant(
      restaurantName: json['restaurantName'],
      rate: json['rate'],
      location: json['location'],
      phoneNumber: json['phoneNumber'],
      restaurantId: json['restaurantId'],
    );
  }

}