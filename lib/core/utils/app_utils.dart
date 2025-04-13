class AppUtils {
 static bool isEmailValid(String email) {
   return RegExp(r'^[^@]+@[^@]+.[^@]+').hasMatch(email);
 }


 static bool hasLowerCase(String password) {
   return RegExp(r'^(?=.*[a-z])').hasMatch(password);
 }


 static bool hasUpperCase(String password) {
   return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
 }


 static bool hasNumber(String password) {
   return RegExp(r'^(?=.*?[0-9])').hasMatch(password);
 }


 static bool hasMinLength(String password) {
   return RegExp(r'^(?=.{8,})').hasMatch(password);
 }
}


