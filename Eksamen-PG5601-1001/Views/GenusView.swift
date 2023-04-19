
import SwiftUI

struct GenusView: View {
    
    @SectionedFetchRequest<String, DbFruit>(sectionIdentifier: \.genus!, sortDescriptors: [
        SortDescriptor(\.genus),
        SortDescriptor(\.name)
    ])
    private var genuses :SectionedFetchResults<String, DbFruit>
    
    var body: some View {
        DisclosureGroup("Genuses") {
            ForEach(genuses) {
                genus in
                
                DisclosureGroup(genus.id){
                    ForEach(genus) {
                        fruit in
                        
                        NavigationLink {
                            FruitInfoPage(fruit: fruit)
                        }
                        label: {
                        Text(fruit.name ?? "Missing data")
                        }.frame(width: 110)
                    }
                }
                
            }
        }.accentColor(Color("OliveGreen"))
            .padding()
            .background(RoundedRectangle(cornerRadius: 20)
                .fill(Color("Green"))
                .opacity(0.3)
                .frame(height: 100)
                        
            )
            .listRowSeparator(.hidden)

    }
}

struct GenusView_Previews: PreviewProvider {
    static var previews: some View {
        GenusView()
    }
}
