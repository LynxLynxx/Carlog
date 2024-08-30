import 'package:carlog/core/addons/encode_query_params.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/features/settings_features/about_app/presentation/widgets/companies_list.dart';
import 'package:carlog/features/settings_features/about_app/presentation/widgets/contributor_card_widget.dart';
import 'package:carlog/features/settings_features/about_app/presentation/widgets/contributor_connect_button.dart';
import 'package:carlog/shared/widgets/carlog_bottom_button_widget.dart';
import 'package:carlog/shared/widgets/carlog_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

enum ContactCompantOptionsEnum {
  email,
  website,
}

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CarlogScaffold.title(
      title: "About",
      bottomWidget: CarlogBottomButtonWidget(
        title: "Contact us",
        onTap: () async {
          await contactCompanyModalBottomSheet(context).then((value) async {
            if (value == null) {
              return;
            } else if (value is ContactCompantOptionsEnum) {
              switch (value) {
                case ContactCompantOptionsEnum.email:
                  final Uri emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: 'ryszard.schossler@gmail.com',
                    query: encodeQueryParameters(<String, String>{
                      'subject': 'RS Apps: ',
                    }),
                  );
                  if (!await launchUrl(emailLaunchUri)) {
                    throw Exception('Could not launch $emailLaunchUri');
                  }
                  break;
                case ContactCompantOptionsEnum.website:
                  Uri url = Uri.parse("https://rsapps.org/");
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }

                  break;
              }
            }
          });
        },
        isActive: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "The Carlog application was created by RS Apps, which has been on the market since 2023 and has cooperated with several companies. If you are interested in cooperation, contact us.",
              style: context.bodyLarge,
            ),
            CompaniesListWidget(
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Main Developers:",
                style: context.titleLarge,
              ),
            ),
            const ContributorCardWidget(
              contributorName: "Ryszard Schossler",
              contributorJobTitle: "Lead Mobile Developer",
              connectButtons: [
                ContributorConnectButton(
                    url: "https://github.com/LynxLynxx",
                    contributorButtonEnum: ContributorButtonEnum.github),
                ContributorConnectButton(
                    url: "https://lynxlynxx.github.io/",
                    contributorButtonEnum: ContributorButtonEnum.website),
                ContributorConnectButton(
                    url:
                        "https://www.linkedin.com/in/ryszard-schossler-578b0b225/",
                    contributorButtonEnum: ContributorButtonEnum.linkedin),
              ],
            ),
            const ContributorCardWidget(
              contributorName: "Jan Rydzewski",
              contributorJobTitle: "Mobile Developer",
              connectButtons: [
                ContributorConnectButton(
                    url: "https://github.com/janrydzewski",
                    contributorButtonEnum: ContributorButtonEnum.github),
                ContributorConnectButton(
                    url: "https://janrydzewski.github.io/website/",
                    contributorButtonEnum: ContributorButtonEnum.website),
                ContributorConnectButton(
                    url: "https://www.linkedin.com/in/jan-rydzewski-1a702529a/",
                    contributorButtonEnum: ContributorButtonEnum.linkedin),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> contactCompanyModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => SizedBox(
        height: 220,
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton.icon(
                onPressed: () => context.pop(ContactCompantOptionsEnum.email),
                label: const Text("Send e-mail"),
                icon: const Icon(Icons.email_rounded),
                style: FilledButton.styleFrom(
                    fixedSize: const Size.fromWidth(220)),
              ),
              const SizedBox(height: 20),
              FilledButton.icon(
                onPressed: () => context.pop(ContactCompantOptionsEnum.website),
                label: const Text("Visit webiste"),
                style: FilledButton.styleFrom(
                    fixedSize: const Size.fromWidth(220)),
                icon: SvgPicture.asset(
                  "assets/icons/website.svg",
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
              TextButton(
                onPressed: () => context.pop(),
                child: const Text("Cancel"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
