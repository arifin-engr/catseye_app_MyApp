import 'package:catseye_app/appColors/app_colors.dart';
import 'package:catseye_app/stylies/signup_screen_stylies.dart';
import 'package:catseye_app/svgimages/svg_images.dart';
import 'package:catseye_app/widgets/my_button_widget.dart';
import 'package:catseye_app/widgets/mytextformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupScreen extends StatelessWidget {
  Widget buildTopPart() {
    return Column(
      children: [
        Image.asset(
          "images/logo.png",
          height: 100,
        ),
        MyTextFormField(
          hintText: "Full name",
          obsecureText: false,
        ),
        MyTextFormField(
          hintText: "Email",
          obsecureText: false,
        ),
        MyTextFormField(
          hintText: "Password",
          obsecureText: true,
        ),
        MyTextFormField(
          hintText: "Confirm Password",
          obsecureText: true,
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: MyButtonWidget(
            onPress: () {},
            color: AppColors.baseDarkPinkColor,
            text: "Create an account",
          ),
        ),
        SizedBox(
          height: 20,
        ),
        RichText(
          text: TextSpan(
            text: "By sigining up you agress to our\n\t",
            style: SignupScreenStylies.signInAgressStyle,
            children: <TextSpan>[
              TextSpan(
                text: "Terms\t",
                style: SignupScreenStylies.termsTextStyle,
              ),
              TextSpan(
                text: "and\t",
                style: SignupScreenStylies.andTextStyle,
              ),
              TextSpan(
                text: "Conditions of Use",
                style: SignupScreenStylies.conditionsOfUseStyle,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buildSocialButton(
      {required Widget child, required Function() onPressed}) {
    return MaterialButton(
      onPressed: onPressed,
      shape: OutlineInputBorder(
        borderSide: BorderSide(
          width: 0.5,
          color: AppColors.baseGrey40Color,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: child,
    );
  }

  Widget buildBottomPart() {
    return Container(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "or sign in with social networks",
            style: SignupScreenStylies.signInSocialStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //facebook social button
                buildSocialButton(
                  onPressed: () {},
                  child: SvgPicture.asset(
                    SvgImages.facebook,
                    color: AppColors.baseBlackColor,
                    width: 45,
                  ),
                ),
                //Google social button
                buildSocialButton(
                  onPressed: () {},
                  child: SvgPicture.asset(
                    SvgImages.google,
                    color: AppColors.baseBlackColor,
                    width: 45,
                  ),
                ),
                //Twitter social button
                buildSocialButton(
                  onPressed: () {},
                  child: SvgPicture.asset(
                    SvgImages.twitter,
                    color: AppColors.baseBlackColor,
                    width: 45,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            child: MaterialButton(
              onPressed: () {},
              color: AppColors.baseGrey10Color,
              height: 55,
              elevation: 0,
              child: Center(
                child: Text(
                  "Sign up",
                  style: SignupScreenStylies.signUpButtonTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            buildTopPart(),
            buildBottomPart(),
          ],
        ),
      ),
    );
  }
}
