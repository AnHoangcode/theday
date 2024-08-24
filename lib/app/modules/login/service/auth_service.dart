import 'package:theday/app/common/base_common.dart';
import 'package:theday/app/common/base_link.dart';
import 'package:theday/app/common/model/account.dart';
import 'package:theday/app/common/model/personal_info_supplier.dart';
import 'package:theday/app/common/service/api_service.dart';

class AuthService extends ApiService {
  Future<Account> loginWithEmailPassword(
      {required String email, required String password}) async {
    Account account = await fetchDataObjectWithPost(
        BaseLink.loginWithEmailPassword, (p0) => Account.fromJson(p0),
        isUsingToken: false, body: {"email": email, "password": password});
    return account;
  }

  Future<Account> loginWithGoogle({required String token}) async {
    Account account = await fetchDataObjectWithPost(
        BaseLink.loginWithGoogle, (p0) => Account.fromJson(p0),
        isUsingToken: false, body: {"token": token});
    return account;
  }

  Future<PersonalInforSupplier> getPersonalInfoSupplier(
      {required String userId}) async {
    PersonalInforSupplier account = await fetchDataObject(
      '${BaseLink.personalSupplier}?id=$userId',
      (p0) => PersonalInforSupplier.fromJson(p0),
    );
    return account;
  }

  Future<bool> updateSupplierProfile(
      {required PersonalInforSupplier model}) async {
    bool check = await validationWithPut(BaseLink.updateProfileSupplier, body: {
      "apartmentNumber": model.area!.apartmentNumber,
      "contactEmail": model.contactEmail,
      "contactNumber": model.contactPhone,
      "district": model.area!.district,
      "image": model.image,
      "name": model.supplierName,
      "phoneNumber":  model.contactPhone,
      "province": model.area!.province,
      "supplierId": model.supplierId,
      "ward": model.area!.ward
    });
    return check;
  }
}
