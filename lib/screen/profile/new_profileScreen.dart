import 'dart:io';

import 'package:bmitserp/api/app_strings.dart';
import 'package:bmitserp/provider/profileUserProvider.dart';
import 'package:bmitserp/screen/profile/editprofilescreen.dart';
import 'package:bmitserp/utils/check_internet_connectvity.dart';
import 'package:bmitserp/widget/radialDecoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:url_launcher/url_launcher.dart';

class ProfileScreenActivity extends StatefulWidget {
  const ProfileScreenActivity({super.key});

  @override
  State<ProfileScreenActivity> createState() => _ProfileScreenActivityState();
}

class _ProfileScreenActivityState extends State<ProfileScreenActivity> {
  ProfileUserProvider _profileuserProvider = ProfileUserProvider();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();

    _profileuserProvider =
        Provider.of<ProfileUserProvider>(context, listen: false);
    _profileuserProvider.profileuserlist();
  }

  bool showpop = false;
  bool light = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: RadialDecoration(),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Text(
                "Profile",
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.edit_note,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(EditProfileScreen.routeName);
                  },
                )
              ],
              leading: InkWell(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onTap: () {
                  Get.back();
                },
              ),
            ),
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Container(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      CircleAvatar(
                        radius: 6.5.h,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 6.h,
                          backgroundColor: Colors.grey.withOpacity(0.3),
                          child: GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 5.5.h,
                              backgroundImage: Apphelper.USER_NAME != null
                                  ? NetworkImage(Apphelper.USER_NAME!)
                                  : AssetImage(
                                      'assets/images/dummy_avatar.png',
                                    ) as ImageProvider,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            Apphelper.USER_NAME ?? '',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Text(
                          Apphelper.USER_EMAIL ?? '',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ))

     
        );
  }
}
