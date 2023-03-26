import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nearby_me/helpers/home_controller.dart';

class StoresList extends StatelessWidget {
  const StoresList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        if (controller.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: controller.storesList.length,
          itemBuilder: (context, index) => ListTile(
            onTap: () => Get.toNamed(
              '/details',
              arguments: controller.storesList[index],
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            trailing: Text(controller.storesList[index].rating.toString()),
            title: Text(controller.storesList[index].name),
            subtitle: Text(controller.storesList[index].address),
          ),
        );
      },
    );

    // ListView.builder(
    //   scrollDirection: Axis.vertical,
    //   shrinkWrap: true,
    //   itemCount: stores.length,
    //   itemBuilder: (context, index) => ListTile(
    //     onTap: () => Get.toNamed(
    //       '/details',
    //       arguments: stores[index],
    //     ),
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    //     trailing: Text(stores[index].rating.toString()),
    //     title: Text(stores[index].name),
    //     subtitle: Text(stores[index].address),
    //   ),
    // );
  }
}
