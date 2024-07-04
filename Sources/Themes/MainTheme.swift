import Foundation
import Ignite

struct MainTheme: Theme {
    func render(page: Page, context: PublishingContext) -> HTML {
        HTML {
            Head(for: page, in: context)

            Body {
                NavigationBar(logo: Text("").font(.title1)) {
                    Link(Text("profile").font(.lead), target: "/")
                    Link(Text("work").font(.lead), target: "/#work")
                    Link(Text("exploration").font(.lead), target: "/#exploration")
                    Link(Text("articles").font(.lead), target: "/#articles")
                }
                .navigationItemAlignment(.trailing)
                .navigationBarStyle(.light)
                .position(.default)
                .frame(maxWidth: .containerWidth(.large))

                page.body

                Divider()
                    .frame(maxWidth: .containerWidth(.large))

                Footer()
            }
        }
    }
}
