class Location {
  int id;
  String nameEn;
  int listOrder;

  // Constructor
  Location({
    required this.id,
    required this.nameEn,
    required this.listOrder,
  });

  // Factory constructor to create Location from JSON
  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      nameEn: json['name_en'],
      listOrder: json['list_order'],
    );
  }

  // Method to convert Location object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_en': nameEn,
      'list_order': listOrder,
    };
  }
}
