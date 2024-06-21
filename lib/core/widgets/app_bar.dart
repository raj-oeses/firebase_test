import 'package:flutter/material.dart';
import 'package:test_project/core/utils/colors.dart';

const _iconSize = 4.0;

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onMenuTap;
  final VoidCallback? onBackPressed;

  const CustomAppBar(
      {super.key, required this.title, this.onMenuTap, this.onBackPressed})
      : preferredSize = const Size.fromHeight(kToolbarHeight + 20);

  @override
  final Size preferredSize;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 20, top: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: widget.onBackPressed ?? () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back_ios_new,
                    color: black600, size: 22)),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(widget.title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w800),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis)
                ],
              ),
            ),
            if (widget.onMenuTap != null)
              GestureDetector(
                onTap: widget.onMenuTap,
                child: Row(
                  children: List.generate(
                      3,
                      (index) => Container(
                            margin: const EdgeInsets.only(right: _iconSize / 2),
                            height: _iconSize,
                            width: _iconSize,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(_iconSize),
                                border: Border.all(
                                    width: (_iconSize / 5),
                                    color: Colors.black)),
                          )),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
