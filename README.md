# Volcar

Volcar is a Swift library for implementing server driven ui in SwiftUI. This package makes it easier to quickly make interactive application. You can use this for example when you're making a prototype of an iOS app.

## Installation

First you need a default SwiftUI Application including scenedelegate. Following that, you can start by implementing the package in your new XCode project. To add a package dependency to your Xcode project, select File > Swift Packages > Add Package Dependency and enter ```https://github.com/NordyVlasman/Volcar.git```

When you're done implementing the package, you can start by defining the Volcar application in the MainApp and implement it in the main Content View. The main file should look like this.

```swift
import SwiftUI
import Volcar

@main
struct VolcarApp: App {
    let uiManager: Volcar = Volcar(dataURL: URL(string: "http://localhost:4000/application")!)
    
    var body: some Scene {
        WindowGroup {
            ContentView(manager: uiManager)
        }
    }
}
```

after that, you can get an error saying, ```Argument passed to call that takes no arguments```. This message is due to not making a variable in the ContentView. That's the next thing you have to do. Because the uiComponents can differ from time, your variable has to be changable. To do that, you can make the variable Observed. It wil eventually looks like this.
```swift
@ObservedObject var manager: Volcar
```

Now all the errors should disappear (except for the preview. But you can't use the preview so its better to remove it.). Now you're ready to start implementing the uiComponents in your view. The idea behind this is that the manager gets all the components from the given url and append a Published var with the codable views. After that it displays all those components using the RenderPage function. It should look like this.

```swift
var body: some View {
    renderPage(ui: manager.uiComponents, uiDelegate: self)
        .onAppear {
            manager.fetchData { screen in
                manager.loadScreen(screen: screen)
            }
        }
}
```

Now you're ready to start the app and experiment with the package 🚀.

## JSON Preview
The package converts JSON to CodableViews, to do this, there has to be some kind of JSON it can load and convert. A good example of the JSON Strcuture is something like this.
```json
{
	"screens": [
		{
			"id": "home",
			"title": "Home",
			"type": "table",
			"rows": [
				{
					"title": "First row",
					"actionType": "alert",
					"action": {
						"title": "This is the first row",
						"message": "Oh yes it is!"
					}
				}
			]
		},
    ]
}
```