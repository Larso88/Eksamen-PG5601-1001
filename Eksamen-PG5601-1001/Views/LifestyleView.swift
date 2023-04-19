

import SwiftUI

struct LifestyleView: View {
    
    @EnvironmentObject var datamodel: JsonModel
    
    var body: some View {
        List{
            ForEach(datamodel.fruits) {
                fruit in
                
                
                Spacer()
                HStack {
                    Text("ID: \(fruit.id)")
                }
                HStack {
                    Spacer()
                    Text("Familie: \(fruit.family)")
                    Spacer()
                    Text("Navn: \(fruit.name)")
                }
            }
        }.task {
            await datamodel.loadFruits()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LifestyleView().environmentObject(JsonModel())
    }
}
