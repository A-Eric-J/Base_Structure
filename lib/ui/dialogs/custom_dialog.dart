import 'package:base_structure_project/ui/shared/colors.dart';
import 'package:flutter/material.dart';

/// [CustomDialog] is for showing that you can customize a Dialog
class CustomDialog extends StatefulWidget {
  final Widget child;

  const CustomDialog({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Dialog(
      backgroundColor: white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(width * 0.0533))),
      insetAnimationDuration: const Duration(milliseconds: 10),
      insetPadding: EdgeInsets.symmetric(horizontal: width * 0.1066),
      child: Padding(
        padding: EdgeInsets.all(width * 0.04),
        child: widget.child,
      ),
    );
  }
}
