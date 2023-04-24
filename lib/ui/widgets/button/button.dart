import 'package:flutter/material.dart';
import 'package:base_structure_project/enums/view_state.dart';
import 'package:base_structure_project/locator.dart';
import 'package:base_structure_project/services/navigation_service.dart';
import 'package:base_structure_project/ui/shared/colors.dart';
import 'package:base_structure_project/ui/shared/text.dart';
import 'package:base_structure_project/ui/widgets/blog.dart';
import 'package:base_structure_project/ui/widgets/button/icon_button.dart';
import 'package:base_structure_project/ui/widgets/text/text_view.dart';

/// [RectAngleButton] is a custom button that we are using in your app
class RectAngleButton extends StatelessWidget {
  final String nameOfButton;
  final Color? color;
  final Color? borderColor;
  final Color? shadowColor;
  final double? height;
  final double? width;
  final double? radius;
  final VoidCallback? onTap;
  final ViewState state;
  final Color? textColor;
  final double? textSize;

  const RectAngleButton({
    Key? key,
    required this.nameOfButton,
    this.color,
    this.height,
    this.width,
    required this.onTap,
    required this.state,
    this.radius,
    this.borderColor,
    this.shadowColor,
    this.textColor,
    this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
          height: height ?? width * 0.1466,
          width: this.width,
          decoration: BoxDecoration(
            color: color ?? brandMainColor,
            borderRadius: BorderRadius.circular(radius ?? width * 0.032),
            border: Border.all(color: borderColor ?? Colors.transparent),
            boxShadow: [
              BoxShadow(
                color: shadowColor ?? Colors.transparent,
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextView(
                text: nameOfButton,
                color: textColor ?? white,
                size: textSize ?? 15,
              ),
              if (state == ViewState.busy)
                Padding(
                  padding: EdgeInsets.only(left: width * 0.03),
                  child: SizedBox(
                    height: width * 0.05,
                    width: width * 0.05,
                    child: const CircularProgressIndicator(
                      color: white,
                    ),
                  ),
                )
            ],
          )),
    );
  }
}

class BackingButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? borderColor;
  final double? size;

  const BackingButton({Key? key, this.onTap, this.borderColor, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Stroke(
      onTap: onTap ?? () => locator<NavigationService>().goBack(),
      height: size ?? width * 0.12,
      width: size ?? width * 0.12,
      disableBorderColor: borderColor ?? backingButtonBorderColor,
      radius: width * 0.024,
      child: const BackingIcon(),
    );
  }
}

class ClosingButton extends StatelessWidget {
  final VoidCallback? onTap;

  const ClosingButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Stroke(
      onTap: onTap ?? () => locator<NavigationService>().goBack(),
      height: width * 0.1066,
      width: width * 0.1066,
      disableBorderColor: backingButtonBorderColor,
      radius: width * 0.0266,
      child: const ClosingIcon(),
    );
  }
}

class ResendTheCodeButton extends StatelessWidget {
  final VoidCallback? onTap;

  const ResendTheCodeButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const TextView(
            text: resendTheCodeText,
            size: 14,
            color: brandOrangeColor,
          ),
          SizedBox(
            width: width * 0.0186,
          ),
          const ReplayIcon()
        ],
      ),
    );
  }
}

class CustomCheckBox extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final double? titleSize;
  final double size;
  final VoidCallback? onTap;
  final bool checked;

  const CustomCheckBox(
      {Key? key,
      required this.size,
      this.onTap,
      this.checked = false,
      required this.title,
      this.titleColor,
      this.titleSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: TextView(
              text: title,
              size: titleSize ?? 15,
              color: titleColor ?? enableTextFiledColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.0266),
            child: Container(
                height: size,
                width: size,
                decoration: BoxDecoration(
                  color: white,
                  border: Border.all(
                    color: outerCheckBoxColor,
                    width: size / 12.5,
                  ),
                  borderRadius: BorderRadius.circular(size / 5),
                ),
                child: Padding(
                  padding: EdgeInsets.all(size / 12.5),
                  child: Container(
                    height: size / 2,
                    width: size / 2,
                    decoration: BoxDecoration(
                      color: checked ? brandOrangeColor : white,
                      border: Border.all(
                        color: checked ? brandOrangeColor : white,
                      ),
                      borderRadius: BorderRadius.circular(size / 10),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class CustomRadioButton<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;
  final Color color;

  const CustomRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.color = brandMainColor,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        onChanged(value);
      },
      child: Container(
        height: width * 0.05,
        width: width * 0.05,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: value == groupValue ? color : outerCheckBoxColor,
              style: BorderStyle.solid,
            )),
        child: Center(
          child: Container(
            height: width * 0.033,
            width: width * 0.033,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: value == groupValue ? color : Colors.transparent),
          ),
        ),
      ),
    );
  }
}

class CustomSwitchButton extends StatelessWidget {
  final Function(bool) toggleSwitch;
  final bool isSwitched;

  const CustomSwitchButton(
      {Key? key, required this.toggleSwitch, required this.isSwitched})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      onChanged: toggleSwitch,
      value: isSwitched,
      activeColor: white,
      activeTrackColor: brandOrangeColor,
      inactiveThumbColor: white,
      inactiveTrackColor: secondaryGray,
    );
  }
}

/// Star
typedef RatingChangeCallback = void Function(int rating);

class StarRating extends StatelessWidget {
  final int? rating;
  final double? iconSize;
  final RatingChangeCallback? onRatingChanged;
  final Color? color;

  const StarRating(
      {super.key,
      this.rating = 0,
      this.onRatingChanged,
      this.color,
      this.iconSize});

  Widget buildStar(BuildContext context, int index) {
    Widget icon;

    icon = StarIcon(
      size: iconSize,
      isFill: index >= rating! ? false : true,
    );

    return InkResponse(
      onTap: onRatingChanged == null ? null : () => onRatingChanged!(index + 1),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(5, (index) => buildStar(context, index)));
  }
}

class TryAgainButton extends StatelessWidget {
  final VoidCallback? onTap;

  const TryAgainButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(width * 0.0213),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const ReplayIcon(
                isFill: false,
                color: brandMainColor,
              ),
              SizedBox(
                width: width * 0.0186,
              ),
              const TextView(
                text: tryAgainText,
                size: 12,
                color: primaryDark,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
