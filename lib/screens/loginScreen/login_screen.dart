import 'package:catseye_app/stylies/login_screen_stylies.dart';
import 'package:catseye_app/svgimages/svg_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../appColors/app_colors.dart';
import '../../routes/routes.dart';
import '../../widgets/my_button_widget.dart';
import '../../widgets/mytextformfield_widget.dart';
import '../signup/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Widget buildTopPart() {
    return Column(
      children: [
        Image.asset(
          "images/logo.png",
          height: 100,
          width: 150,
        ),
        Column(
          children: [
            MyTextFormField(
              hintText: "Email",
              obsecureText: false,
            ),
            MyTextFormField(
              hintText: "Password",
              obsecureText: true,
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: MyButtonWidget(
                  text: "Sign In",
                  color: AppColors.baseBlackColor,
                  onPress: () {},
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: MyButtonWidget(
                  text: "Sign Up",
                  color: AppColors.baseDarkPinkColor,
                  onPress: () {
                    PageRouting.goToNextPage(
                      context: context,
                      navigateTo: SignupScreen(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Forgot Password",
          style: LoginScreenStylies.forgotPasswordStylies,
        )
      ],
    );
  }

  Widget buildSocialButton(
      {required Widget child, required Function() onPressed}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: MaterialButton(
        shape: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.5,
            color: AppColors.baseGrey40Color,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }

  Widget buildBottomPart() {
    return Container(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "or sign up with social network",
            style: LoginScreenStylies.signinSocialStylies,
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(children: [
              //facebook ico
              buildSocialButton(
                  onPressed: () {},
                  child: SvgPicture.asset(
                    SvgImages.facebook,
                    color: AppColors.baseBlackColor,
                    width: 45,
                  )),
              //Google icon
              buildSocialButton(
                  onPressed: () {},
                  child: SvgPicture.asset(
                    SvgImages.google,
                    color: AppColors.baseBlackColor,
                    width: 45,
                  )),

              // tweeter icon
              buildSocialButton(
                  onPressed: () {},
                  child: SvgPicture.asset(
                    SvgImages.twitter,
                    color: AppColors.baseBlackColor,
                    width: 45,
                  )),
            ]),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: MaterialButton(
              color: AppColors.baseGrey10Color,
              height: 55,
              elevation: 0,
              shape: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  "Sign up",
                  style: LoginScreenStylies.signupButtonTextStylies,
                ),
              ),
              onPressed: () {
                PageRouting.goToNextPage(
                  context: context,
                  navigateTo: SignupScreen(),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildTopPart(),
                  buildBottomPart(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
