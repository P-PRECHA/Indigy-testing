import 'package:get/get.dart';
import 'package:testing/app/modules/contactList/model/user_model.dart';
import 'package:testing/app/modules/contactList/service/contact_list_service.dart';

class ContactListController extends GetxController {
  late ContactListService contactListService;
  List<userModel>? userList = [];
  bool isLoading = false;
  @override
  void onInit() async {
    contactListService = Get.put(ContactListService());
    await getUserAPI();
    super.onInit();
  }

  void dispose() {
    contactListService.dispose();

    super.dispose();
  }

  Future<void> getUserAPI() async {
    isLoading = true;
    await contactListService.getUser().then((value) {
      if (value != null) userList = value;
      isLoading = false;
      update();
    });
  }
}
