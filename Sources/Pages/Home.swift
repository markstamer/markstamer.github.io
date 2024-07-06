import Foundation
import Ignite

struct Home: StaticPage {
    var title = "Mark Stamer"
    
    func body(context: PublishingContext) -> [BlockElement] {        
        profileSection
            .padding(.vertical, .extraLarge)
                
        workSection
            .padding(.vertical, .extraLarge)
            .id("work")
        
        articleSection(context.allContent)
            .padding(.vertical, .extraLarge)
            .id("articles")
    }
}
