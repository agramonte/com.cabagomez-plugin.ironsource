# com.cabagomez-plugin.ironsource
Solar2d Ironsource Plugin.

-- Tappx banner and interstitial are supported. If you use it and have not registered please use my affiliate link:
https://dashboard.tappx.com/?h=a386595d4c1005fd21b82c8a44d45766.  

-- If you find an issue please submit an issue on this repo. If I am able to reproduce it and impacts me, I will try to resolve it. If you need more support than this or want to individually ad plugins, I would recommend the ironsource plugin by Scott Harrison: https://solar2dmarketplace.com/plugins?IronSource_tech-scotth


1. Add the plugin.
```
    ["plugin.ironsource"] = 
        {
            publisherId = "com.cabagomez"
        },
```   
2. Plugin supports Android 16 and above. Add to your build settings file:
```
minSdkVersion = "16",
```
3. Refrence the plugin:
```
local ironsource = require("plugin.ironsource")
```

4. Init. 
```
ironsource.init(
    adListerner, -- Listerner. Required.
        {
            key=<replace with your key>, -- Your ironsource app key. Required.
            showDebugLog=false, -- Optional debug param. Defaults to false. Show extended logs.
            coppaUnderAge=false, -- Optional. Defaults to false.
            gdprUnderAge=false, -- Optional. Defaults to false.
            showValidateIntegrationUI=false, -- Optional. Shows integration validation UI. Defaults to false.
            userId="xsdsfsd", -- Optional. UserId. If not provided ironsource will autogenerate one.
            hasUserConsent=false, -- Optional. Targeted ads. Defaults to false.
            ccpaDoNotSell=false, -- Optional. False = Sell the data. True = do not sell. Default is false.
            isAutoLoad = true, -- Optional. True = Banner and Interstitial will autoload. Default is true.
            consentView = false -- Optional. True = send consent view events. iOS only. Default is false.
        } -- Table with options.
    )
```

5. Show.
```
    ironsource.show("<adtype>", -- Ad type. Valid values are: "interstitial", "rewardedVideo", "banner", "offerWall","consentView"
        {
            y=<bannerPosition>, -- Optional. Valid for banner. Valid values are "top" and "bottom". Defaults to "bottom".
            placementName=<placement name> -- Optional. Valid for "rewardedVideo", "offerwall", "interstitial".
        } -- Optional table.
    )
```

6. Is Available.
```
    ironsource.isAvailable("<adtype>",
        {
            placementName=<placement name> -- Optional. Valid for "rewardedVideo", "interstitial", "banner".
        } -- Optional table.
    
    )
```  
7. Hide.
```
    ironsource.hide() -- Only functions for banner.
```

8. Load.
```
   ironsource.load( "<adType>" ) -- Ad type. Valid values are: "interstitial", "banner", "consentView"ß.
   -- Ironsource autoloads rewarded ads and the offerwall.
```

9. Set custom properties.   
```
ironsource.setCustomProperty(
    "<keyName>", 
    "<keyValue>"
)
```  
10. If using:   
AdColony add these schemes (iOS only):   
```
    LSApplicationQueriesSchemes = 
    {   
            "fb",
            "instagram",
            "tumblr",
            "twitter"
    }
```     
11. Logs example:

loaded ("interstitial", "banner")
```
ironsource:	{
    "data":"",
    "name":"ironsource",
    "phase":"loaded",
    "provider":"ironsource",
    "response":"", -- If error. The error reason would be here.
    "type":"<adType>",
    "isError":false -- Always true for show and offerwalls.
}
```

show ("offerwall"-on error, "rewardedVideo"-on error, "interstitial")
```
ironsource:	{
    "data":"",
    "name":"ironsource",
    "phase":"show",
    "provider":"ironsource",
    "response":"", -- If error. The error reason would be here. Always populated for rewarded and offerwall.
    "type":"<adType>",
    "isError":false -- Always true for rewarded and offerwall.
}
```

available ("rewardedVideo", "offerWall")
```
ironsource:	{
    "data":"",
    "name":"ironsource",
    "phase":"available",
    "provider":"ironsource",
    "response":"<isAvailable>", -- true it is currently available and loaded. If the ad expires you will get a similar event but false.
    "type":"<adType>",
    "isError":false -- Would be true if it couldn't load.
}
```

reward ( "offerWall", "rewardedVideo )
```
ironsource:	{
    "data":"",
    "name":"ironsource",
    "phase":"reward",
    "provider":"ironsource",
    "response":"<>", -- error string if isError = true or awarded credit as string. Only populated for offerwall.
    "type":"<adtype>",
    "isError":false -- No error available for rewardedVideo.
}
```

opened      ("rewardedVideo", "interstitial", "offerWall")

closed      ("rewardedVideo", "interstitial", "offerWall")

started     ("rewardedVideo" ) 

ended       ("rewardedVideo" )

presented   ("banner")

dismissed   ("banner")

adLeftApp   ("banner")

```
ironsource:	{
    "data":"",
    "name":"ironsource",
    "phase":"opened",
    "provider":"ironsource",
    "response":"", -- Never filled for these phases.
    "type":"rewardedVideo", 
    "isError":false -- Always false for these phases.
}
```


clicked ("rewardedVideo", "interstitial", "banner")
```
ironsource:	{
    "data":"",
    "name":"ironsource",
    "phase":"clicked",
    "provider":"ironsource",
    "response":"<placementname>", -- Placement name. Rewarded only.
    "type":"<adType>",
    "isError":false
}
```  

segmentReceived -- Segment being used by this particular user     
```
ironsource:	{
      "data":"",
      "name":"ironsource",
      "phase":"segmentReceived",
      "provider":"ironsource",
      "response":"<segmentName>",
      "type":"segment",
      "isError":false
    }   
```   

Current versions for android
--------------- AdColony --------------  
Adapter 4.3.12   
--------------- Applovin --------------    
Adapter 4.3.32    
SDK Version - 11.4.2   
--------------- Google (AdMob and Ad Manager) --------------   
Adapter 4.3.28    
SDK Version - 20.6.0      
--------------- IronSource --------------   
Adapter 7.2.3.1  
SDK Version - 5.116  
--------------- Meta --------------   
Adapter 4.3.36   
SDK Version - 6.11.0     
--------------- Tapjoy --------------    
Adapter 4.1.20    
SDK Version - 12.9.1   
--------------- Unity --------------    
Adapter 4.3.21     
--------------- Vungle --------------   
Adapter 4.3.17   
SDK Version - 6.11.0   
--------------- Tappx --------------    
Adapter 3.2.4   

Current versions for Amazon   
--------------- AdColony --------------  
Adapter 4.3.12   
--------------- Chartboost --------------    
Adapter 4.3.8    
SDK Version - 8.3.1  
--------------- Google (AdMob and Ad Manager) --------------   
Adapter 4.3.28    
SDK Version - 20.6.0    
--------------- InMobi --------------   
Adapter 4.3.14   
SDK Version - 10.0.5    
--------------- IronSource --------------   
Adapter 7.2.3.1  
SDK Version - 5.116  
--------------- Meta --------------   
Adapter 4.3.36   
SDK Version - 6.11.0   
--------------- Pangle --------------    
Adapter 4.3.14       
SDK Version - 4.5.0.4     
--------------- Tapjoy --------------    
Adapter 4.1.20    
SDK Version - 12.9.1     
--------------- Vungle --------------   
Adapter 4.3.17   
SDK Version - 6.11.0   
--------------- Tappx --------------    
Adapter 3.2.4   

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

