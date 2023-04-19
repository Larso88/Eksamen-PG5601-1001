

import SwiftUI

struct LogView: View {
    
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.date),
        SortDescriptor(\.number)
    ])
    
    private var events: FetchedResults<DbEvent>
    
    

    @State private var topExpanded: Bool = true
    
    
    var body: some View {
        List {
            Text("Your Fruit Log:").font(.largeTitle)
            ForEach(events) {
                event in
                
                
                DisclosureGroup("\(event.date.unsafelyUnwrapped.description)", isExpanded: $topExpanded ){
                    HStack {
                        Text("Name: \(event.oneFruit?.name ?? "Missing data")")
                        Text("Family: \(event.oneFruit?.family ?? "Missing data")")
                        Spacer()
                        
                    }
                        Text("Genus: \(event.oneFruit?.genus ?? "Missing data")")
                }
            }
        }
    }
}

func getDate(date: String) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd' 'HH:mm:ss"
    return dateFormatter.date(from: date)
}

struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        LogView().environment(\.managedObjectContext, DataModel.myShared.myContext)
    }
}
