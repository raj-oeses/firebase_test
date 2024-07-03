import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class InternetDisconnectedDialog extends ConsumerStatefulWidget {
  const InternetDisconnectedDialog({super.key});

  @override
  ConsumerState<InternetDisconnectedDialog> createState() =>
      _InternetDisconnectedDialogState();

  /// Method to show the dialog
  static Future<T?> show<T>() async {
    return Get.dialog<T>(
      const InternetDisconnectedDialog(),
    );
  }
}

class _InternetDisconnectedDialogState
    extends ConsumerState<InternetDisconnectedDialog> {
  @override
  void initState() {
    print('we are in dialogue');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: double.maxFinite,
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
              color: context.theme.colorScheme.error,
              child: Center(
                child: Text(
                  'Internet Disconnected',
                  style: context.textTheme.titleSmall?.copyWith(
                    color: context.theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              child: Text(
                'Your internet connection is disconnected📵. Please connect again to fun with Rkado.',
                style: context.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                    child: Text(
                      'DISMISS',
                      style: context.textTheme.labelLarge?.copyWith(
                        color: context.theme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
