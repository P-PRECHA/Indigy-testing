import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:testing/app/modules/contactList/model/user_model.dart';
import 'package:testing/app/modules/contactList/service/contact_list_service.dart';
import 'package:testing/util/color.dart';

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
    try {
      isLoading = true;
      await contactListService.getUser().then((value) {
        if (value != null) userList = value;
        isLoading = false;
        update();
      });
    } catch (error) {
      // When 
      showDialog<String>(
        context: Get.context!,
        builder: (BuildContext context) => AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          elevation: 16.sp,
          content: SizedBox(
            height: 80.h,
            child: Column(
              children: [
                Icon(
                  Icons.cancel_rounded,
                  color: COLOR_E8565F,
                  size: 40.0.sp,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.h),
                  child: Text(
                    '$error',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Divider(
              color: COLOR_CDD5FF,
              thickness: 1.sp,
              height: 0,
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  isLoading = false;
                  update();
                  Get.back();
                },
                child: Text(
                  'OK',
                  style: TextStyle(
                    color: COLOR_OOOOOO,
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
