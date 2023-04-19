

import SwiftUI

struct SettingsView: View {
    
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.family),
        SortDescriptor(\.name)
    ])
    private var fruits: FetchedResults<DbFruit>
    
    
    @StateObject var json = JsonModel()
    
    @State var importConfirmed = false
    @State var importCompleted = false
    @State var deleteConfirmed = false
    @State var deleteCompleted = false
    
    
    
    var body: some View {
    
        VStack {
            
            Spacer().frame(minHeight: 40, maxHeight: 60)
            VStack {
            
                Text("Import fruit to the database \n").foregroundColor(Color("OliveGreen"))
                
                if fruits.count < 1 {
                    Button("Import") {
                        importConfirmed = true
                    
                    }
                    .buttonStyle(.borderedProminent)
                    .confirmationDialog("Import", isPresented: $importConfirmed) {
                        Button("Confirm", role: .destructive) {
                            for index in 0...json.fruits.count - 1 {
                                DataModel.myShared.addFruit(fruit: json.fruits[index])
                            }
                            DataModel.myShared.save()
                            
                            importCompleted = true
                        }
                        
                        Button("Cancel", role: .cancel) {}
                    }
                    .alert("Added the fruits to the datbase!", isPresented: $importCompleted) {
                        Button("OK", role: .cancel) {}
                    }
                    
                    
                    .listStyle(.plain)
                    .task {
                        await json.getFruits()
                    }
                }
                else {
                    Text("Fruit is imported").foregroundColor(Color("OliveGreen"))
                }
                
            }
            .padding()
            
            VStack {
                
                Text("Fruit in the database right now: \(DataModel.myShared.countFruits())\n").foregroundColor(Color("OliveGreen"))
                
                Text("Total amount of fruit eaten: \(DataModel.myShared.countEvents())\n\n\n").foregroundColor(Color("OliveGreen"))
                
                Text("Delete fruit from the database").foregroundColor(Color("OliveGreen"))
                
                Button("Delete", role: .destructive) {
                    deleteConfirmed = true
                }
                .buttonStyle(.borderedProminent)
                .confirmationDialog("Delete fruit in database", isPresented: $deleteConfirmed) {
                    Button("Confirm", role: .destructive) {
                        DataModel.myShared.deleteAllFruits()
                        DataModel.myShared.deletedAllEvents()
                        deleteCompleted = true
                    }
                    
                    Button("Cancel", role: .cancel) {}
                }.alert("Imported fruits are deleted from the database", isPresented: $deleteCompleted) {
                    Button("OK", role: .cancel) {}
                }
                Spacer().frame(minHeight: 40, idealHeight: 40, maxHeight: 80)
                Link("Source: https://fruityvice.com/api/fruit/all", destination: URL(string: "https://fruityvice.com/api/fruit/all")!)
                Spacer()
            }
            .padding()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
