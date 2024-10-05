class WorkplaceType {
  final int id;

  final String nameEn;

  WorkplaceType({
    required this.id,
    required this.nameEn,
  });

  factory WorkplaceType.fromJson(Map<String, dynamic> json) {
    return WorkplaceType(
      id: json['id'],
      nameEn: json['name_en'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name_en': nameEn,
    };
  }
}
