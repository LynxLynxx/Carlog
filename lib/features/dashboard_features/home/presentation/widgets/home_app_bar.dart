import 'package:carlog/core/constants/images.dart';
import 'package:carlog/core/constants/paddings.dart';
import 'package:carlog/core/extensions/styles_extenstion.dart';
import 'package:carlog/core/theme/styles/container_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

SliverAppBar homeAppBar(BuildContext context) => SliverAppBar(
      toolbarHeight: 120,
      flexibleSpace: Container(
        padding: PaddingsK.h20,
        decoration: BoxDecoration(
          color: context.secondaryContainer,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
        ),
        child: Column(
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello again,",
                      style: context.titleMedium!
                          .copyWith(color: context.onSurface),
                    ),
                    Text(
                      "${FirebaseAuth.instance.currentUser?.displayName ?? "Joe"}!",
                      style: context.titleLarge!
                          .copyWith(color: context.onSurface),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      ImagesK.search,
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      ImagesK.bell,
                      width: 30,
                      height: 30,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: PaddingsK.h20,
              decoration: dropShadowEffect().copyWith(
                color: context.surfaceDim,
                borderRadius: PaddingsK.circular30,
              ),
              padding: PaddingsK.h20v10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Opel",
                        style: context.headlineSmall!.copyWith(
                          color: context.onPrimaryContainer,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Insignia",
                        style: context.titleMedium!.copyWith(
                          color: context.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "173418",
                        style: context.headlineSmall!
                            .copyWith(color: context.onPrimaryContainer),
                      ),
                      Text(
                        "KM",
                        style: context.labelSmall!.copyWith(
                          color: context.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
