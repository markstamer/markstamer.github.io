import Ignite

struct Imprint: StaticPage {
    var title: String = "Imprint"

    func body(context: PublishingContext) async -> [any BlockElement] {
        Section {
            Text(markdown: """
            # -
            # Imprint

            ### Information pursuant to § 5 TMG:

            **Dr.-Ing. Mark Stamer**

            Himmelstraße 33

            22299 Hamburg

            Germany

            #### Contact:

            E-Mail: markstamer@gmail.com

            Website: markstamer.github.io

            #### VAT ID:

            VAT identification number according to § 27 a Value Added Tax Act: DE354159226

            ### Disclaimer

            ##### Liability for Content

            As a service provider, we are responsible for our own content on these pages in accordance with § 7 Abs.1 TMG under general laws. According to §§ 8 to 10 TMG, we are not obliged to monitor transmitted or stored external information or to investigate circumstances that indicate illegal activity.

            Obligations to remove or block the use of information under general laws remain unaffected. However, liability in this regard is only possible from the time of knowledge of a specific infringement. Upon notification of such violations, we will remove this content immediately.
            
            ##### Liability for Links

            Our offer contains links to external websites of third parties, on whose contents we have no influence. Therefore, we cannot assume any liability for these external contents. The respective provider or operator of the pages is always responsible for the contents of the linked pages. The linked pages were checked for possible legal violations at the time of linking. Illegal contents were not recognizable at the time of linking.

            A permanent content control of the linked pages is, however, not reasonable without concrete evidence of a violation of law. Upon notification of violations, we will remove such links immediately.

            ##### Copyright

            The contents and works created by the site operators on these pages are subject to German copyright law. The duplication, processing, distribution, and any kind of exploitation outside the limits of copyright law require the written consent of the respective author or creator. Downloads and copies of this site are only permitted for private, non-commercial use.

            Insofar as the content on this site was not created by the operator, the copyrights of third parties are respected. In particular, third-party content is marked as such. Should you nevertheless become aware of a copyright infringement, please inform us accordingly. Upon notification of violations, we will remove such content immediately.
            """)
        }
        .margin(.vertical, .extraLarge)
        .frame(maxWidth: .containerWidth(.large))
    }
}
