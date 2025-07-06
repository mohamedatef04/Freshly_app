class UserDetailsModel {
  final String? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? address;
  final String? imageUrl;

  UserDetailsModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.imageUrl,
  });

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) {
    return UserDetailsModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      imageUrl: json['image_url'],
    );
  }
}
