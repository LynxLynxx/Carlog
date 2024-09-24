// @LazySingleton()

import 'dart:io';

import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:aad_oauth/model/failure.dart';
import 'package:aad_oauth/model/token.dart';
import 'package:carlog/core/router/router.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class MicrosoftService {
  final Config? config;

  MicrosoftService({this.config});

  static final Config config2 = Config(
    tenant: "common",
    clientId: "54278a36-bf97-4122-a443-ee5f8c158c08",

    // scope: "https://graph.microsoft.com/.default",
    scope: "openid profile offline_access User.Read.All ProfilePhoto.Read.All",

    redirectUri: Platform.isAndroid
        ? "msal54278a36-bf97-4122-a443-ee5f8c158c08://auth"
        : "msauth.org.rsapps.carlog://auth",

    navigatorKey: rootNavigatorKey,
    webUseRedirect:
        true, // default is false - on web only, forces a redirect flow instead of popup auth
    loader: const Center(child: CircularProgressIndicator()),
  );

  Future<Either<Failure, Token>> signInWithMicrosoft() async {
    // log(config.authorizationUrl);
    final oauth = AadOAuth(config2);
    await oauth.logout();
    final result = await oauth.login();

    return result;
  }
}
