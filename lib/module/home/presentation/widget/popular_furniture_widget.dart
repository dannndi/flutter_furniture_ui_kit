import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furniture_shop_app/core/route/app_route_name.dart';
import 'package:furniture_shop_app/core/theme/app_color.dart';
import 'package:furniture_shop_app/module/home/model/furniture_model.dart';

class PopularFurnitureWidget extends StatefulWidget {
  const PopularFurnitureWidget({super.key});

  @override
  State<PopularFurnitureWidget> createState() => _PopularFurnitureWidgetState();
}

class _PopularFurnitureWidgetState extends State<PopularFurnitureWidget> {
  final categories = [
    "All",
    "Sofa",
    "Chair",
    "Table",
    "Kitchen",
    "Bedroom",
    "Bathroom"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Most Popular",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "See all",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: Colors.blue),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 38,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 24),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(right: 24),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: index == 0 ? AppColor.black : AppColor.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(24),
                ),
                alignment: Alignment.center,
                child: Text(
                  categories[index],
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: index == 0 ? AppColor.white : AppColor.black,
                      ),
                ),
              );
            },
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 10,
              childAspectRatio: 3 / 5),
          padding: const EdgeInsets.all(24),
          itemCount: dummyFurnitures.length,
          itemBuilder: (context, index) {
            final furniture = dummyFurnitures[index];
            return InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRouteName.detailFurniture,

                  /// pass data via modal route argument
                  arguments: furniture,
                );
              },
              borderRadius: BorderRadius.circular(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// furniture images
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage(
                          furniture.assets,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          furniture.name,
                          style: Theme.of(context).textTheme.titleMedium,
                          maxLines: 1,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star_rounded,
                              color: AppColor.black,
                              size: 20,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              furniture.rating.toStringAsFixed(1),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: Colors.grey),
                              maxLines: 1,
                            ),
                            Container(
                              width: 1,
                              height: 10,
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              color: Colors.grey,
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                "${furniture.sold} Sold",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "\$${furniture.price.toStringAsFixed(2)}",
                          style: Theme.of(context).textTheme.titleSmall,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
