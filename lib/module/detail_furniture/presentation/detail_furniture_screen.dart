import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:furniture_shop_app/core/theme/app_color.dart';
import 'package:furniture_shop_app/module/home/model/furniture_model.dart';

class DetailFurnitureScreen extends StatefulWidget {
  const DetailFurnitureScreen({super.key});

  @override
  State<DetailFurnitureScreen> createState() => _DetailFurnitureScreenState();
}

class _DetailFurnitureScreenState extends State<DetailFurnitureScreen> {
  late FurnitureModel furniture;

  @override
  void didChangeDependencies() {
    /// get furniture data from modal route
    furniture = ModalRoute.of(context)?.settings.arguments as FurnitureModel;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          splashRadius: 20,
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColor.black,
          ),
        ),
        title: Text(
          "Detail",
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            splashRadius: 20,
            icon: Icon(
              Icons.favorite_border,
              color: AppColor.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 360,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                image: DecorationImage(
                  image: AssetImage(
                    furniture.assets,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              padding: const EdgeInsets.all(16),
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "-10%",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: AppColor.white),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Only For Today",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColor.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              furniture.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
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
                const SizedBox(width: 8),
                Icon(
                  Icons.star_rounded,
                  color: AppColor.black,
                  size: 20,
                ),
                const SizedBox(width: 4),
                Text(
                  furniture.rating.toStringAsFixed(1),
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 1,
                ),
                const SizedBox(width: 8),
                Text(
                  "(${furniture.reviews} Reviews)",
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 1,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              "\$${furniture.price.toStringAsFixed(2)}",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Divider(
              height: 32,
              color: AppColor.backgroundBlack,
            ),
            Text(
              "Description",
              style: Theme.of(context).textTheme.titleMedium,
              maxLines: 1,
            ),
            const SizedBox(height: 16),
            Text(
              furniture.desc * 4,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 160)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width,
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Text(
            "Buy Now",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: AppColor.white),
          ),
        ),
      ),
    );
  }
}
