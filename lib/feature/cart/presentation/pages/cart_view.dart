import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ultra/core/di/injection.dart';
import 'package:ultra/core/theming/colors.dart';
import 'package:ultra/feature/cart/presentation/manager/cart_cubit.dart';
import 'package:ultra/feature/cart/presentation/manager/cart_state.dart';

import '../../../../core/theming/images.dart';
import '../../../../core/theming/string.dart';
import '../widgets/custom_shimmer_cart.dart';
import '../widgets/custom_success_cart.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
      create: (context) => getIt<CartCubit>()..getCart(),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if(state is CartSuccess){
            return const CustomSuccessCart();
          }
          return const CustomShimmerCartView();

        },
      ),
    ));
  }
}




