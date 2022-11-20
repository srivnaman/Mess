import 'package:firebase_auth/firebase_auth.dart';
import 'complaint_model.dart';

class UserModel {
  final String name;
  final String role;
  final List<ComplaintModel> complaints;
  UserModel({required this.name, required this.role, required this.complaints});

  static ComplaintModel fromJson(Map<String, dynamic> json) => ComplaintModel(
      idOfComplaint: json['complaints']['Id'],
      msgOfComplaint: json['complaints']['Complaint'],
      typeOfComplaint: json['complaints']['Type']);
}
