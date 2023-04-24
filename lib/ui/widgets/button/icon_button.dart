import 'package:flutter/material.dart';
import 'package:base_structure_project/ui/shared/colors.dart';
import 'package:base_structure_project/ui/widgets/blog.dart';

/// Collection of IconButtons  that are using in your app

class InfoIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final bool isFill;
  final Color? color;
  final double? size;

  const InfoIcon(
      {Key? key, this.onTap, this.isFill = true, this.color, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Icon(
        isFill ? Icons.info : Icons.info_outline,
        size: size ?? width * 0.0533,
        color: color ?? primaryDark,
      ),
    );
  }
}

class RemoveIcon extends StatelessWidget {
  final VoidCallback? onTap;

  const RemoveIcon({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.highlight_remove,
        size: width * 0.0446,
        color: removeIconColor,
      ),
    );
  }
}

class BackingIcon extends StatelessWidget {
  final VoidCallback? onTap;

  const BackingIcon({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: width * 0.04,
        height: width * 0.0293,
        child: Icon(
          Icons.arrow_back,
          size: width * 0.048,
          color: backingIconColor,
        ),
      ),
    );
  }
}

class ClosingIcon extends StatelessWidget {
  final VoidCallback? onTap;

  const ClosingIcon({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.close,
        size: width * 0.0533,
        color: backingIconColor,
      ),
    );
  }
}

class ReplayIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final bool isFill;
  final Color? color;

  const ReplayIcon({Key? key, this.onTap, this.isFill = true, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Icon(
        isFill ? Icons.replay_circle_filled : Icons.replay,
        size: width * 0.0533,
        color: color ?? brandOrangeColor,
      ),
    );
  }
}

class SearchIcon extends StatelessWidget {
  final VoidCallback? onTap;

  const SearchIcon({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.search,
        color: citySearchTextFieldBorder,
        size: width * 0.064,
      ),
    );
  }
}

class LocationIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? color;
  final bool isFill;
  final double? size;

  const LocationIcon(
      {Key? key, this.onTap, this.color, this.isFill = false, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Icon(
        isFill ? Icons.location_on : Icons.location_on_outlined,
        color: color ?? brandOrangeColor,
        size: size ?? width * 0.064,
      ),
    );
  }
}

class ArrowForwardIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? color;
  final double? size;

  const ArrowForwardIcon({Key? key, this.onTap, this.color, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Icon(
        Icons.arrow_forward_ios,
        color: color ?? primaryDark,
        size: size ?? width * 0.032,
      ),
    );
  }
}

class ArrowBackIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? color;
  final double? size;

  const ArrowBackIcon({Key? key, this.onTap, this.color, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.arrow_back_ios_sharp,
        color: color ?? primaryDark,
        size: size ?? width * 0.032,
      ),
    );
  }
}

class CustomCircleIconButton extends StatelessWidget {
  final double? size;
  final Color? color;
  final Widget? icon;
  final VoidCallback? onTap;
  final bool hasShadow;
  const CustomCircleIconButton(
      {Key? key, this.size, this.color, this.icon, this.onTap, this.hasShadow = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Stroke(
      width: size ?? width * 0.1866,
      height: size ?? width * 0.1866,
      radius: (size ?? width * 0.1866) / 2,
      backgroundColor: color ?? brandMainColor,
      disableShadowColor: hasShadow ? color ?? brandMainColor : null,
      onTap: onTap,
      child: icon,
    );
  }
}

class CallingIcon extends StatelessWidget {
  final VoidCallback? onTap;

  const CallingIcon({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Icon(
        Icons.call,
        color: primaryGreenColor,
        size: width * 0.06,
      ),
    );
  }
}

class CheckIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final double? size;
  final Color? color;

  const CheckIcon({Key? key, this.onTap, this.color, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
        onTap: onTap,
        child: Icon(
          Icons.check_rounded,
          color: color ?? brandOrangeColor,
          size: size ?? width * 0.064,
        ));
  }
}

class ShareIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final double? size;
  final Color? color;

  const ShareIcon({Key? key, this.onTap, this.color, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
        onTap: onTap,
        child: Icon(
          Icons.share,
          color: color ?? brandOrangeColor,
          size: size ?? width * 0.064,
        ));
  }
}

class CopyIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final double? size;
  final Color? color;

  const CopyIcon({Key? key, this.onTap, this.color, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
        onTap: onTap,
        child: Icon(
          Icons.copy,
          color: color ?? brandOrangeColor,
          size: size ?? width * 0.064,
        ));
  }
}

class ViewIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final double? size;
  final Color? color;

  const ViewIcon({Key? key, this.onTap, this.color, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
        onTap: onTap,
        child: Icon(
          Icons.remove_red_eye_rounded,
          color: color ?? brandOrangeColor,
          size: size ?? width * 0.064,
        ));
  }
}

class AssignmentIcon extends StatelessWidget {
  final VoidCallback? onTap;

  const AssignmentIcon({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
        onTap: onTap,
        child: Icon(
          Icons.assignment_outlined,
          color: brandOrangeColor,
          size: width * 0.056,
        ));
  }
}

class AccessTimeIcon extends StatelessWidget {
  final VoidCallback? onTap;

  const AccessTimeIcon({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
        onTap: onTap,
        child: Icon(
          Icons.access_time_outlined,
          color: brandOrangeColor,
          size: width * 0.056,
        ));
  }
}

class DescriptionIcon extends StatelessWidget {
  final VoidCallback? onTap;

  const DescriptionIcon({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
        onTap: onTap,
        child: Icon(
          Icons.description,
          color: brandOrangeColor,
          size: width * 0.056,
        ));
  }
}

class CheckCircleIcon extends StatelessWidget {
  final VoidCallback? onTap;

  const CheckCircleIcon({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
        onTap: onTap,
        child: Icon(
          Icons.check_circle_outline,
          color: primaryGreenColor,
          size: width * 0.056,
        ));
  }
}

class DateIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? color;
  final double? size;

  const DateIcon({Key? key, this.onTap, this.color, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
        onTap: onTap,
        child: Icon(
          Icons.date_range,
          color: color ?? primaryTextColor,
          size: size ?? width * 0.056,
        ));
  }
}

class KeyboardArrowDownIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? color;

  const KeyboardArrowDownIcon({Key? key, this.onTap, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.keyboard_arrow_down_sharp,
        color: color ?? primaryDark,
        size: width * 0.0426,
      ),
    );
  }
}

class KeyboardArrowUpIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? color;

  const KeyboardArrowUpIcon({Key? key, this.onTap, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.keyboard_arrow_up_sharp,
        color: color ?? primaryDark,
        size: width * 0.0426,
      ),
    );
  }
}

class MoreHorizontalIcon extends StatelessWidget {
  final VoidCallback? onTap;

  const MoreHorizontalIcon({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.more_horiz,
        color: primaryDark,
        size: width * 0.064,
      ),
    );
  }
}

class AddCircleIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? color;

  const AddCircleIcon({Key? key, this.onTap, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.add_circle_outline,
        color: color ?? primaryGray,
        size: width * 0.0426,
      ),
    );
  }
}

class DeleteIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final double? size;
  final bool isFill;
  const DeleteIcon({Key? key, this.onTap, this.size, this.isFill = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Icon(
        isFill ? Icons.delete : Icons.delete_outline,
        color: primaryErrorColor,
        size: size ?? width * 0.0533,
      ),
    );
  }
}

class EditIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? color;
  final double? size;

  const EditIcon({Key? key, this.onTap, this.color, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.edit_rounded,
        color: color ?? primaryDark,
        size: size ?? width * 0.0533,
      ),
    );
  }
}

class MyLocationIcon extends StatelessWidget {
  final VoidCallback? onTap;

  const MyLocationIcon({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.my_location,
        color: primaryDark,
        size: width * 0.0533,
      ),
    );
  }
}

class WalletBalanceIcon extends StatelessWidget {
  final VoidCallback? onTap;

  const WalletBalanceIcon({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.account_balance_wallet_outlined,
        color: primaryDark,
        size: width * 0.0533,
      ),
    );
  }
}

