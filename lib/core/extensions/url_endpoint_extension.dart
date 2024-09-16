String? getUrlEndpoint(String? url) {
  if (url == null) {
    return null;
  }
  String route = url.replaceAll("#", "/");

  if (!route.contains("https://")) {
    route = "https://$route";
  }

  return route;
}
