import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../globals.dart';
import 'base_prefix_icon.dart';

class BaseTextInput extends StatelessWidget {
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? hintText;
  final IconData? prefixIcon;
  final EdgeInsets? padding;
  final bool? obscureText;
  final IconButton? suffixIcon;
  final bool isPhone;
  final bool isDate;
  final bool isValue;
  final EdgeInsets? iconsPadding;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final bool done;
  final Function(String)? onChanged;
  final bool enabled;
  final TextEditingController? controller;
  final String? initialValue;

  BaseTextInput(
      {this.keyboardType,
        this.textInputAction,
        this.hintText,
        this.padding,
        this.prefixIcon,
        this.obscureText,
        this.suffixIcon,
        this.isPhone = false,
        this.isDate = false,
        this.isValue = false,
        this.iconsPadding,
        this.validator,
        this.onSaved,
        this.done = false,
        this.onChanged,
        this.enabled = true,
        this.controller,
      this.initialValue } );

  final phoneMask = new MaskTextInputFormatter(
      mask: '(##) #####-####', filter: {'#': RegExp(r'[0-9]')});

  final dateMask = new MaskTextInputFormatter(
    mask: '##/##/####', filter: {'#': RegExp(r'[0-9]')});

  final moneyMask = new CurrencyTextInputFormatter(locale: 'pt-br', decimalDigits: 2, symbol: 'R\$');
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.all(8),
      child: TextFormField(
        style: Globals.instance!.textTheme.bodyText1,
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: Globals.instance!.theme.primaryColor,
        keyboardType: keyboardType ?? TextInputType.text,
        textInputAction: textInputAction ?? (!done ? TextInputAction.next : TextInputAction.done),
        onEditingComplete: () => !done ? FocusScope.of(context).nextFocus() : FocusScope.of(context).unfocus(),
        decoration: InputDecoration(
          hintText: hintText,
          labelText: hintText != null && hintText!.isNotEmpty ? hintText : null,
          prefixIcon: prefixIcon != null
              ? BasePrefixIcon(
            iconData: prefixIcon!,
            padding: iconsPadding,
          )
              : null,
          suffixIcon: suffixIcon,

        ).applyDefaults(Globals.instance!.inputTheme),
        obscureText: obscureText ?? false,
        inputFormatters: isPhone ? [phoneMask] : isDate ? [dateMask] :  isValue ? [moneyMask] : null,
        validator: validator,
        onSaved: onSaved,
        onChanged: onChanged,
        enabled: enabled,
        initialValue: initialValue,
      ),
    );
  }
}