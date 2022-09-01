// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:notim/utility/my_constant.dart';
import 'package:notim/widgets/show_icon_button.dart';

class ShowForm extends StatelessWidget {
  final String hint;
  final IconData? iconData;
  final bool? obsecu;
  final Function()? redEyeFunc;
  final Function(String) changeFunc;
  const ShowForm({
    Key? key,
    required this.hint,
    this.iconData,
    this.obsecu,
    this.redEyeFunc,
    required this.changeFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 40,
      margin: const EdgeInsets.only(top: 16),
      child: TextFormField(onChanged: changeFunc,
        obscureText: obsecu ?? false,
        style: MyConstant().h3Style(),
        decoration: InputDecoration(
          fillColor: Colors.white.withOpacity(0.75),
          filled: true,
          suffixIcon: redEyeFunc == null
              ? iconData == null
                  ? const SizedBox()
                  : Icon(
                      iconData,
                      color: MyConstant.dart,
                    )
              : ShowIconButton(
                  iconData: obsecu!
                      ? Icons.remove_red_eye
                      : Icons.remove_red_eye_outlined,
                  pressFunc: redEyeFunc!),
          hintStyle: MyConstant().h3GreyStyle(),
          hintText: hint,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          enabledBorder: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
