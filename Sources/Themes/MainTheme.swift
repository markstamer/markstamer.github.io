import Foundation
import Ignite

struct MyTheme: Theme {
    func render(page: Page, context: PublishingContext) -> HTML {
        HTML {
            Head(for: page, in: context)

            Body {
                NavigationBar(logo: Text("").font(.title1)) {
                    Link("about", target: "/")
                    Link("work", target: "#")
                    Link("exploration", target: "#")
                    Link("articles", target: "#")
                }
                .width(10)
                .navigationItemAlignment(.trailing)
                .navigationBarStyle(.light)
                .background(.white.opacity(0.25))
                .shadow(radius: 1)
                .position(.default)

                page.body
                    .backgroundImage(
                        "/images/Swift_logo_white.svg",
                        size: .fill,
                        position: .bottom // .topLeft(.percent(100), nil),
                    )

                IgniteFooter()
            }
//            .style("background-color: yellow")
        }
    }
}
