class User {
  int id;

  double rating;

  String firstName;
  String lastName;
  String phone;
  String email;
  String address;
  String cover;

  List <String> skills;

  User({this.id, this.firstName, this.email, this.phone, this.lastName, this.address, this.cover, this.skills, this.rating});
}