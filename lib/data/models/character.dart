class Character {
  late int id;
  late String firstName;
  late String lastName;
  late String fullName;
  late String title;
  late String family;
  late String imageUrl;
  Character.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    firstName = json["firstName"];
    lastName = json["lastName"];
    fullName = json["fullName"];
    title = json["title"];
    family = json["family"];
    imageUrl = json["imageUrl"];
  }
}
