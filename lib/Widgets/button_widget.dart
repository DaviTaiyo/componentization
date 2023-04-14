import 'package:flutter/material.dart';

import '../Core/Enums/Button_type.dart';

class ButtonWidget extends StatelessWidget {
  final ButtonType buttonType;
  final Function? onPressed;
  final bool isOutline;
  final bool isLoading;
  final bool isDisabled;
  final String text;
  final Color color;
  final double? width;

  const ButtonWidget({
    Key? key,
    this.buttonType = ButtonType.primary,
    this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.isOutline = false,
    this.width,
    required this.color,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      child: Opacity(
        opacity: isDisabled ? 0.5 : 1,
        child: AbsorbPointer(
          absorbing: isDisabled || isLoading,
          child: Container(
            decoration: isOutline
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.shade600)
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
                  Colors.grey.withOpacity(0.25),
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
                  : Text(
                      text,
                      key: ValueKey('kButtonText'),
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: buttonType == ButtonType.primary
                                ? Colors.white
                                : Theme.of(context).primaryColor,
                          ),
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Color backgroundColor(BuildContext context) {
    switch (buttonType) {
      case ButtonType.primary:
        return color;
      default:
        return Colors.white;
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
