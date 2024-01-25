import 'package:doc_talk/features/drawer_feature/presentation/widgets/custom_listile_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer App'),
      ),
      body: const Center(
        child: Text(
          'Main Content',
          style: TextStyle(fontSize: 20),
        ),
      ),
      endDrawer: const MyDrawer(),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0x192A7473),
              ),
              child: Container(
                width: 169.w,
                height: 196.h,
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(118.50),
                  ),
                ),
              )),
          CustomListileDrawer(
            onTap: () {},
            title: "Home",
            imageUrl: "assets/images/Vector.png",
          ),
          CustomListileDrawer(
            onTap: () {},
            title: 'Library',
            imageUrl: "assets/images/icon-bookmark.png",
          ),
          CustomListileDrawer(
            onTap: () {},
            title: 'Sessions',
            imageUrl: "assets/images/icon-video.png",
          ),
          CustomListileDrawer(
            onTap: () {},
            title: 'Rate App',
            imageUrl: "assets/images/Shape.png",
          ),
          CustomListileDrawer(
            onTap: () {},
            title: 'Contact Us',
            imageUrl: "assets/images/icon-phone.png",
          ),
          CustomListileDrawer(
            onTap: () {},
            title: 'Setting',
            imageUrl: "assets/images/icon-settings.png",
          ),
        ],
      ),
    );
  }
}
