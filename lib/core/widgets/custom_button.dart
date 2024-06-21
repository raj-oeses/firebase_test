import 'package:flutter/material.dart';
import 'package:test_project/core/utils/colors.dart';
import 'package:test_project/core/utils/properties.dart';

class ShadowButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double? width;
  final IconData? icon;
  final bool isDisable;

  const ShadowButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.width,
      this.icon,
      required this.isDisable});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isDisable ? null : onPressed,
      child: Stack(
        children: [
          if (!isDisable)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      // width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xff0753EB).withOpacity(.5),
                              blurRadius: 3,
                              offset: Offset(0, 3))
                        ],
                      ),
                      child: Text(text,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: whiteColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700)),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xffDE0000).withOpacity(.5),
                              blurRadius: 3,
                              offset: Offset(0, 3))
                        ],
                      ),
                      child: Text(text,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: whiteColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700)),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xffF88A00).withOpacity(.5),
                              blurRadius: 3,
                              offset: Offset(0, 3))
                        ],
                      ),
                      child: Text(text,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: whiteColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700)),
                    ),
                  ),
                ],
              ),
            ),
          Container(
            padding: const EdgeInsets.all(10.0),
            width: width ?? double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: isDisable ? Colors.grey : Colors.black,
              boxShadow: isDisable
                  ? [
                      BoxShadow(
                          color: Colors.grey.withOpacity(.5),
                          blurRadius: 3,
                          offset: Offset(0, 3))
                    ]
                  : null /*const [
                      BoxShadow(
                          color: Colors.blue, blurRadius: 8, offset: Offset(0, 3)),
                      BoxShadow(
                          color: Colors.red, blurRadius: 8, offset: Offset(0, 3)),
                      BoxShadow(
                          color: Colors.orange, blurRadius: 8, offset: Offset(0, 3))
                    ]*/
              ,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(icon, color: whiteColor, size: 15.0),
                  widthBox5
                ],
                Text(text,
                    style: const TextStyle(
                        color: whiteColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomBackButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget? textWidget;

  const CustomBackButton({super.key, required this.onTap, this.textWidget});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
            border: Border.all(color: grey400, width: 1.0),
            borderRadius: BorderRadius.circular(70.0)),
        duration: const Duration(seconds: 1),
        child: textWidget ??
            const Icon(Icons.arrow_back_ios_new, color: black600, size: 24.0),
      ),
    );
  }
}
