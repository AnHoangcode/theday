import 'package:theday/app/common/base_link.dart';
import 'package:theday/app/common/model/account.dart';
import 'package:theday/app/common/service/api_service.dart';

class AuthService extends ApiService {
  Future<Account> loginWithEmailPassword(
      {required String email, required String password}) async {
    Account account = await fetchDataObjectWithPost(
        BaseLink.loginWithEmailPassword, (p0) => Account.fromJson(p0),isUsingToken: false,
        body: {"email": email, "password": password});
    return account;
  }
}
