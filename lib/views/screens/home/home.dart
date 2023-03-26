import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/getx_controller.dart';
import '../../../models/stores_model.dart';

import 'local_widgets/stores_list.dart';

class Home extends StatelessWidget {
  Home({super.key});

  MyController getController = Get.put<MyController>(MyController());

  final TextEditingController _searchController = TextEditingController();

  final List<StoresModel> _mockData = [
    // StoresModel(
    //   name: 'Coffee Shop',
    //   address: 'Tafazoli blv, Laleh street, No. 53',
    //   rate: 8.2,
    //   phone: 'phone',
    //   reviews: 'reviews',
    // ),
    // StoresModel(
    //   name: 'Coffee Net',
    //   address: 'Tafazoli blv, Laleh street, No. 65',
    //   rate: 7.6,
    //   phone: 'phone',
    //   reviews: 'reviews',
    // ),
    // StoresModel(
    //   name: 'Barber Shop',
    //   address: 'Tafazoli blv, Laleh street, No. 78',
    //   rate: 6.5,
    //   phone: 'phone',
    //   reviews: 'reviews',
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NearBy App'),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 10,
            ),
            child: TextFormField(
              controller: _searchController,
              autofocus: true,
              onChanged: getController.updateQuery,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
                label: Text('Search your location'),
                hintText: 'Exp: London, Amsterdam, ...',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          StoresList(stores: _mockData),
        ],
      ),
    );
  }
}
