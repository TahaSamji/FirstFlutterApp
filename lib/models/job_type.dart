class Jobtype {
  final int id;
  final String nameEn;

  Jobtype({
    required this.id,
    required this.nameEn,
  });

  factory Jobtype.fromJson(Map<String, dynamic> json) {
    return Jobtype(
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
