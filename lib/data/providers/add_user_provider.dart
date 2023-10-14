import 'package:flutter/material.dart';
import 'package:technical_test_dac_tech/constants/genders.dart';
import 'package:technical_test_dac_tech/data/models/user.dart';

class AddUserProvider extends ChangeNotifier {
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
    lastName = " ";
    firstName = " ";
    gender = genders[0];
    phone= " ";
     email= " ";
     birthday= " ";
     picture= " ";
     street= " ";
     city= " ";
     state= " ";
     country= " ";
     setData();
     notifyListeners();
  }
  setData(){
    user = User(name: "$firstName $lastName", gender: gender, phone: phone!, email: email!, birthday: birthday!, picture: picture, street: street!, city: city!, state: state!, country: country!, favorite: favorite);
    print(user!.toJson().toString());
    notifyListeners();
  }
}
