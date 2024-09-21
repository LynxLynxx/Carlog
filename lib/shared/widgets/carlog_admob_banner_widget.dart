import 'package:carlog/core/services/admob_service.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class CarlogAdmobBannerWidget extends StatefulWidget {
  final double? width;
  const CarlogAdmobBannerWidget({super.key, this.width});

  @override
  State<CarlogAdmobBannerWidget> createState() =>
      _CarlogAdmobBannerWidgetState();
}

class _CarlogAdmobBannerWidgetState extends State<CarlogAdmobBannerWidget> {
  BannerAd? _bannerAd;

  final adUnitId = AdmobService().bannerAdId;

  @override
  void initState() {
    super.initState();
    loadAd();
  }

  @override
  void dispose() {
    super.dispose();
    _bannerAd?.dispose();
  }

  /// Loads a banner ad.
  void loadAd() {
    _bannerAd = BannerAd(
      adUnitId: adUnitId,
      request: const AdRequest(),
      size: widget.width == null
          ? AdSize.banner
          : AdSize(
              width: widget.width!.toInt(),
              height: 50,
            ),
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');
          // Dispose the ad here to free resources.
          ad.dispose();
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) {},
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) {},
        // Called when an impression occurs on the ad.
        onAdImpression: (Ad ad) {},
      ),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    return _bannerAd != null
        ? Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: SizedBox(
                width: _bannerAd!.size.width.toDouble(),
                height: _bannerAd!.size.height.toDouble(),
                child: AdWidget(ad: _bannerAd!),
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
