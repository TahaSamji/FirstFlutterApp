class Location {
  int id;
  String nameEn;
  int listOrder;

  Location({
    required this.id,
    required this.nameEn,
    required this.listOrder,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      nameEn: json['name_en'],
      listOrder: json['list_order'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_en': nameEn,
      'list_order': listOrder,
    };
  }
}
