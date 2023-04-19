

import SwiftUI

struct FruitView: View {

    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.family),
        SortDescriptor(\.name)
    ])
    private var fruits: FetchedResults<DbFruit>
    
    var body: some View {
        if !fruits.isEmpty {
            NavigationView {
                VStack {
                    //Cute litle logo just for fun.
                    Image("MainLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 60)
                    List {
                        //Looping trough all the fruits
                        ForEach(fruits) {
                            fruit in
                            //Link that takes in the fruit in that spific itteration so that we can use the subinfo in the chidren view.
                            NavigationLink {
                                FruitInfoPage(fruit: fruit)
                            }
                            //Created a row view that also need to take in fuit so we can use it`s subinfo.
                        label:{
                            FruitRow(fruit)
                        }
                        }
                    }
                    .listStyle(.inset)
                }
                
            }
        }
        else {
            //Creating a screen if there is no fruits in the view
            VStack {
                Text("Your fruit database is empty\n")
                Text("Go to settings to import fruit")
                
            }
        }
    }
}


struct FruitView_Previews: PreviewProvider {
    static var previews: some View {
        FruitView().environment(\.managedObjectContext, DataModel.myShared.myContext)
    }
}
