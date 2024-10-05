class WorkplaceType {
  final int id;

  final String nameEn;

  // Constructor
  WorkplaceType({
    required this.id,
    required this.nameEn,
  });

  // Factory constructor to create a WorkplaceType instance from JSON
  factory WorkplaceType.fromJson(Map<String, dynamic> json) {
    return WorkplaceType(
      id: json['id'],
      nameEn: json['name_en'],
    );
  }

  // Method to convert a WorkplaceType instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_en': nameEn,
    };
  }
}
