
import SwiftUI

@main
struct FruitApp: App {
    @Environment(\.scenePhase) var scene
    
    var body: some Scene {
        WindowGroup {
            let db = DataModel.myShared
            MainView().environment(\.managedObjectContext, db.myContainer.viewContext)
        }.onChange(of: scene) {
            _ in
            
            DataModel.myShared.save()
        }

    }
}
