import 'package:flutter/material.dart';
import 'package:notim/states/create_new_account.dart';
import 'package:notim/utility/my_constant.dart';
import 'package:notim/widgets/show_button.dart';
import 'package:notim/widgets/show_form.dart';
import 'package:notim/widgets/show_image.dart';
import 'package:notim/widgets/show_text.dart';
import 'package:notim/widgets/show_text_button.dart';

class Authen extends StatefulWidget {
  const Authen({super.key});

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  bool redEye = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusScopeNode());
        },
        child: Container(
          decoration: MyConstant().basicBox(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                newHead(),
                newEmail(),
                newPassword(),
                buttonLogin(),
                newCreateAccount(),
              ],
            ),
          ),
        ),
      )),
    );
  }

  Row newCreateAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowText(text: 'Non Account ? '),
        ShowTextButton(
          label: 'Create Account',
          pressFunc: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateNewAccount(),));
          },
        ),
      ],
    );
  }

  ShowButton buttonLogin() {
    return ShowButton(
      label: 'Login',
      pressFunc: () {},
    );
  }

  ShowForm newPassword() {
    return ShowForm(
      hint: 'Passwoerd:',
      obsecu: redEye,
      redEyeFunc: () {
        setState(() {
          redEye = !redEye;
        });
      },
    );
  }

  ShowForm newEmail() {
    return ShowForm(
      hint: 'Email:',
      iconData: Icons.contact_mail_outlined,
    );
  }

  SizedBox newHead() {
    return SizedBox(
      width: 250,
      child: Row(
        children: [
          ShowText(
            text: 'Login:',
            textStyle: MyConstant().h1Style(),
          ),
          Container(
            margin: const EdgeInsets.only(left: 16),
            width: 48,
            child: const ShowImage(),
          ),
        ],
      ),
    );
  }
}
