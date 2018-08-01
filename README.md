# How to open social apps
How to open social apps like Facebook, Twitter and Instagram or redirect to Safari.

# Info.plist
You have to modify the Info.plist fie including the social networks you derire to link using the LSApplicationQueriesSchemes property. Simply open Info.plist as a Source Code, and paste this:

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

# App vs Web
The approach used here will verify if the native app can be opened directly in the desired profile. If it can't, the Safari browser will open with a web link instead.

```
@IBAction func openSocialFacebook(_ sender: Any) {
        
    let screenName =  "appdaagua"
    let pageID = "1549981958628014"; // App da Água Fanpage ID

    let appURL = URL(string: "fb://profile/" + pageID)!
    let webURL = URL(string: "https://www.facebook.com/\(screenName)")!

    openSocial(appURL: appURL, webURL: webURL);
}
```