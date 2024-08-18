import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:theday/app/resource/base_define.dart';
import 'package:theday/app/resource/form_field_widget.dart';
import 'package:theday/app/resource/reponsive_utils.dart';
import 'package:theday/app/resource/text_style.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: Container(
      color: ColorManager.primaryColor,
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: _avatar(context)),
            SizedBox(
              height: 10,
            ),
            TextConstant.textH2(context, text: 'THE DAY'),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Padding(
              padding: EdgeInsets.all(UtilsReponsive.width(15, context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  TextConstant.subTile3(context, text: 'Email'),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Obx(() => FormFieldWidget(
                        padding: 20,
                        controllerEditting: controller.emailController,
                        errorText: controller.emailError.value,
                        setValueFunc: (value) {
                          controller.validationEmail();
                        },
                        borderColor: ColorManager.secondaryColor,
                        radiusBorder: 15,
                      )),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  TextConstant.subTile3(context, text: 'Mật khẩu'),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Obx(() => FormFieldWidget(
                        errorText: controller.passwordError.value,
                        controllerEditting: controller.passwordController,
                        padding: 20,
                        setValueFunc: (value) {
                          controller.validationPassword();
                        },
                        borderColor: ColorManager.secondaryColor,
                        isObscureText: !controller.visiblePassword.value,
                        radiusBorder: 15,
                        suffixIcon: GestureDetector(
                            onTap: () {
                              controller.visiblePassword.value =
                                  !controller.visiblePassword.value;
                            },
                            child: Icon(controller.visiblePassword.value
                                ? Icons.visibility
                                : Icons.visibility_off)),
                      )),
                  SizedBoxConst.size(context: context, size: 30),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: context.width),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                            ColorManager.secondaryColor),
                        padding: MaterialStateProperty.all(EdgeInsets.all(14)),
                      ),
                      child: Obx(() => controller.isLockButton.value
                          ? const CupertinoActivityIndicator(
                              color: Colors.white,
                            )
                          : TextConstant.subTile2(context,
                              text: 'Đăng nhập',
                              color: ColorManager.primaryColor)),
                      onPressed: () async {
                        await controller.login();
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    children: [
                      Expanded(child: Divider()),
                      TextConstant.subTile3(context, text: 'or'),
                      Expanded(child: Divider()),
                    ],
                  ),
                  SizedBoxConst.size(context: context),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: context.width),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            side: BorderSide(width: 0.5, strokeAlign: 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                            ColorManager.primaryColor),
                        padding: MaterialStateProperty.all(EdgeInsets.all(14)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/google.png',
                            height: UtilsReponsive.height(18, context),
                            width: UtilsReponsive.height(18, context),
                          ),
                          SizedBoxConst.sizeWith(
                            context: context,
                          ),
                          TextConstant.subTile2(
                            context,
                            text: 'Đăng nhập với Google',
                          )
                        ],
                      ),
                      onPressed: () async {
                        await controller.handleSignIn();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    )));
  }

  SizedBox _avatar(BuildContext context) {
    return SizedBox(
      height: UtilsReponsive.height(150, context),
      width: UtilsReponsive.height(150, context),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            height: UtilsReponsive.height(90, context),
            width: UtilsReponsive.height(90, context),
            padding: EdgeInsets.all(UtilsReponsive.height(5, context)),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.teal, width: 5),
                shape: BoxShape.circle),
            child: Container(
              clipBehavior: Clip.hardEdge,
              height: UtilsReponsive.height(80, context),
              width: UtilsReponsive.height(80, context),
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image.asset(
                'assets/theday_logo.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
