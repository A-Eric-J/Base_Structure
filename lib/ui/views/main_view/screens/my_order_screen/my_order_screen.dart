import 'package:base_structure_project/ui/shared/text.dart';
import 'package:base_structure_project/ui/widgets/text/text_view.dart';
import 'package:flutter/material.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: TextView(text: myOrderScreenText, size: 20),
    );
  }
}
