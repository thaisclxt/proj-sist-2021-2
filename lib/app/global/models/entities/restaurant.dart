class Restaurant {
  final String restaurantId;
  final double? avaliation;
  final String category;
  final Map<String, dynamic>? cupom;
  final double deliveryPrice;
  final String deliveryPlan;
  final double distance;
  final String estimatedDelivery;
  final String phone;
  final String image;
  final bool isChampion;
  final int orders;
  final String socialName;
  final String nameOwner;
  final String phoneOwner;
  final String emailOwner;
  final String password;

  Restaurant(
    this.restaurantId, {
    this.avaliation,
    required this.category,
    this.cupom,
    required this.deliveryPrice,
    required this.distance,
    required this.estimatedDelivery,
    required this.deliveryPlan,
    required this.phone,
    required this.image,
    required this.isChampion,
    required this.orders,
    required this.socialName,
    required this.nameOwner,
    required this.phoneOwner,
    required this.emailOwner,
    required this.password,
  });

  static Restaurant fromMap(id, Map<String, dynamic> map) {
    return Restaurant(
      id,
      avaliation: map['avaliation'],
      category: map['category'],
      cupom: map['cupom'],
      deliveryPrice: map['delivery_price'],
      deliveryPlan: map['delivery_plan'],
      distance: map['distance'],
      estimatedDelivery: map['estimated_delivery'],
      phone: map['phone_restaurant'],
      image: map['image'],
      isChampion: map['isChampion'],
      orders: map['orders'],
      socialName: map['social_name'],
      nameOwner: map['name_Owner'],
      phoneOwner: map['phone_Owner'],
      emailOwner: map['email_Owner'],
      password: map['password'],
    );
  }
}
