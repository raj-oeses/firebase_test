import 'package:flutter/material.dart';
import 'package:test_project/feature/add_item_page/pages/components/add_item_body.dart';

class AddItemPage extends StatelessWidget {
  const AddItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AddItemBody(),
    );
  }
}
