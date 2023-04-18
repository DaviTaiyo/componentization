import 'package:flutter/material.dart';
import 'package:smokerstabacaria/Core/Enums/Button_size.dart';
import 'package:smokerstabacaria/utils/mapping_Colors.dart';

import '../Core/Enums/Button_type.dart';

class ButtonWidget extends StatelessWidget {
  final ButtonType buttonType;
  final ButtonSize? width;
  final Function? onPressed;
  final bool isOutline;
  final bool isLoading;
  final bool isDisabled;
  final String? text;
  final IconData? iconR;
  final IconData? iconL;

  const ButtonWidget({
    Key? key,
    this.buttonType = ButtonType.primary,
    this.width,
    this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.isOutline = false,
    this.iconR,
    this.iconL,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _getWidth(),
      child: Opacity(
        opacity: isDisabled ? 0.5 : 1,
        child: AbsorbPointer(
          absorbing: isDisabled || isLoading,
          child: Container(
            decoration: isOutline
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(ColorsConstants.smokers))
                : BoxDecoration(color: Colors.grey.shade600),
            child: TextButton(
              key: ValueKey('kDefaultButton'),
              onPressed: () => onPressed?.call(),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                  Size.fromHeight(kToolbarHeight),
                ),
                backgroundColor: MaterialStateProperty.all(
                  backgroundColor(context),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: isOutline
                        ? BorderRadius.circular(12)
                        : BorderRadius.circular(0),
                  ),
                ),
                side: MaterialStateProperty.all(border(context)),
                visualDensity: VisualDensity.compact,
                overlayColor: MaterialStateProperty.all(
                  Color(ColorsConstants.smokers).withOpacity(0.25),
                ),
                padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
              ),
              child: isLoading
                  ? SizedBox(
                      key: ValueKey('kLoading'),
                      height: 15,
                      width: 15,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                        color: Theme.of(context).primaryColor,
                        strokeWidth: 1.5,
                      ),
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        iconL != null ? Icon(iconL) : SizedBox(),
                        Text(
                          text ?? '',
                          key: ValueKey('kButtonText'),
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    color: buttonType == ButtonType.primary
                                        ? Colors.white
                                        : Theme.of(context).primaryColor,
                                  ),
                        ),
                        iconR != null ? Icon(iconR) : SizedBox()
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }

  double _getWidth() {
    switch (width) {
      case ButtonSize.small:
        return 100.0;
      case ButtonSize.medium:
        return 200.0;
      case ButtonSize.large:
        return 300.0;
      default:
        return double.infinity;
    }
  }

  Color backgroundColor(BuildContext context) {
    switch (buttonType) {
      case ButtonType.primary:
        return Color(ColorsConstants.smokers);
      case ButtonType.secondary:
        return Color(ColorsConstants.black);
      default:
        return Color(ColorsConstants.light);
    }
  }

  BorderSide border(BuildContext context) {
    switch (buttonType) {
      case ButtonType.primary:
        return BorderSide(color: Colors.transparent, width: 0.25);
      default:
        return BorderSide(
          color: Theme.of(context).primaryColor.withOpacity(0.25),
          width: 0.25,
        );
    }
  }
}