class TicketIcon extends StatelessWidget {
  final VoidCallback? onTap;

  const TicketIcon({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.message_outlined,
        color: primaryDark,
        size: width * 0.0533,
      ),
    );
  }
}

class InviteFriendsIcon extends StatelessWidget {
  final VoidCallback? onTap;

  const InviteFriendsIcon({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.person_add_rounded,
        color: primaryDark,
        size: width * 0.0533,
      ),
    );
  }
}

class RulesIcon extends StatelessWidget {
  final VoidCallback? onTap;

  const RulesIcon({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.rule_sharp,
        color: primaryDark,
        size: width * 0.0533,
      ),
    );
  }
}

class SupportAgentIcon extends StatelessWidget {
  final VoidCallback? onTap;

  const SupportAgentIcon({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.support_agent,
        color: primaryDark,
        size: width * 0.0533,
      ),
    );
  }
}

class ExitToAppIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final double? size;
  final Color? color;

  const ExitToAppIcon({Key? key, this.onTap, this.size, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.exit_to_app,
        color: color ?? primaryDark,
        size: size ?? width * 0.0533,
      ),
    );
  }
}

class CancelIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final double? size;
  final Color? color;

  const CancelIcon({Key? key, this.onTap, this.size, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.cancel_outlined,
        color: color ?? primaryDark,
        size: size ?? width * 0.0533,
      ),
    );
  }
}

class ArrowUpWardIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? color;

  const ArrowUpWardIcon({Key? key, this.onTap, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.arrow_upward,
        color: color,
        size: width * 0.0533,
      ),
    );
  }
}

class ArrowDownWardIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? color;

  const ArrowDownWardIcon({Key? key, this.onTap, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.arrow_downward,
        color: color,
        size: width * 0.0533,
      ),
    );
  }
}

class SendIcon extends StatelessWidget {
  final VoidCallback? onTap;

  const SendIcon({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: RotatedBox(
        quarterTurns: 2,
        child: Icon(
          Icons.send,
          color: white,
          size: width * 0.0533,
        ),
      ),
    );
  }
}

class StarIcon extends StatelessWidget {
  final double? size;
  final bool isFill;

  const StarIcon({
    Key? key,
    this.size,
    this.isFill = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      isFill ? Icons.star : Icons.star_border,
      size: size,
      color: starColor,
    );
  }
}

class PermissionIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? color;
  final double? size;

  const PermissionIcon({Key? key, this.onTap, this.color, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.lock_outline,
        color: color ?? brandOrangeColor,
        size: size ?? width * 0.064,
      ),
    );
  }
}

class CircleRoundedIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? color;

  const CircleRoundedIcon({Key? key, this.onTap, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.circle_rounded,
        color: color ?? primaryDark,
        size: width * 0.032,
      ),
    );
  }
}
class DownloadIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? color;
  final double? size;

  const DownloadIcon({Key? key, this.onTap, this.color, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.download_outlined,
        color: color ?? primaryDark,
        size: size ?? width * 0.0533,
      ),
    );
  }
}
class IncreaseIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? color;
  final double? size;

  const IncreaseIcon({Key? key, this.onTap, this.color, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.add,
        color: color ?? primaryDark,
        size: size ?? width * 0.0533,
      ),
    );
  }
}
class DecreaseIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? color;
  final double? size;

  const DecreaseIcon({Key? key, this.onTap, this.color, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.remove,
        color: color ?? primaryDark,
        size: size ?? width * 0.0533,
      ),
    );
  }
}

class InboxIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? color;
  final double? size;

  const InboxIcon({Key? key, this.onTap, this.color, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Icon(
        Icons.email,
        color: color ?? primaryDark,
        size: size ?? width * 0.0533,
      ),
    );
  }
}

class MessageIcon extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? color;
  final double? size;
  final bool isRead;

  const MessageIcon({Key? key, this.onTap, this.color, this.size, this.isRead = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Icon(
        isRead ?  Icons.message_outlined : Icons.email,
        color: color ?? primaryDark,
        size: size ?? width * 0.0533,
      ),
    );
  }
}