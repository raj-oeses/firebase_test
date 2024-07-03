import 'package:get_storage/get_storage.dart';

String login = 'LOGIN';

class LoginResponseStorage {
  //----------------------------------------------------------------------------store
  static void storeLoginResponse(String data) {
    print('Stored in preferences::::::::::____----____');
    final loginStorage = GetStorage();
    loginStorage.write(login, data);
  }

  //------------------------------------------------------ ----------------------get data
  static String? getLoginResponseData() {
    final loginStorage = GetStorage();
    return loginStorage.read(login);
  }
}
