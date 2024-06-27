import 'package:easybill_app/app/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class EBCustomListTile extends StatelessWidget {
  const EBCustomListTile(
      {super.key,
      this.titleName,
      this.trailingIcon,
      this.onTap,
      this.trailingWidget,
      this.leading,
      this.trailingIconSize,
      this.subtitle});

  final String? titleName;
  final IconData? trailingIcon;
  final GestureTapCallback? onTap;
  final Widget? trailingWidget, leading, subtitle;
  final double? trailingIconSize;

  @override
  Widget build(BuildContext context) {
    return trailingIcon != null
        ? ListTile(
            leading: leading,
            title: Text(
              titleName ?? '',
              style: EBAppTextStyle.bodyText,
            ),
            subtitle: subtitle,
            trailing: Icon(
              trailingIcon,
              size: trailingIconSize ?? 16,
            ),
            onTap: onTap,
          )
        : ListTile(
            leading: leading,
            title: Text(
              titleName ?? '',
              style: EBAppTextStyle.bodyText,
            ),
            trailing: trailingWidget,
            subtitle: subtitle,
            onTap: onTap,
          );
  }
}
