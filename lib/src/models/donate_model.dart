class DonationModel {
  String id;
  String name;
  String emailId;
  String phoneNumber;
  String address;
  String state;
  String country;
  String pincode;
  String amount;
  bool isAnonyms;

  DonationModel({
    required this.name,
    required this.emailId,
    required this.phoneNumber,
    required this.address,
    required this.state,
    required this.country,
    required this.pincode,
    required this.id,
    required this.amount,
    required this.isAnonyms,
  });
}
