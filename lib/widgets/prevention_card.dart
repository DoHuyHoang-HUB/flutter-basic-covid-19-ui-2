import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PreventionCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  const PreventionCard({
    Key? key,
    required this.svgSrc,
    required this.title,
  }) : super(key: key);

  get kPrimaryColor => null;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(svgSrc),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              ?.copyWith(color: kPrimaryColor),
        ),
      ],
    );
  }
}
