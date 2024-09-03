import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaslocator/config/routes/app_routes.dart';
import 'package:gaslocator/core/utils/app_colors.dart';
import 'package:gaslocator/core/utils/assets_manager.dart';
import 'package:gaslocator/features/registration/presentation/widgets/general_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;
  final PageController _pageController = PageController();
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              children: const [
                OnboardingPage(
                  image: ImgAssets.welcome,
                  lable: 'Welcome to Gas Locator',
                  text:
                      'Your easy solution for finding and booking gas cylinders ',
                ),
                OnboardingPage(
                  image: ImgAssets.onboard1,
                  lable: 'Locate Nearby Gas Centers',
                  text:
                      'Search for the nearest gas center that has the gas cylinder you need. Get real-time updates on availability and location',
                ),
                OnboardingPage(
                  image: ImgAssets.onboard2,
                  lable: 'Manage Your Center',
                  text:
                      'Easily list your gas center and update the types of gas cylinders available. Help customers find you effortlessly',
                ),
                OnboardingPage(
                  image: ImgAssets.onboard3,
                  lable: 'Ready to Begin?',
                  text:
                      ' Whether you are a gas center owner or a customer,Gas locator makes managing and finding gas cylinders simple. Let’s get started!',
                ),
              ],
            ),
            Positioned(
                right: 10.w,
                top: 10.h,
                child: TextButton(
                  child: Text(
                    'Skip',
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.login);
                  },
                )),
            Positioned(
              bottom: 120,
              left: ((1 / 2).sw - 58).w,
              child: AnimatedSmoothIndicator(
                activeIndex: currentIndex,
                count: 4,
                effect: ExpandingDotsEffect(activeDotColor: AppColors.primary),
              ),
            ),
            Positioned(
                bottom: 30.h,
                left: 20.w,
                right: 20.w,
                child: SizedBox(
                  child: GeneralButton(
                    text: currentIndex == 3 ? 'Start' : "Next",
                    onTap: () {
                      currentIndex == 3
                          ? Navigator.pushReplacementNamed(
                              context, Routes.login)
                          : _pageController.nextPage(
                              duration: const Duration(milliseconds: 1000),
                              curve: Curves.easeOutQuint,
                            );
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.image,
    required this.lable,
    required this.text,
  });
  final String image;
  final String lable;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(
            flex: 1,
          ),
          Image.asset(
            image,
            height: (1.sh / 2).h,
          ),
          Text(
            lable,
            style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primary),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.sp, color: AppColors.items),
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
