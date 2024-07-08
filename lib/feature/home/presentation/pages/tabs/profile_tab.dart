import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ultra/core/theming/colors.dart';
import 'package:ultra/core/theming/string.dart';

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
          CustomProfileItem(
            label:"Edit your password,name,address,shoe size,email" ,
            name: "Profile",
            icon:Icon(Icons.person_pin, size: 40.sp,) ,
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

        ],
      ),
    );
  }
}


