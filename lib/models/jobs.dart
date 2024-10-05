import 'package:flutter_app/models/company.dart';
import 'package:flutter_app/models/job_type.dart';
import 'package:flutter_app/models/location.dart';
import 'package:flutter_app/models/workplace_type.dart';

class Jobs {
  final int id;
  final Location location;
  final Jobtype type;
  final WorkplaceType workplace_type;
  final String title;
  final Company company;
  final DateTime dateTime;

  Jobs(
      {required this.id,
      required this.location,
      required this.type,
      required this.workplace_type,
      required this.title,
      required this.company,
      required this.dateTime});

  factory Jobs.fromJson(Map<String, dynamic> json) {
    return Jobs(
        id: json['id'],
        location: Location.fromJson(json['location']),
        type: Jobtype.fromJson(json['type']),
        workplace_type: WorkplaceType.fromJson(json['workplace_type']),
        title: json['title'],
        company: Company.fromJson(json['company']),
        dateTime: DateTime.parse(json['updated_date']));
  }
  Map<String, dynamic> toJson() {
    return {'id': id, "location": location};
  }
}
