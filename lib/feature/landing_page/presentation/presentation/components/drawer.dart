import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/feature/auth/pages/provider/firebase_auth.dart';

const dHeight = 150.0;
const iHeight = 70.0;

class CustomDrawer extends ConsumerStatefulWidget {
  const CustomDrawer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends ConsumerState<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: dHeight + (iHeight / 2),
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(109, 177, 217, 1)),
                  height: dHeight,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: iHeight,
                    width: iHeight,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.05),
                          blurRadius: 0,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Text(''),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () =>Auth().signOut(),
            leading: const Icon(Icons.forum_outlined, color: Colors.black),
            title: const Text('Log out'),
          )
        ],
      ),
    );
  }
}
