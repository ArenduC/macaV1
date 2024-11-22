import 'package:maca/function/app_function.dart';
import 'package:maca/store/local_store.dart';

class MacaAuth {
  Future<bool> loginCheking() async {
    // Await the Future to get the actual value.
    dynamic isLogin = await LocalStore().getStore(ListOfStoreKey.loginStatus);

    AppFunction().macaPrint(isLogin, "islogin");

    // Return the resolved boolean value.
    return isLogin ?? false;
  }
}
