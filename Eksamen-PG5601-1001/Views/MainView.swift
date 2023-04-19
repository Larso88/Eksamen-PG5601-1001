

import SwiftUI

struct MainView: View {
    

    //Four tabs with different views.
    var body: some View {
            TabView{
                FruitView().tabItem{
                    Image(systemName: "list.bullet")
                    Text("Fruit List")
                }
                GroupView().tabItem{
                    Image(systemName: "rectangle.3.group")
                    Text("Groups")
                }
                LogView().tabItem{
                    Image(systemName: "list.clipboard")
                    Text("Fruit Log")
                }
                SettingsView().tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
            //Creating custom tab bar.
            }.onAppear() {
                UITabBar.appearance().barTintColor = UIColor(Color("OliveGreen"))
            }.accentColor(.orange)
    }
}
//Sending in the myContainer so we can use DB functions in views
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environment(\.managedObjectContext, DataModel.myShared.myContainer.viewContext)
    }
}

