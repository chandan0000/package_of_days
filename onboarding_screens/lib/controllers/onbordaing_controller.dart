import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/state_manager.dart';
import 'package:onboarding_screens/models/onbordaing_info.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  var pageController = PageController();
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;

  forwardAction() {
    if (isLastPage) {
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo(
        'https://assets3.lottiefiles.com/packages/lf20_ihkjwhbc.json',
        'Order Your Food',
        'Now you can order food any time  right from your mobile.'),
    OnboardingInfo(
        'https://assets8.lottiefiles.com/packages/lf20_bnh0nfjr.json',
        'Cooking Safe Food',
        'We are maintain safty and We keep clean while making food.'),
    OnboardingInfo(
        'https://assets1.lottiefiles.com/packages/lf20_jmejybvu.json',
        'Quick Delivery',
        'Orders your favorite meals will be  immediately deliver')
  ];
}
