class User{
  int? id;
  String name;
  String gender;
  String phone;
  String email;
  String age;
  String timezone;
  String picture;
  String street;
  String city;
  String state;
  String country;

  User({
     this.id,
    required this.name,
    required this.gender,
   required this.phone,
    required this.email,
    required this.age,
    required this.timezone,
    required this.picture,
    required this.street,
    required this.city,
    required this.state,
    required this.country,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name']['first']+ " " +json['name']['last'],
      gender: json['gender'],
      phone: json['phone'],
      email: json['email'],
      age: json['dob']['date'],
      timezone: "UTC"+ json['location']['timezone']['offset'],
      picture: json['picture']['medium'],
      street: json['location']['street']['name'],
      city: json['location']['city'],
      state: json['location']['state'],
      country: json['location']['country'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'gender': gender,
       'phone': phone,
       'email': email,
       'age': age,
         'timezone': timezone,
         'picture': picture,
       'street': street,
        'city': city,
        'state': state,
        'country': country,
      };

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'gender': this.gender,
      'phone': this.phone,
      'email': this.email,
      'age': this.age,
      'timezone': this.timezone,
      'picture': this.picture,
      'street': this.street,
      'city': this.city,
      'state': this.state,
      'country': this.country,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id:map['id'],
      name: map['name'] as String,
      gender: map['gender'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
      age: map['age'] as String,
      timezone: map['timezone'] as String,
      picture: map['picture'] as String,
      street: map['street'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      country: map['country'] as String,
    );
  }
}