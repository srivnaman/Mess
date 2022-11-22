import 'complaint_model.dart';

class UserModel {
  final String name;
  final String role;
  final List<ComplaintModel> complaints;
  UserModel({required this.name, required this.role, required this.complaints});

  
}
