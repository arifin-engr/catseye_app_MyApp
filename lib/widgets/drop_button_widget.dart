import 'package:catseye_app/appColors/app_colors.dart';
import 'package:catseye_app/stylies/detail_screen_stylies.dart';
import 'package:flutter/material.dart';

class DropButton extends StatefulWidget {
  final String hintText;

  ///String ratingController;
  final List<String> item;

  DropButton(
      {required this.hintText,
      //required this.ratingController,
      required this.item});
  @override
  _DropButtonState createState() => _DropButtonState();
}

class _DropButtonState extends State<DropButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
            fillColor: AppColors.baseGrey20Color,
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.0))),
        hint: Text(
          "${widget.hintText}",
          style: DetailScreenStylies.productDropDownValueStyle,
        ),
        //value: widget.ratingController,
        items: widget.item
            .map((e) => DropdownMenuItem(
                  child: Text(e),
                  value: e,
                ))
            .toList(),
        onChanged: (value) {
          setState(() {
            //widget.ratingController = value!;
          });
        },
      ),
    );
  }
}
