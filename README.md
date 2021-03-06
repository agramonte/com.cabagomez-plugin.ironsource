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
   ironsource.load( "<adType>" ) -- Ad type. Valid values are: "interstitial", "banner", "consentView"??.
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

12. Please add these values to your build settings or your own values. These values come directly from Ironsource tool use at your own risk.
```
SKAdNetworkItems = {  
                { SKAdNetworkIdentifier = "su67r6k2v3.skadnetwork" },
                { SKAdNetworkIdentifier = "f7s53z58qe.skadnetwork" },
                { SKAdNetworkIdentifier = "2u9pt9hc89.skadnetwork" },
                { SKAdNetworkIdentifier = "hs6bdukanm.skadnetwork" },
                { SKAdNetworkIdentifier = "8s468mfl3y.skadnetwork" },
                { SKAdNetworkIdentifier = "c6k4g5qg8m.skadnetwork" },
                { SKAdNetworkIdentifier = "v72qych5uu.skadnetwork" },
                { SKAdNetworkIdentifier = "44jx6755aq.skadnetwork" },
                { SKAdNetworkIdentifier = "prcb7njmu6.skadnetwork" },
                { SKAdNetworkIdentifier = "m8dbw4sv7c.skadnetwork" },
                { SKAdNetworkIdentifier = "3rd42ekr43.skadnetwork" },
                { SKAdNetworkIdentifier = "4fzdc2evr5.skadnetwork" },
                { SKAdNetworkIdentifier = "t38b2kh725.skadnetwork" },
                { SKAdNetworkIdentifier = "f38h382jlk.skadnetwork" },
                { SKAdNetworkIdentifier = "424m5254lk.skadnetwork" },
                { SKAdNetworkIdentifier = "ppxm28t8ap.skadnetwork" },
                { SKAdNetworkIdentifier = "av6w8kgt66.skadnetwork" },
                { SKAdNetworkIdentifier = "cp8zw746q7.skadnetwork" },
                { SKAdNetworkIdentifier = "4468km3ulz.skadnetwork" },
                { SKAdNetworkIdentifier = "e5fvkxwrpn.skadnetwork" },
                { SKAdNetworkIdentifier = "4pfyvq9l8r.skadnetwork" },
                { SKAdNetworkIdentifier = "yclnxrl5pm.skadnetwork" },
                { SKAdNetworkIdentifier = "tl55sbb4fm.skadnetwork" },
                { SKAdNetworkIdentifier = "mlmmfzh3r3.skadnetwork" },
                { SKAdNetworkIdentifier = "klf5c3l5u5.skadnetwork" },
                { SKAdNetworkIdentifier = "9t245vhmpl.skadnetwork" },
                { SKAdNetworkIdentifier = "9rd848q2bz.skadnetwork" },
                { SKAdNetworkIdentifier = "7ug5zh24hu.skadnetwork" },
                { SKAdNetworkIdentifier = "7rz58n8ntl.skadnetwork" },
                { SKAdNetworkIdentifier = "ejvt5qm6ak.skadnetwork" },
                { SKAdNetworkIdentifier = "5lm9lj6jb7.skadnetwork" },
                { SKAdNetworkIdentifier = "mtkv5xtk9e.skadnetwork" },
                { SKAdNetworkIdentifier = "6g9af3uyq4.skadnetwork" },
                { SKAdNetworkIdentifier = "uw77j35x4d.skadnetwork" },
                { SKAdNetworkIdentifier = "u679fj5vs4.skadnetwork" },
                { SKAdNetworkIdentifier = "rx5hdcabgc.skadnetwork" },
                { SKAdNetworkIdentifier = "g28c52eehv.skadnetwork" },
                { SKAdNetworkIdentifier = "cg4yq2srnc.skadnetwork" },
                { SKAdNetworkIdentifier = "9nlqeag3gk.skadnetwork" },
                { SKAdNetworkIdentifier = "275upjj5gd.skadnetwork" },
                { SKAdNetworkIdentifier = "wg4vff78zm.skadnetwork" },
                { SKAdNetworkIdentifier = "qqp299437r.skadnetwork" },
                { SKAdNetworkIdentifier = "2fnua5tdw4.skadnetwork" },
                { SKAdNetworkIdentifier = "3qcr597p9d.skadnetwork" },
                { SKAdNetworkIdentifier = "3qy4746246.skadnetwork" },
                { SKAdNetworkIdentifier = "3sh42y64q3.skadnetwork" },
                { SKAdNetworkIdentifier = "5a6flpkh64.skadnetwork" },
                { SKAdNetworkIdentifier = "cstr6suwn9.skadnetwork" },
                { SKAdNetworkIdentifier = "kbd757ywx3.skadnetwork" },
                { SKAdNetworkIdentifier = "n6fk4nfna4.skadnetwork" },
                { SKAdNetworkIdentifier = "p78axxw29g.skadnetwork" },
                { SKAdNetworkIdentifier = "s39g8k73mm.skadnetwork" },
                { SKAdNetworkIdentifier = "wzmmz9fp6w.skadnetwork" },
                { SKAdNetworkIdentifier = "ydx93a7ass.skadnetwork" },
                { SKAdNetworkIdentifier = "zq492l623r.skadnetwork" },
                { SKAdNetworkIdentifier = "24t9a8vw3c.skadnetwork" },
                { SKAdNetworkIdentifier = "32z4fx6l9h.skadnetwork" },
                { SKAdNetworkIdentifier = "523jb4fst2.skadnetwork" },
                { SKAdNetworkIdentifier = "54nzkqm89y.skadnetwork" },
                { SKAdNetworkIdentifier = "578prtvx9j.skadnetwork" },
                { SKAdNetworkIdentifier = "5l3tpt7t6e.skadnetwork" },
                { SKAdNetworkIdentifier = "6xzpu9s2p8.skadnetwork" },
                { SKAdNetworkIdentifier = "79pbpufp6p.skadnetwork" },
                { SKAdNetworkIdentifier = "9b89h5y424.skadnetwork" },
                { SKAdNetworkIdentifier = "cj5566h2ga.skadnetwork" },
                { SKAdNetworkIdentifier = "feyaarzu9v.skadnetwork" },
                { SKAdNetworkIdentifier = "ggvn48r87g.skadnetwork" },
                { SKAdNetworkIdentifier = "glqzh8vgby.skadnetwork" },
                { SKAdNetworkIdentifier = "gta9lk7p23.skadnetwork" },
                { SKAdNetworkIdentifier = "k674qkevps.skadnetwork" },
                { SKAdNetworkIdentifier = "ludvb6z3bs.skadnetwork" },
                { SKAdNetworkIdentifier = "n9x2a789qt.skadnetwork" },
                { SKAdNetworkIdentifier = "pwa73g5rt2.skadnetwork" },
                { SKAdNetworkIdentifier = "xy9t38ct57.skadnetwork" },
                { SKAdNetworkIdentifier = "zmvfpc5aq8.skadnetwork" },
                { SKAdNetworkIdentifier = "22mmun2rn5.skadnetwork" },
                { SKAdNetworkIdentifier = "294l99pt4k.skadnetwork" },
                { SKAdNetworkIdentifier = "44n7hlldy6.skadnetwork" },
                { SKAdNetworkIdentifier = "4dzt52r2t5.skadnetwork" },
                { SKAdNetworkIdentifier = "4w7y6s5ca2.skadnetwork" },
                { SKAdNetworkIdentifier = "5tjdwbrq8w.skadnetwork" },
                { SKAdNetworkIdentifier = "6964rsfnh4.skadnetwork" },
                { SKAdNetworkIdentifier = "6p4ks3rnbw.skadnetwork" },
                { SKAdNetworkIdentifier = "737z793b9f.skadnetwork" },
                { SKAdNetworkIdentifier = "74b6s63p6l.skadnetwork" },
                { SKAdNetworkIdentifier = "84993kbrcf.skadnetwork" },
                { SKAdNetworkIdentifier = "97r2b46745.skadnetwork" },
                { SKAdNetworkIdentifier = "a7xqa6mtl2.skadnetwork" },
                { SKAdNetworkIdentifier = "b9bk5wbcq9.skadnetwork" },
                { SKAdNetworkIdentifier = "bxvub5ada5.skadnetwork" },
                { SKAdNetworkIdentifier = "dzg6xy7pwj.skadnetwork" },
                { SKAdNetworkIdentifier = "f73kdq92p3.skadnetwork" },
                { SKAdNetworkIdentifier = "g2y4y55b64.skadnetwork" },
                { SKAdNetworkIdentifier = "hdw39hrw9y.skadnetwork" },
                { SKAdNetworkIdentifier = "kbmxgpxpgc.skadnetwork" },
                { SKAdNetworkIdentifier = "lr83yxwka7.skadnetwork" },
                { SKAdNetworkIdentifier = "mls7yz5dvl.skadnetwork" },
                { SKAdNetworkIdentifier = "mp6xlyr22a.skadnetwork" },
                { SKAdNetworkIdentifier = "pwdxu55a5a.skadnetwork" },
                { SKAdNetworkIdentifier = "r45fhb6rf7.skadnetwork" },
                { SKAdNetworkIdentifier = "rvh3l7un93.skadnetwork" },
                { SKAdNetworkIdentifier = "s69wq72ugq.skadnetwork" },
                { SKAdNetworkIdentifier = "w9q455wk68.skadnetwork" },
                { SKAdNetworkIdentifier = "x44k69ngh6.skadnetwork" },
                { SKAdNetworkIdentifier = "x8uqf25wch.skadnetwork" },
                { SKAdNetworkIdentifier = "y45688jllp.skadnetwork" },
                { SKAdNetworkIdentifier = "v9wttpbfk9.skadnetwork" },
                { SKAdNetworkIdentifier = "n38lu8286q.skadnetwork" },
                { SKAdNetworkIdentifier = "238da6jt44.skadnetwork" },
                { SKAdNetworkIdentifier = "252b5q8x7y.skadnetwork" },
                { SKAdNetworkIdentifier = "488r3q3dtq.skadnetwork" },
                { SKAdNetworkIdentifier = "52fl2v3hgk.skadnetwork" },
                { SKAdNetworkIdentifier = "9yg77x724h.skadnetwork" },
                { SKAdNetworkIdentifier = "ecpz2srf59.skadnetwork" },
                { SKAdNetworkIdentifier = "gvmwg8q7h5.skadnetwork" },
                { SKAdNetworkIdentifier = "n66cz3y3bx.skadnetwork" },
                { SKAdNetworkIdentifier = "nzq8sh4pbs.skadnetwork" },
                { SKAdNetworkIdentifier = "pu4na253f3.skadnetwork" },
                { SKAdNetworkIdentifier = "v79kvwwj4g.skadnetwork" },
                { SKAdNetworkIdentifier = "yrqqpx2mcb.skadnetwork" },
                { SKAdNetworkIdentifier = "z4gj7hsk7h.skadnetwork" },
                { SKAdNetworkIdentifier = "7953jerfzd.skadnetwork" }
            },
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

Current version for iOS
--------------- AdColony --------------   
SDK - Version 4.8.0.0   
Adapter - Version 4.3.13   
--------------- AppLovin --------------
SDK - Version 11.4.3   
Adapter - Version 4.3.33   
--------------- Google (AdMob and Ad Manager) --------------   
SDK - Version afma-sdk-i-v9.7.0   
Adapter - Version 4.3.33   
--------------- IronSource --------------   
SDK - Version 5.103  
Adapter - Version 7.2.3.1   
--------------- Meta --------------   
SDK - Version 6.11.1   
Adapter - Version 4.3.36   
--------------- Tapjoy --------------   
SDK - Version 12.9.1   
Adapter - Version 4.1.19   
--------------- UnityAds --------------   
SDK - Version 4.2.1   
Adapter - Version 4.3.22   
--------------- Vungle --------------   
SDK - Version 6.11.0   
Adapter - Version 4.3.20  

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

