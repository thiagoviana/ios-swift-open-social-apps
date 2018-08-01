# How to open social apps
How to open social apps like Facebook, Twitter and Instagram or redirect to Safari.

# Info.plist
You have to modify the Info.plist file including the social networks you desire to link using the **LSApplicationQueriesSchemes** property. Simply open Info.plist as a Source Code, and paste this:

```
<key>LSApplicationQueriesSchemes</key>
  <array>
    <string>fb</string>
    <string>twitter</string>
    <string>instagram</string>
    <string>linkedin</string>
  </array>
```
You can also do it using the visual view of Xcode.

# App vs. Web
The approach used here will verify if the native app can be opened directly in the desired profile. If it can't, the Safari browser will open it with a web link instead.

The **openSocialFacebook** method is called when the button is pressed. It sets both, appURL and webURL before call the **openSocial** method.

```
@IBAction func openSocialFacebook(_ sender: Any) {
        
    let screenName =  "appdaagua"
    let pageID = "1549981958628014"; // App da Água Fanpage ID

    let appURL = URL(string: "fb://profile/" + pageID)!
    let webURL = URL(string: "https://www.facebook.com/\(screenName)")!

    openSocial(appURL: appURL, webURL: webURL);
}
```

The **openSocial** method receives the parameters (appURL and webURL), tests, and do all the job!

```
func openSocial(appURL: URL, webURL: URL) {
        
    // app installed : open
    if UIApplication.shared.canOpenURL(appURL as URL) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(appURL as URL, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(appURL as URL)
        }
    } else {
        // app not found : redirect to safari
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(webURL as URL, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(webURL as URL)
        }
    }
}
```