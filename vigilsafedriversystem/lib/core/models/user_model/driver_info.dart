class DriverInfo {
  String? longitude;
  String? latitude;
  String? firstname;
  String? lastname;
  String? carPlate;
  String? driverPhone;
  String? email;

  DriverInfo(
      {required this.firstname,
      required this.lastname,
      required this.driverPhone,
      required this.carPlate,
      required this.latitude,
      required this.longitude,
      required this.email});
}
