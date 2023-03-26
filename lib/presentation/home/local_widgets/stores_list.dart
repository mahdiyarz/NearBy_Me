import 'package:flutter/material.dart';
import 'package:nearby_me/models/stores_model.dart';

class StoresList extends StatelessWidget {
  final List<StoresModel> stores;
  const StoresList({
    Key? key,
    required this.stores,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: stores.length,
      itemBuilder: (context, index) => ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        trailing: Text(stores[index].rate.toString()),
        title: Text(stores[index].name),
        subtitle: Text(stores[index].address),
      ),
    );
  }
}
