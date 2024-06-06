import Foundation
import Ignite

struct MyTheme: Theme {
    func render(page: Page, context: PublishingContext) -> HTML {
        HTML {
            Head(for: page, in: context)

            Body {
                NavigationBar(logo: Text("").font(.title1)) {
                    Link(Text("about").font(.lead), target: "/")
                    Link(Text("work").font(.lead), target: "#")
                    Link(Text("exploration").font(.lead), target: "#")
                    Link(Text("articles").font(.lead), target: "#")
                }
                .navigationItemAlignment(.trailing)
                .navigationBarStyle(.light)
                .background(.white.opacity(0.25))
                .position(.default)

                page.body

                IgniteFooter()
            }
//            .style("background-color: yellow")
        }
    }
}
