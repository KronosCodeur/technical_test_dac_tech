import 'package:flutter/material.dart';
import 'package:technical_test_dac_tech/constants/genders.dart';
import 'package:technical_test_dac_tech/data/models/user.dart';

class UserProvider extends ChangeNotifier {
  int? id;
  String? firstName;
  String? lastName;
  String gender = genders[0];
  String? phone;
  String? email;
  String? birthday;
  String picture = " ";
  String? street;
  String? city;
  String? state;
  String? country;
  bool favorite = false;
  User? user;
  setLastName(String newLastName) {
    lastName = newLastName;
    notifyListeners();
  }
  setFirstName(String newFirstName) {
      firstName = newFirstName;
      notifyListeners();
    }

  setGender(String newGender) {
    gender = newGender;
    notifyListeners();
  }

  setPhone(String newPhone) {
    phone = newPhone;
    notifyListeners();
  }

  setEmail(String newEmail) {
    email = newEmail;
    notifyListeners();
  }

  setBirthday(String newBirthday) {
    birthday = newBirthday;
    notifyListeners();
  }

  setPicture(String newPicture) {
    picture = newPicture;
    notifyListeners();
  }

  setStreet(String newStreet) {
    street = newStreet;
    notifyListeners();
  }

  setCity(String newCity) {
    city = newCity;
    notifyListeners();
  }

  setCountry(String newCountry) {
    country = newCountry;
    notifyListeners();
  }

  setState(String newState) {
    state = newState;
    notifyListeners();
  }
  reset(){
    lastName = '';
    firstName = '';
    gender = genders[0];
    phone= '';
     email= '';
     birthday= '';
     picture= '';
     street= '';
     city= '';
     state= '';
     country= '';
     saveData();
     updateData();
     notifyListeners();
  }
  saveData(){
    user = User(name: "$firstName $lastName", gender: gender, phone: phone!, email: email!, birthday: birthday!, picture: picture, street: street!, city: city!, state: state!, country: country!, favorite: favorite);
    print(user!.toJson().toString());
    notifyListeners();
  }
  updateData(){
    user = User(id: id,name: "$firstName $lastName", gender: gender, phone: phone!, email: email!, birthday: birthday!, picture: picture, street: street!, city: city!, state: state!, country: country!, favorite: favorite);
    print(user!.toJson().toString());
    notifyListeners();
  }
  goToUpdate(User user){
    id = user.id;
    lastName = user.name.split(" ")[1];
    firstName = user.name.split(" ")[0];
    gender = user.gender;
    phone= user.phone;
    email= user.email;
    birthday= user.birthday;
    picture= user.picture;
    street= user.street;
    city= user.city;
    state= user.state;
    country= user.country;
    favorite = user.favorite;
    notifyListeners();
  }
}
