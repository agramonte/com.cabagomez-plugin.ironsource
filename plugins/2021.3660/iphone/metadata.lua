local metadata =
{
	plugin =
	{
		format = 'staticLibrary',
		staticLibs = {
			"bz2",
			"iconv",
			"c++","z",
			"sqlite3",
			"xml2",
			"c++abi",
			"resolv.9",
			'plugin_ironsource'
		},
		frameworks = { 
			'Ironsource', 
			-- Adcolony
			'AdColony',
			'ISAdColonyAdapter',
			-- Tapjoy
			'ISTapjoyAdapter',
			'Tapjoy',
			-- Vungle
			'ISVungleAdapter', 
			'VungleSDK',
			-- Facebook
			'FBSDKCoreKit_Basics',
			'FBAudienceNetwork',
			'ISFacebookAdapter',
			-- Admob
			'GoogleMobileAds',
			'GoogleUtilities',
			'GoogleAppMeasurement',
			'nanopb',
			'UserMessagingPlatform',
			'PromisesObjC',
			'ISAdMobAdapter',
			-- Applovin
			'AppLovinSDK',
			'ISAppLovinAdapter',
			-- Unity
			'ISUnityAdsAdapter',
			'UnityAds',
			-- Vungle
			'ISVungleAdapter',
			'VungleSDK',
			-- Other libraries
			"AdSupport",
			"AudioToolbox",
			"AVFoundation",
			"CFNetwork",
			"CoreGraphics",
			"CoreLocation",
			"CoreMedia",
			"CoreTelephony",
			"CoreVideo",
			"Foundation",
			"MobileCoreServices",
			"QuartzCore",
			"Security",
			"StoreKit",
			"SystemConfiguration"
		},
	},
}



return metadata
