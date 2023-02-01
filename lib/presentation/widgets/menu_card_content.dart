import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final List<Widget>? tags;
  final double? tagSpacing;
  final double? tagRunSpacing;
  final Widget? title;
  final Widget? desc;
  final Widget? footer;

  const MenuCard({
    super.key,
    this.contentPadding,
    this.desc,
    this.footer,
    this.tagRunSpacing,
    this.tagSpacing,
    this.tags,
    this.title,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: contentPadding??const EdgeInsets.only(
        top: 8,
        bottom: 12,
        left: 8,
        right: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (tags != null)
            Wrap(
              spacing: tagSpacing ?? 12,
              runSpacing: tagRunSpacing ?? 10,
              children: tags!,
            ),
          if (title != null || desc != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null) title!,
                  if (title != null && desc != null)
                    const SizedBox(
                      height: 2,
                    ),
                  if (desc != null) desc!,
                ],
              ),
            ),
          if (footer != null)
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: footer!,
            ),
        ],
      ),
    );
  }
}