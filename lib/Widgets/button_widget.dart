import 'package:flutter/material.dart';

import '../Core/Enums/Button_type.dart';

class ButtonWidget extends StatelessWidget {
  final ButtonType buttonType;
  final Function? onPressed;
  final bool isLoading;
  final bool isDisabled;
  final String text;
  final Color color;

  const ButtonWidget({
    Key? key,
    this.buttonType = ButtonType.primary,
    this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    required this.color,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12),
          topLeft: Radius.circular(12),
        ),
        color: color,
      ),
      padding: buttonType == ButtonType.primary
          ? null
          : const EdgeInsets.only(top: 1),
      child: TextButton(
        onPressed: isDisabled || isLoading ? null : () => onPressed?.call(),
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
            Size.fromHeight(kToolbarHeight),
          ),
          backgroundColor:
              MaterialStateProperty.all(buttonType == ButtonType.primary
                  ? isDisabled
                      ? Theme.of(context).primaryColor.withOpacity(0.5)
                      : Theme.of(context).primaryColor
                  : color),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12), topLeft: Radius.circular(12)),
            ),
          ),
          visualDensity: VisualDensity.compact,
          overlayColor: MaterialStateProperty.all(
            color.withOpacity(0.25),
          ),
          padding: MaterialStateProperty.all(
            EdgeInsets.all(isLoading ? 0 : 20),
          ),
        ),
        child: SafeArea(
          child: isLoading
              ? SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(strokeWidth: 2.5),
                )
              : Text(
                  text,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: buttonType == ButtonType.primary
                            ? color
                            : isDisabled
                                ? color.withOpacity(0.5)
                                : color,
                      ),
                ),
        ),
      ),
    );
  }
}
