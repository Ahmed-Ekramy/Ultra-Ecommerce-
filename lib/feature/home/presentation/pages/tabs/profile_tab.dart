import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ultra/core/theming/colors.dart';
import 'package:ultra/core/theming/string.dart';
import 'package:ultra/core/widget/custom_elevated_button.dart';

import '../../../../../core/helpers/cache_helper.dart';
import '../../../../../core/routes/routing.dart';
import '../../widgets/custom_profile_item.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0.h, right: 10.w, left: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Account",
            style: CustomTextStyles.hankenW600S18Black,
          ),
          SizedBox(
            height: 30.h,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.profile);
            },
            child: CustomProfileItem(
              label:"Edit your password,name,address,shoe size,email" ,
              name: "Profile",
              icon:Icon(Icons.person_pin, size: 40.sp,) ,
            ),
          ),
          CustomProfileItem(
            label: "FaceID, Two-Step Verification",
            name: "Security",
            icon: Icon(Icons.security, size: 40.sp,) ,
          ),
          CustomProfileItem(
            label: "Current, History",
            name: "Buy Settings",
            icon:   Icon(Icons.shopping_bag, size: 40.sp,) ,
          ),
          CustomProfileItem(
            label: "Payment Method, Shipping Adders, Notifications",
            name: "Settings",
            icon:   Icon(Icons.settings, size: 40.sp,) ,
          ),
          SizedBox(height: 50.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(
              "Rate Application",
              style: CustomTextStyles.hankenW600S18Black,
            ),
            SizedBox(
              width: 10.w,
            ),
         Icon(Icons.arrow_forward_ios_outlined, size: 20.sp,),
          ],),
          Divider(
            thickness: 1.h,
          ),

 SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(
              "Reviews",
              style: CustomTextStyles.hankenW600S18Black,
            ),
            SizedBox(
              width: 10.w,
            ),
         Icon(Icons.arrow_forward_ios_outlined, size: 20.sp,),
          ],),
          Divider(
            thickness: 1.h,
          ),

 SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(
              "Currency",
              style: CustomTextStyles.hankenW600S18Black,
            ),
            SizedBox(
              width: 10.w,
            ),
              Text(
                "USD",
                style: CustomTextStyles.hankenW600S14Primary,
              ),
         Icon(Icons.arrow_forward_ios_outlined, size: 20.sp,),
          ],),
          Divider(
            thickness: 1.h,
          ),
          SizedBox(height: 20.h,),
           CustomElevationButton(
            onPressed: () {
              CacheHelper.removeData("User");
              Fluttertoast.showToast(
                  msg: "Log out successful",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
              Navigator.pushNamedAndRemoveUntil(context,
                  Routes.login, (Route<dynamic> route) => false);
            },
            backgroundButtonColor: Colors.red,
            borderColor: Colors.red,
            buttonName: "Log Out",
          ),
        ],
      ),
    );
  }
}


