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
    var author = "Mark Stamer"
    var url = URL(string: "https://www.example.com")!

    var pageWidth = 12
    var builtInIconsEnabled = true

    var syntaxHighlighters = [SyntaxHighlighter.swift]
    var homePage = Home()
    var theme = MyTheme()

    var layouts: [any ContentPage] = [
        Article()
    ]
}


