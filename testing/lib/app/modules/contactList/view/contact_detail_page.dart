import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:testing/util/color.dart';

class ContactDetailPage extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String phone;
  final String email;

  const ContactDetailPage(this.imageUrl, this.name, this.phone, this.email,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          child: const Icon(Icons.arrow_back_ios),
          onTap: () => {
            Get.back(),
          },
        ),
        title: const Text(
          'ข้อมูลผู้ติดต่อ',
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        width: Get.width,
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.h),
              alignment: Alignment.center,
              width: 120.w,
              height: 120.h,
              child: CachedNetworkImage(
                imageUrl: imageUrl.toString(),
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Text(
              name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.h),
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'เบอร์โทรศัพท์:  ',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: COLOR_OOOOOO,
                            fontFamily: 'IBMPlexSansThai',
                          ),
                        ),
                        TextSpan(
                          text: phone,
                          style: TextStyle(
                            fontSize: 14.0.sp,
                            fontWeight: FontWeight.w400,
                            color: COLOR_OOOOOO,
                            fontFamily: 'IBMPlexSansThai',
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'อีเมล:  ',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: COLOR_OOOOOO,
                            fontFamily: 'IBMPlexSansThai',
                          ),
                        ),
                        TextSpan(
                          text: email,
                          style: TextStyle(
                            fontSize: 14.0.sp,
                            fontWeight: FontWeight.w400,
                            color: COLOR_OOOOOO,
                            fontFamily: 'IBMPlexSansThai',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
