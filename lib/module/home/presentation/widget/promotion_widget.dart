import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class PromotionWidget extends StatelessWidget {
  const PromotionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "35%",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    "Today's Special!",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    "Get discount for every order. only valid for today",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            child: Image(
              image: AssetImage(
                "assets/img_light.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
