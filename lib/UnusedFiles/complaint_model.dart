class ComplaintModel {
  final String typeOfComplaint;
  final String msgOfComplaint;
  ComplaintModel({required this.typeOfComplaint, required this.msgOfComplaint});
  static ComplaintModel fromJson(Map<String, dynamic> json) => ComplaintModel(
      msgOfComplaint: json['complaint'], typeOfComplaint: json['type']);
}
