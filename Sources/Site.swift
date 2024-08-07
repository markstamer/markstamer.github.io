import Foundation
import Ignite

@main
struct IgniteWebsite {
    static func main() async {
        let site = PortfolioSite()

        do {
            try await site.publish()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct PortfolioSite: Site {
    var name = "Mark Stamer's Developer Profile"
    var baseTitle = ""
    var author = "Mark Stamer"
    var url = URL(string: "https://markstamer.github.io")!
    var favicon = URL(string: "images/favicon-32x32.png")

    var pageWidth = 12
    var builtInIconsEnabled = true

    var syntaxHighlighters = [SyntaxHighlighter.swift]
    var homePage = Home()
    var theme = MainTheme()

    var layouts: [any ContentPage] = [
        Article()
    ]

    var pages: [any StaticPage] = [
        Imprint()
    ]
}


