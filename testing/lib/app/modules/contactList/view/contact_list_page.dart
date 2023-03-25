import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:testing/app/modules/contactList/controller/contact_list_controller.dart';
import 'package:testing/app/routes/app_pages.dart';
import 'package:testing/util/color.dart';

class ContactListPage extends StatelessWidget {
  const ContactListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactListController>(
      builder: (controller) => Scaffold(
        backgroundColor: COLOR_FFFFFF,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'รายชื่อผู้ติดต่อ',
            textAlign: TextAlign.center,
          ),
        ),
        body: controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: COLOR_1C232D,
                ),
              )
            : controller.userList!.isEmpty
                ? const Center(
                    child: Text('ไม่มีข้อมูลรายชื่อผู้ติดต่อ'),
                  )
                : ListView.builder(
                    itemCount: controller.userList!.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      var imageUrl =
                          controller.userList![index].picture!.medium;
                      var firstName = controller.userList![index].name!.first;
                      var lastName = controller.userList![index].name!.last;
                      var phone = controller.userList![index].phone;
                      var email = controller.userList![index].email;
                      return SizedBox(
                        height: 90.h,
                        width: Get.width,
                        child: InkWell(
                          child: Container(
                            width: Get.width,
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 10.w),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 10.w),
                                  width: 65.w,
                                  child: CachedNetworkImage(
                                    imageUrl: '$imageUrl',
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width - 100.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '$firstName  $lastName',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        '$phone',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        '$email',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () => {
                            Get.toNamed(
                              AppRoutes.CONTACTDETAIL,
                              parameters: {
                                'imageUrl': imageUrl!,
                                'name': '$firstName $lastName',
                                'phone': phone!,
                                'email': email!
                              },
                            ),
                          },
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}
