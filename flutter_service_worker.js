'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "f87b48c0b516d3c31cb44dadfc26ac9a",
"assets/AssetManifest.bin.json": "d067815308b20fc43ffb978e5af2b0de",
"assets/AssetManifest.json": "dc22e3c580c5f17df4a63034ffcab904",
"assets/assets/images/0.75x/logo_long_dark.png": "59fdbcd6d602f6335ea36de07244307b",
"assets/assets/images/0.75x/logo_long_light.png": "ea51b9c01ef975d3e34744132c92dadc",
"assets/assets/images/0.75x/logo_short_dark.png": "656cdc7beeb2de512460fa4435eb97ab",
"assets/assets/images/0.75x/logo_short_light.png": "039987bc10955dec555b20ce9288e8ad",
"assets/assets/images/1.5x/logo_long_dark.png": "cece7c78b06098aed1bd3fb5aa361175",
"assets/assets/images/1.5x/logo_long_light.png": "bee294b6180278dc34c71407cee135c2",
"assets/assets/images/1.5x/logo_short_dark.png": "607dd93f3204fb62e51140cf115dc853",
"assets/assets/images/1.5x/logo_short_light.png": "6485499559cc2e30f26332685feb4027",
"assets/assets/images/1x/logo_long_dark.png": "750e7a2b119be64c7d749161ead9f91f",
"assets/assets/images/1x/logo_long_light.png": "e7966e5750a650ca6d70b6f152658378",
"assets/assets/images/1x/logo_short_dark.png": "bf665ed7353c845414f17339c1bcd724",
"assets/assets/images/1x/logo_short_light.png": "be855533ce435d807ec5df75d6e90930",
"assets/assets/images/2x/logo_long_dark.png": "8bb149c9db23fa08595872a3c7343e27",
"assets/assets/images/2x/logo_long_light.png": "f7add591752043435c6474404c85d842",
"assets/assets/images/2x/logo_short_dark.png": "8f45268f804f294aebeb5fd5d13025d9",
"assets/assets/images/2x/logo_short_light.png": "a7856569d764e86d2362ad962b130844",
"assets/assets/images/3x/logo_long_dark.png": "9eed5c5632f60606722fb58a2b53924c",
"assets/assets/images/3x/logo_long_light.png": "86007a0c454b3f123f5055a90b2d52f9",
"assets/assets/images/3x/logo_short_dark.png": "f37cba8373da1980fe5c6144d0a79966",
"assets/assets/images/3x/logo_short_light.png": "624b768ee521a6957e3ef8e1c7695b2a",
"assets/assets/images/4x/logo_long_dark.png": "690a31d45ee5527e19fc70a2859ad2b6",
"assets/assets/images/4x/logo_long_light.png": "db0003deeaaa3f873b48a9b68b8bb039",
"assets/assets/images/4x/logo_short_dark.png": "982e3d5ee785804d1ec3c5c8cd2b56e4",
"assets/assets/images/4x/logo_short_light.png": "6239db401967774d43a7723f5b60dd6e",
"assets/assets/images/logo_long_dark.png": "750e7a2b119be64c7d749161ead9f91f",
"assets/assets/images/logo_long_light.png": "e7966e5750a650ca6d70b6f152658378",
"assets/assets/images/logo_short_dark.png": "bf665ed7353c845414f17339c1bcd724",
"assets/assets/images/logo_short_light.png": "be855533ce435d807ec5df75d6e90930",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/fonts/MaterialIcons-Regular.otf": "a3e0d65b41683d1cbd31b11af652e9c3",
"assets/NOTICES": "ddbf093452ad0cbdbb407cf297fc4575",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"flutter_bootstrap.js": "599c4d2c5f93c22deacb7e1774e268b1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "22da35dff107f0591e51013f4a0d6252",
"/": "22da35dff107f0591e51013f4a0d6252",
"main.dart.js": "3c4ff4fdd12c1469bc151c19315b0104",
"manifest.json": "9a96c482bd3b59b6c0822ca9c40f7b40",
"splash/img/dark-1x.png": "c2f770d24de6667eb09e277a12d367d0",
"splash/img/dark-2x.png": "56fa627c7aba81cf2f67cc764c6a27c9",
"splash/img/dark-3x.png": "ea21ee1a86f3e883a0ade06c403ce779",
"splash/img/dark-4x.png": "2839441e58e2e01b286b6845662221f4",
"splash/img/light-1x.png": "c8a9527bd4ec43abd587a3cb2c8775fa",
"splash/img/light-2x.png": "7c17a6634b70353012b312ba5a5156e0",
"splash/img/light-3x.png": "b8756caa497adda913efcea3e755e0e7",
"splash/img/light-4x.png": "04e204dcdf68c2085e153ab4c5fa0ece",
"splash/splash.js": "d6c41ac4d1fdd6c1bbe210f325a84ad4",
"splash/style.css": "b7459dbd909b2480ca0b855561fb49a0",
"version.json": "1457b17a13bd582c72d57eb093a095a6"};
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
