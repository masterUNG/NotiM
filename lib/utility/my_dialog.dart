// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:notim/utility/my_constant.dart';
import 'package:notim/widgets/show_image.dart';
import 'package:notim/widgets/show_text.dart';
import 'package:notim/widgets/show_text_button.dart';

class MyDialog {
  final BuildContext context;
  MyDialog({
    required this.context,
  });

  void normalDialog({
    required String title,
    required String subTitle,
    Function()? pressFunc,
    String? label,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: ListTile(
          leading: const SizedBox(
            width: 80,
            child: ShowImage(),
          ),
          title: ShowText(
            text: title,
            textStyle: MyConstant().h2Style(),
          ),
          subtitle: ShowText(text: subTitle),
        ),
        actions: [
          ShowTextButton(
            label: label ?? 'OK',
            pressFunc: pressFunc ??
                () {
                  Navigator.pop(context);
                },
          ),
        ],
      ),
    );
  }
}
