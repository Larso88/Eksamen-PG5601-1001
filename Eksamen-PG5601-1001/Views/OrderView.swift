

import SwiftUI

struct OrderView: View {
    
    @SectionedFetchRequest<String, DbFruit>(sectionIdentifier: \.order!, sortDescriptors: [
        SortDescriptor(\.order),
        SortDescriptor(\.name)
    ])
    private var orders :SectionedFetchResults<String, DbFruit>
    
    var body: some View {
        DisclosureGroup("Orders") {
            ForEach(orders) {
                order in
                
                DisclosureGroup(order.id){
                    ForEach(order) {
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
                .fill(Color("LimeYellow"))
                .opacity(0.3)
                .frame(height: 100)
                        
            )
            .listRowSeparator(.hidden)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
