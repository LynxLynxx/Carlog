'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "287ef8618bb5ccd1bd648bddb45f2b13",
"version.json": "744f7b89e0eb5506c07dcaae898b1203",
"index.html": "eba14529c80c8698d3541d595a8a017c",
"/": "eba14529c80c8698d3541d595a8a017c",
"main.dart.js": "18cb788dd78764b7ed18e8166fabc88a",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "abc3537dcd36eb1905ed80c78e2623cc",
"assets/AssetManifest.json": "c9d493caaa8a3b50808024d05aaad336",
"assets/NOTICES": "86258b6f8dba7e87355e0bd3496a73d1",
"assets/FontManifest.json": "e9d66f9d5bba929c211da6ee4b4a2ed9",
"assets/AssetManifest.bin.json": "1154e83dfaacc61859399576afc87956",
"assets/packages/animated_snack_bar/assets/monochrome/comment-dots.svg": "44311bf381ea1155bfe38c40d44c577a",
"assets/packages/animated_snack_bar/assets/monochrome/exclamation-octagon.svg": "ab5fb6de2478b95f911cebb5cf6af9c3",
"assets/packages/animated_snack_bar/assets/monochrome/exclamation-triangle.svg": "10427de487dc532646c4a11f6be3fe84",
"assets/packages/animated_snack_bar/assets/monochrome/check-circle.svg": "f6d9dd67711da5b6d4d965f66c10cd07",
"assets/packages/animated_snack_bar/assets/monochrome/exclamation-circle.svg": "63ffc503c8e024f9752866e021afb744",
"assets/packages/animated_snack_bar/assets/regular/exclamation-triangle.svg": "57a895d149648e4b69c7681d4efb2052",
"assets/packages/animated_snack_bar/assets/regular/info-circle.svg": "e733e8ecda8758e6b69d20cc1ca1c6c4",
"assets/packages/animated_snack_bar/assets/regular/check-circle.svg": "0936541fbbf9ebf325169373c2d2439a",
"assets/packages/animated_snack_bar/assets/regular/exclamation-circle.svg": "69c777fe5b9ffd2f8286ca47f98d1a31",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/flutter_map/lib/assets/flutter_map_logo.png": "208d63cc917af9713fc9572bd5c09362",
"assets/packages/flutter_image_compress_web/assets/pica.min.js": "6208ed6419908c4b04382adc8a3053a2",
"assets/packages/aad_oauth/assets/msalv2.js": "7fb1a65e14acf2e247a813225eed3ac8",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "4f25c98198c6dd0790ab9b8aec49ddda",
"assets/fonts/MaterialIcons-Regular.otf": "3591c9a9d99df535495588766c38e965",
"assets/assets/car_paint.json": "e86414adbc07684ea5947093620b96c7",
"assets/assets/app_app_store.png": "b255c13e2cb9e998fea8565c9fe08416",
"assets/assets/delete.json": "3116368dd838fc62aa7fd8a1e868dd59",
"assets/assets/carlog_iphone.png": "96403a5d433ad2dc3ed5c39c8b5a08c3",
"assets/assets/empty_calendar.json": "f72b6f048009adb0a4e83a73b8279e45",
"assets/assets/mail%2520with%2520document.png": "3c2965a20e9d8662a734dca65f1a15a2",
"assets/assets/appleLogo3.png": "84f2c576923c5370b4660e6311447def",
"assets/assets/appleLogo1.png": "d84dfc4cc642d715ff4bc942f452ff42",
"assets/assets/add_car.json": "a154159eb9291019bdb126cdbb27be67",
"assets/assets/car_drive.json": "d7d85c6e99ed66c5c1e91e29718b6567",
"assets/assets/MicrosoftLogo1.png": "54dc7028b76b4b2de63c54a8d526d1f8",
"assets/assets/unknown_error.json": "42824f4aca3aa32a22a8d36c8948d004",
"assets/assets/background_right.png": "2787d5592ba53f3ed7907d9224dc9e26",
"assets/assets/statistics.json": "b015ca0cb76351e5348736e0ece9180c",
"assets/assets/connection_lost.json": "a9bc22d0e1877ea5870d4ee17deb0b0d",
"assets/assets/background_left.png": "a66316d4874514a1a3016a79e5815ac7",
"assets/assets/electric.json": "3fc8b5eeb5d53b1db9c6b59d17b8d1e5",
"assets/assets/car_logo.svg": "7d03afaac42b9d05ac7652af81fa435e",
"assets/assets/web_iphone.png": "d3b4b6b38d2abbb74850af88aee27263",
"assets/assets/mail.json": "1ae9799bf72450a735655237b94e02d9",
"assets/assets/analytics_icons/roadFee.png": "61fc2b7c81aee588bb28c334b65c822e",
"assets/assets/analytics_icons/serviceFee.png": "05f1eac3430a4335191d3d055f18f19d",
"assets/assets/analytics_icons/insuranceFee.png": "ef824ce3ecc880841d25dd8d1d48277e",
"assets/assets/analytics_icons/parkingFee.png": "7fa6a4f6930b17ae00762963ac4863c4",
"assets/assets/analytics_icons/carWash.png": "6540852797fcc7eb626b15228d9c0dc3",
"assets/assets/analytics_icons/tuning.png": "fffe76cf2de6e9f7df6702cf0208f01a",
"assets/assets/analytics_icons/other.png": "0666805dea6596c9db21fd3f968805f1",
"assets/assets/analytics_icons/tires.png": "de334d06e29341f14e8109f995288f07",
"assets/assets/icons/search.svg": "ba150e049b84e4dcf10fa605dc35d2ab",
"assets/assets/icons/settings/terms_of_use.svg": "6940c4a95d7b3fa2dd002c5bc5ad6e24",
"assets/assets/icons/settings/user.svg": "f98b7c62ad52a4f3eb54ef23732e3ff5",
"assets/assets/icons/settings/library.svg": "89dafcc6b430621ce341a612e7c16afd",
"assets/assets/icons/settings/theme.svg": "03281f4eaa77e6bd0b9af2dbd3896df7",
"assets/assets/icons/settings/log_out.svg": "2057f539874fd2035280011db7aa67b7",
"assets/assets/icons/settings/report_problem.svg": "5db0bf12e017611c69da70efde6d9572",
"assets/assets/icons/settings/region.svg": "21e1408cea8d9be407083359706924ee",
"assets/assets/icons/settings/request_new_feature.svg": "184d5dee5401a8f6537f26b33342f2aa",
"assets/assets/icons/settings/language.svg": "62b6310509b54ed41695f40dd18ce3aa",
"assets/assets/icons/settings/delete.svg": "110989cdbca1b31a6e7ddfc0d22946ef",
"assets/assets/icons/settings/privacy_policy.svg": "0bfd8bfd0d211de8cf774b95038d668e",
"assets/assets/icons/settings/notifications.svg": "e6af0b9a294bf946efed90cd8cfc460e",
"assets/assets/icons/settings/password.svg": "c971b08a0b4c272857295bfb99a15ae4",
"assets/assets/icons/car_icon.svg": "bed6fa61d3c25fd6727cb30fe00eab4d",
"assets/assets/icons/arrow.svg": "5b26be9184e6a53bb7c6cd74ea9a0144",
"assets/assets/icons/chart_icon_fill.svg": "c0db2bafccee39a85000d6a704752817",
"assets/assets/icons/circle_no.svg": "7a57471605c8e5493996dc3e0af0132f",
"assets/assets/icons/github.svg": "1bb027109345a90a9eab1e929d8669c2",
"assets/assets/icons/profile_icon_fill.svg": "76d9b03506154ba3232dc58e53d675c5",
"assets/assets/icons/map.svg": "0ade818ecf5ea277d8f7177077458946",
"assets/assets/icons/home_icon.svg": "1c41e053e2947ef2e237acc7f127e965",
"assets/assets/icons/service.svg": "2a0c6da9817a982e90bb7774cb80498a",
"assets/assets/icons/bell_fill.svg": "3c56cc1efaf1e92d1a43560693a0fdf0",
"assets/assets/icons/website.svg": "b44ced265bc32dcf7d2626f15380b2b7",
"assets/assets/icons/home_icon_fill.svg": "e2dad5b1104053689d415a1dd99d9848",
"assets/assets/icons/profile_icon.svg": "4cb501e6ec169ed9a8896a5f80356c64",
"assets/assets/icons/car_icon_fill.svg": "4a25c6c4e749e85a7fccba62968104cb",
"assets/assets/icons/note.svg": "7ae41df7624fe39159aff8249f928a23",
"assets/assets/icons/chart_icon.svg": "6758e97febd1de2efc1ea8b154c9a8bc",
"assets/assets/icons/arrow.png": "772971ffaee7a9e59ebe4d95e3a69c9f",
"assets/assets/icons/bell.svg": "f6bc2fb5bd8ec6573f6b01692a1195fc",
"assets/assets/icons/save.svg": "f10de3e9c873b5429a1a0ee5bcd50c25",
"assets/assets/icons/circle_trash.svg": "d74d106a0f30b175e3352d3e7f5f66e2",
"assets/assets/icons/calendar.png": "167d84695e9be55b758cb02ec093f145",
"assets/assets/icons/tire_change.svg": "75fabcc756b2cf37b16dd72beced714c",
"assets/assets/icons/insurance.svg": "e73635e67a4ce2317ad364b6bf26bc3a",
"assets/assets/icons/circle_yes.svg": "161f1afa3fb8d56c61667ebc3213643e",
"assets/assets/icons/linkedin.svg": "5b238434e2862c877f08572b96c0ef7b",
"assets/assets/icons/calendar.svg": "91c09472c42edbacd494822195d3042e",
"assets/assets/icons/arrow_forward.svg": "4e251d52ef7f2bd355a75e7324300ace",
"assets/assets/icons/oil_change.svg": "6e2271f13ee67ca25f15a806c843aac1",
"assets/assets/qr_code.png": "8f1f071b36b5e0f1188f2b327bc4f4c5",
"assets/assets/notification.json": "873cd4c02f5c4af615eb896d7c88c9ca",
"assets/assets/cars/pickup.png": "883f56e0a937f5c39015298d0a3c81b8",
"assets/assets/cars/suv.png": "12ec1d5f39946df0df39be46e0cfd92d",
"assets/assets/cars/cabrio.png": "852edb9d88814b14e872a39fc381898d",
"assets/assets/cars/sedan.png": "60f989d1df87552b0aaf64b5a07bdd08",
"assets/assets/cars/bus.png": "f6e50038b9cfe78b086d8e788ebf20a7",
"assets/assets/cars/hatchback.png": "69344eeb5ab717803aa6ef8444858be3",
"assets/assets/cars/wagon.png": "9647c81b848f3be67ce5050727611b4a",
"assets/assets/car_logo-min.svg": "10f219578c99bf62a44160c01d247388",
"assets/assets/contact.json": "f8134c04d024c4e1461a9cc9a54465e6",
"assets/assets/car_logo-min.png": "ce03b788e43788eddf1a98b44698d83f",
"assets/assets/car_garage.json": "3a31f961b8a2cb8cf08b15c6a3de7055",
"assets/assets/app_google_play.png": "beed8637dff73f34bbdd89cc49106d2c",
"assets/assets/warning.json": "ca3d9b32c71687c828842962ed0dd549",
"assets/assets/GoogleLogo1.png": "0fdda01a66de57d8ad4bf0665a260eac",
"assets/assets/fonts/Montserrat-Medium.ttf": "bdb7ba651b7bdcda6ce527b3b6705334",
"assets/assets/fonts/Montserrat-Light.ttf": "94fbe93542f684134cad1d775947ca92",
"assets/assets/fonts/Montserrat-ExtraLight.ttf": "a7fe50578d9aa3966c925cb9722db03a",
"assets/assets/fonts/Montserrat-Thin.ttf": "b3638b16904211d1d24d04ce53810c4d",
"assets/assets/fonts/Montserrat-Bold.ttf": "ed86af2ed5bbaf879e9f2ec2e2eac929",
"assets/assets/fonts/Montserrat-SemiBold.ttf": "cc10461cb5e0a6f2621c7179f4d6de17",
"assets/assets/fonts/Montserrat-ExtraBold.ttf": "9e07cac927a9b4d955e2138bf6136d6a",
"assets/assets/fonts/Montserrat-Black.ttf": "cce7ff8c1d7999f907b6760fbe75d99d",
"assets/assets/fonts/Montserrat-Regular.ttf": "5e077c15f6e1d334dd4e9be62b28ac75",
"assets/assets/car_lottie.json": "342a6e6b940aa79ff7b15d023eba6b26",
"assets/assets/companies/bodyspace.png": "3345763fdb73b681da53d8c1e753f484",
"assets/assets/companies/appwise.png": "dc2517aeed4831746bab17f7c0b23b6b",
"assets/assets/companies/omega.png": "e6c8fff1c18a1016361ea460c73cb6d0",
"assets/assets/companies/speednet.png": "98c124a2832212860b4b7f9ab38de37c",
"assets/assets/companies/h2b.png": "6f09c7a504806adc93f2a77710d01cd5",
"assets/assets/companies/resql.png": "8b82a91e7784add8691599303ca951ca",
"assets/assets/companies/paidwork.png": "bb7e969f5f9d5544e424398ae4ecb8ed",
"assets/assets/test.svg": "803870932dc4d0fd07fb751150ffb91f",
"firebase_config.js": "d41d8cd98f00b204e9800998ecf8427e",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
