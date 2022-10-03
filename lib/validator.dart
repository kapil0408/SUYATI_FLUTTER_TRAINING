class Validator
{
  static bool isEmptyString(String strtmp) 
  {
    if (strtmp.isEmpty) {
      return true;
    }else{
      return false;
    }
  }

  static bool validateEmail(String strEmail) {
   if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(strEmail.trim())) {
      return true;
    } else {
      return false;
    }
  }

  static bool validatePasswordLength(String strPassword) {
     if (strPassword.trim().length < 6) {
      return true;
    } else if (strPassword.trim().length > 10){
      return true;
    }else {
      return false;
    }
  }
}