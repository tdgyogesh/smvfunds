'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"index.html": "1de7575715a43e307f75745ca702a3ba",
"/": "1de7575715a43e307f75745ca702a3ba",
"version.json": "b9f8577d4095ce2f8cd513ed73dee80f",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/AssetManifest.bin": "51ba8f94f78732a41d581785586a0c5a",
"assets/FontManifest.json": "d09f75764894afd2c97145a632f4809b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/fonts/Kollektif.ttf": "4d49be6e42d18464b230d87d1fab175a",
"assets/fonts/Roboto-Medium.ttf": "68ea4734cf86bd544650aee05137d7bb",
"assets/fonts/Roboto-Bold.ttf": "b8e42971dec8d49207a8c8e2b919a6ac",
"assets/fonts/Roboto-Regular.ttf": "8a36205bd9b83e03af0591a004bc97f4",
"assets/fonts/RomandeADFStyleStd-Regular.ttf": "63d31af6df346e01af4ba7bf99b679a7",
"assets/fonts/MaterialIcons-Regular.otf": "0c3ed843793ad348067c50f851da999d",
"assets/assets/editor.html": "300d5a6364eb85034a12435096728fc5",
"assets/assets/SMVRegisterButton.png": "0aceed4b4ecfd7abfe1598eb2407927c",
"assets/assets/TeamFacebook.png": "ed41841846b374d992613fbbf41d1056",
"assets/assets/TeamBlog.png": "5ffef206af12cf601d9e5b5a943109e4",
"assets/assets/SMVInvestmentIdea.png": "415bc60a529bc61725e8228656b63f6c",
"assets/assets/view.html": "e7a60312faafa5ac670321a8f530b080",
"assets/assets/SMVLogoTitle.png": "9e3e02d9196686e500340e0886d57923",
"assets/assets/LinkedIn.png": "09b363e768e1b751796f848455a046de",
"assets/assets/Jason%2520LaMacchia.png": "6887607853b633e4ad159fa6fda99eba",
"assets/assets/SMVLoginButton.png": "27536138d4050f5564d72699a0c79f4a",
"assets/assets/SMVDiversify.png": "f4b7e1641561f38d691797fd62a59cc2",
"assets/assets/SMV_Logo.png": "7b23517ad39851adb603e516db791b6a",
"assets/assets/Fb.png": "4a3e13adbf39743334560bb576e2e526",
"assets/assets/Insta.png": "a658bf1e0b9b86a47f3a3caa4747d27f",
"assets/assets/SMVAssetImage.png": "2cf38cc0ad35fc8982b5b638bbab3000",
"assets/assets/Bryson%2520Keeton.jpg": "b2c6d12b917702a0b32e9d80d5e6341d",
"assets/assets/SMVStartInvestment.png": "ce0945c591468765c7b922e2fc97f279",
"assets/assets/Selvan%2520Rajan.png": "01dbe4449713dc5734c3aaebef0852ad",
"assets/assets/Ola%2520Johnson.png": "2ff06d93c432261927a61b8e1f64b368",
"assets/assets/Susan%2520Berman.png": "dd6660b7eb6bf94c56eb363cb88becd2",
"assets/assets/editorBlog.html": "45328f0d44c9af8bfc4f93016e6d3533",
"assets/assets/SMVPortalStartUp.png": "2bac5de38302b0333f88e6facfbc0020",
"assets/assets/TeamLinkedIn.png": "bf3370e0e8eae7da92a18a5d0b289755",
"assets/assets/Angelo%2520Noronha.png": "2e4ab1d96db1c1573e0683be0c36996b",
"assets/assets/Leticia-Garcia.png": "632ee3fa21c803c14ea27b742faed509",
"assets/assets/Twitter.png": "6ad541d544d852e4a56c0fee08f825ef",
"assets/assets/Youtube-1.png": "a6dca3be0a4f0e0411def610c6ef8b8d",
"assets/assets/Blessing.jpg": "8556fcb46a707ac16b8156b2369c7c23",
"assets/assets/SMVBackground.png": "278041533f8170232ac8b1406ac2d8ab",
"assets/assets/SMVInvestmentGrowth.png": "fc95b8ff126dc5fb608c34014904c547",
"assets/assets/DefaultCover.png": "056c12119b6fe21d931e5e12ebb0be8d",
"assets/assets/Royston%2520King.jpg": "f6f30a96baac504d1038adf4dd7c6c92",
"assets/assets/Clare%2520Hammond.png": "c99f18c45577842de243febca93ac332",
"assets/assets/SMVLandingImage.png": "e50fd17975eac972e39be515d010be1b",
"assets/assets/Venkat%2520Alagarsamy.jpg": "f4453dc28c050c8ddccd38c63cc6e3f5",
"assets/assets/Paul%2520Vezolles.png": "873a3889b08af24ee94a0d69ca1f7fb8",
"assets/assets/TeamTwitter.png": "89dad8ab2951926371ed26c3d223119e",
"assets/assets/Varsha.png": "e477bef9a6a0183865851a05475c5f63",
"assets/assets/Manan_rawal.png": "9bd3ba85f48c406b5afee9d03e9fbb0b",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/NOTICES": "df1919eb3c34f1922d30a1169539d87e",
"assets/AssetManifest.json": "a6dedded9fa8e914a464db4daa97d6f3",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/canvaskit.wasm": "42df12e09ecc0d5a4a34a69d7ee44314",
"canvaskit/chromium/canvaskit.wasm": "be0e3b33510f5b7b0cc76cc4d3e50048",
"canvaskit/chromium/canvaskit.js": "96ae916cd2d1b7320fff853ee22aebb0",
"canvaskit/skwasm.wasm": "1a074e8452fe5e0d02b112e22cdcf455",
"canvaskit/canvaskit.js": "bbf39143dfd758d8d847453b120c8ebb",
"manifest.json": "cf60b51c240b17a273a2d40686315b6a",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"main.dart.js": "07cc10b66c2018f5a7c65ebdb0e468bd"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
