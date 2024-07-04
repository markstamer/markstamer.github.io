import Ignite

extension Card {
    static func badgeCard(title: String, badges: [String], role: Role) -> Card {
        Card {
            Text(title)
                .font(.title5)
                .fontWeight(.regular)
            Text {
                for badge in badges {
                    Badge(badge)
                        .badgeStyle(.subtleBordered).role(role)
                        .margin([.top, .trailing], .small)
                }
            }
            .font(.lead)
        }
        .background(.white.opacity(0))
        .style("border: none")
    }
}

