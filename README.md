## About

This application is to demo cross origin issue we are facing in flutter web.

## Steps to reproduce

1. Go to lib/form_html.html file and run locally or host this HTML file. Copy the html link
2. Go to lib/web_view_screen.dart replace htmlUrl variable with new html link you just copied.
3. Run flutter app in web.
4. Click on continue button, in console you will see cross-origin issue.


## for release build

Run the following command to generate a release build:

```
flutter build web
```

## Demo link
https://www.loom.com/share/d525c840dde74dfbaf0873147349330d


This issue might resolved when we host both web app and html file in our server(finzmoney.com).