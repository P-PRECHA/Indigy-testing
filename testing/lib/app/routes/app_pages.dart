import 'package:get/get.dart';
import 'package:testing/app/modules/contactList/bindings/contact_list_binding.dart';
import 'package:testing/app/modules/contactList/view/contact_detail_page.dart';
import 'package:testing/app/modules/contactList/view/contact_list_page.dart';
part 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.CONTACTLIST,
      page: () => const ContactListPage(),
      binding: ContactListBinding(),
    ),
    GetPage(
      name: AppRoutes.CONTACTDETAIL,
      page: () => ContactDetailPage(
          Get.parameters['imageUrl']!,
          Get.parameters['name']!,
          Get.parameters['phone']!,
          Get.parameters['email']!),
    ),
  ];
}
