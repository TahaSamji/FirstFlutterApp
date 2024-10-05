class Company {
  final String name;
  final String logo;

  // Constructor
  Company({
    required this.name,
    required this.logo,
  });

  // Factory constructor to create a Company instance from JSON
  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'],
      logo: json['logo'],
    );
  }

  // Method to convert a Company instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'logo': logo,
    };
  }
}
