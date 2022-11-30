import 'package:shared_preferences/shared_preferences.dart';

void insertShrData(String e1,String p1) async {
  SharedPreferences shr1 = await SharedPreferences.getInstance();
  shr1.setString("email", e1);
  shr1.setString("password", p1);
}

Future<List<String>> readShrData() async{

  SharedPreferences shr1 = await SharedPreferences.getInstance();
   String e1 = shr1.get("email").toString();
   String p1 = shr1.get("password").toString();
   return [e1,p1];
}
