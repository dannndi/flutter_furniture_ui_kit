import 'package:flutter/material.dart';
import 'package:furniture_shop_app/core/route/app_route_name.dart';
import 'package:furniture_shop_app/core/theme/app_color.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/img_started.jpeg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              /// title
              Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  "We Provide High Quality Products Just for You",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(color: AppColor.white),
                ),
              ),
              const Spacer(),

              /// button to navigate to home screen`
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRouteName.home);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(48),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 24,
                  ),
                ),
                child: Text(
                  "GET STARTED",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: AppColor.black),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an Account ?",
                    style: Theme.of(context)
                        .textTheme
                        .button
                        ?.copyWith(color: AppColor.white),
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Login Here !",
                      style: Theme.of(context)
                          .textTheme
                          .button
                          ?.copyWith(color: AppColor.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
