class UserDetails {
  String? firstName;
  String lastName;
  String? nationalID;
  String? phoneNumber;
  String? email;
  String? password;
  UserDetails(
      {required this.email,
      required this.password,
      required this.firstName,
      required this.lastName,
      required this.nationalID,
      required this.phoneNumber});
}
