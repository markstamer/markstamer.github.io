import Foundation
import Ignite

@main
struct IgniteWebsite {
    static func main() async {
        let site = ExampleSite()

        do {
            try await site.publish()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct ExampleSite: Site {    
    var name = "Mark Stamer"
    var baseTitle = ""
    var url = URL(string: "https://www.example.com")!
    var builtInIconsEnabled = true
    var pageWidth = 12

    var author = "Mark Stamer"

    var homePage = Home()
    var theme = MyTheme()
}


