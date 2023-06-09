// Package imports:
import 'package:get/get.dart';
import 'package:testing/app/modules/contactList/controller/contact_list_controller.dart';

class ContactListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactListController>(
      () => ContactListController(),
    );
  }
}
