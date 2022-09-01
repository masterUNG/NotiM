import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:notim/utility/my_constant.dart';
import 'package:notim/utility/my_dialog.dart';
import 'package:notim/widgets/show_button.dart';
import 'package:notim/widgets/show_form.dart';
import 'package:notim/widgets/show_icon_button.dart';
import 'package:notim/widgets/show_image.dart';
import 'package:notim/widgets/show_progress.dart';
import 'package:notim/widgets/show_text.dart';

class CreateNewAccount extends StatefulWidget {
  const CreateNewAccount({super.key});

  @override
  State<CreateNewAccount> createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  double? lat, lng;

  @override
  void initState() {
    super.initState();
    processFindLocation();
  }

  Future<void> processFindLocation() async {
    LocationPermission locationPermission;

    bool locationServiceEnable = await Geolocator.isLocationServiceEnabled();
    if (locationServiceEnable) {
      //Open Service

      locationPermission = await Geolocator.checkPermission();

      if (locationPermission == LocationPermission.deniedForever) {
        MyDialog(context: context).normalDialog(
          title: 'DeniedForever',
          subTitle: 'Please Permission Location',
          label: 'Set Permission',
          pressFunc: () {
            Geolocator.openAppSettings();
            exit(0);
          },
        );
      }

      if (locationPermission == LocationPermission.denied) {
        locationPermission = await Geolocator.requestPermission();

        if ((locationPermission != LocationPermission.whileInUse) &&
            (locationPermission != LocationPermission.always)) {
          MyDialog(context: context).normalDialog(
            title: 'DeniedForever',
            subTitle: 'Please Permission Location',
            label: 'Set Permission',
            pressFunc: () {
              Geolocator.openAppSettings();
              exit(0);
            },
          );
        } else {
          // อาจจะเป็น WhileInUse หรือ always
          await processFindLatLng();
        }
      } else {
        await processFindLatLng();
      }
    } else {
      //Close Service
      MyDialog(context: context).normalDialog(
        title: 'Location Service OFF',
        subTitle: 'Please ON Location Service',
        label: 'Go to Setting',
        pressFunc: () {
          Geolocator.openLocationSettings();
          exit(0);
        },
      );
    }
  }

  Future<void> processFindLatLng() async {
    var position = await Geolocator.getCurrentPosition();
    lat = position.latitude;
    lng = position.longitude;
    print('lat ==> $lat, lng = ==> $lng');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          ShowIconButton(
            iconData: Icons.cloud_upload,
            pressFunc: () {},
          )
        ],
        centerTitle: true,
        title: ShowText(
          text: 'Create New Account',
          textStyle: MyConstant().h2Style(),
        ),
      ),
      body: ListView(
        children: [
          newAvatar(),
          formName(),
          formEmail(),
          formPassword(),
          newMap(),
          buttonCreateAccount(context: context),
        ],
      ),
    );
  }

  ShowButton buttonCreateAccount({required BuildContext context}) {
    return ShowButton(
      label: 'Create New Account',
      pressFunc: () {},
    );
  }

  Row newMap() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          decoration: MyConstant().curveBox(),
          width: 300,
          height: 250,
          child:
              lat == null ? const ShowProgress() : ShowText(text: '$lat, $lng'),
        ),
      ],
    );
  }

  Row formPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowForm(
          hint: 'Password:',
          iconData: Icons.lock_outline,
        ),
      ],
    );
  }

  Row formEmail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowForm(
          hint: 'Email:',
          iconData: Icons.email_outlined,
        ),
      ],
    );
  }

  Row formName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowForm(
          hint: 'Name:',
          iconData: Icons.fingerprint,
        ),
      ],
    );
  }

  Container newAvatar() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      width: 200,
      height: 200,
      child: ShowImage(
        path: 'images/avatar.png',
      ),
    );
  }
}
