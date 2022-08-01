import 'package:regexpattern/regexpattern.dart';

String? validateEmail(String? value) {
  // Pattern pattern =
  //     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  // RegExp regex = new RegExp(pattern);
  if (!value!.isEmail()) {
    return 'Please enter a valid Email';
  }
}

String? validateLoginPassword(String? value) {
  if(value!.length < 6){
    return 'Invalid password';
  }
  else {
    return null;
  }
}

String? validatePassword(String? value) {
  if(value!.length < 6){
    return 'Invalid password, length must be more than 6';
  }

}


String? validateFirstName(String? value) {
  if (!value!.isAlphabet() || value.length > 10) {
    return 'Please enter a valid First Name';
  }
}

String? validateLastName(String value) {
  if (!value.isAlphabet() || value.length > 10) {
    return 'Please enter a valid Last Name';
  } else {
    return null;
  }
}

String? validateMobileNumber(String? value) {
  // Pattern pattern =
  //     r'^{0-9}$';
  // RegExp regex = new RegExp(pattern);
  // if(value.length <7 || value.length > 14){
  //   return 'Invalid Number';
  // }
  // else
  if(value!.length <7 || value.length > 14){
    return 'Invalid phone Number';
  }
}


String? validateOTP(String? value) {
  if (value!.length < 4 ) {
    return 'Please enter a valid OTP';
  }
}