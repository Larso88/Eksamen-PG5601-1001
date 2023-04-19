import SwiftUI
import CoreData

struct GroupView: View {
    @SectionedFetchRequest<String, DbFruit>(sectionIdentifier: \.family!, sortDescriptors: [
        SortDescriptor(\.family),
        SortDescriptor(\.name)
    ])
    
    private var families:SectionedFetchResults<String, DbFruit>
    
    var body: some View {
        NavigationView() {
            List {
                FamilyView().frame(height: 80)
                GenusView().frame(height: 80)
                OrderView().frame(height: 80)
                
                
            }.listStyle(.plain)
            .listRowSeparator(.hidden)
        }
    }
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView().environment(\.managedObjectContext, DataModel.myShared.myContext)
    }
}
