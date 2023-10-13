class User {
  int? id;
  String name;
  String gender;
  String phone;
  String email;
  String age;
  String picture;
  String street;
  String city;
  String state;
  String country;
  bool favorite;
  User(
      {this.id,
      required this.name,
      required this.gender,
      required this.phone,
      required this.email,
      required this.age,
      required this.picture,
      required this.street,
      required this.city,
      required this.state,
      required this.country,
      required this.favorite});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json['name']['first'] + " " + json['name']['last'],
        gender: json['gender'],
        phone: json['phone'],
        email: json['email'],
        age: json['dob']['date'],
        picture: json['picture']['medium'],
        street: json['location']['street']['name'],
        city: json['location']['city'],
        state: json['location']['state'],
        country: json['location']['country'],
        favorite: false);
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'gender': gender,
        'phone': phone,
        'email': email,
        'age': age,
        'picture': picture,
        'street': street,
        'city': city,
        'state': state,
        'country': country,
        'favorite': favorite ? 1 : 0
      };

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'] as String,
      gender: map['gender'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
      age: map['age'] as String,
      picture: map['picture'] as String,
      street: map['street'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      country: map['country'] as String,
      favorite: map['favorite'] == 1 ? true : false,
    );
  }
}
