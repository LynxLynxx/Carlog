import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

enum ContributorButtonEnum {
  github("assets/icons/github.svg", "Github"),
  website("assets/icons/website.svg", "Website"),
  linkedin("assets/icons/linkedin.svg", "Linkedin");

  final String icon;
  final String label;
  const ContributorButtonEnum(this.icon, this.label);
}

class ContributorConnectButton extends StatelessWidget {
  final String url;
  final ContributorButtonEnum contributorButtonEnum;
  const ContributorConnectButton(
      {super.key, required this.url, required this.contributorButtonEnum});

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonalIcon(
      onPressed: () async {
        Uri uri = Uri.parse(url);
        if (!await launchUrl(uri)) {
          throw Exception('Could not launch $url');
        }
      },
      label: Text(contributorButtonEnum.label),
      icon: SvgPicture.asset(contributorButtonEnum.icon),
    );
  }
}
