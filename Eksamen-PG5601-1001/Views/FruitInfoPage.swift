import SwiftUI
import CoreData

struct FruitInfoPage: View {
    
    
    
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.date),
        SortDescriptor(\.number)
    ])
    private var fruits: FetchedResults<DbEvent>
    
    @StateObject var fruit: DbFruit
    @State private var date = Date()
    
    let emojicons = ["🍎", "🍊", "🍋", "🫐", "🍒", "🍍", "🥝", "🍇", "�" ]
    

    @State private var sugarAnimationOperator: Bool = false
    @State public var modalBool: Bool = false
    
    
    var body: some View {
        Spacer()
        ZStack {
            List {
                
                Section("\(fruit.name ?? "Missing info") Info:") {
                    Text("Family: \(fruit.family ?? "Missing info")")
                    Text("Genus: \(fruit.genus ?? "Missing info")")
                    Text("Order: \(fruit.order ?? "Missing info")")
                    /*Text("Total eaten fruit: \(DataModel.myShared.countEvents())")*/
                    
                        Text("Numer of \(fruit.name ?? "Missing info")`s eaten: \(fruit.event_number)")
                
                }
                NutritionView(fruit: fruit)
            }
            if !modalBool {
                Button {
                    modalBool = true
                    
                }
                label: { VStack {
                Circle()
                    .fill(Color("OliveGreen"))
                    .frame(width: 70, height: 70)
                    .shadow(color: Color("OliveGreen"), radius: 4)
                    .overlay(Image(systemName: "plus")
                        .foregroundColor(.white)
                        .font(.title)
                    )
                Text("Spis Frukt").foregroundColor(Color("OliveGreen"))
            }
                
            }.offset(y: 280)
            .offset(x:122)
            }
            if modalBool{
                TimeView($date)
                Button{
                    modalBool = false
                }label: {
                    Text("Tilbake").foregroundColor(.white)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.red)
                        .frame(width: 150,height: 50)
                        
                        )
                }.offset(y: -240)
                    .offset(x: 80)
                Button{
                    DataModel.myShared.addEvent(fruit: fruit, time: date)
                    modalBool = false
                }label: {
                    Text("Legg til").foregroundColor(Color("OliveGreen"))
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("LimeYellow"))
                        .frame(width: 150,height: 50)
                        
                        )
                }.offset(y: -240)
                .offset(x: -80)
            }

            FruitAnimationView(fruit: fruit)
        }
        
    }
}


//Sending in a random fruit, just for preview purposes
struct FruitInfoPage_Previews: PreviewProvider {
    static let myContext = DataModel.myShared.myContext
    
    static var previews: some View {
        let fruit = DbFruit(context: myContext)
        
        fruit.id = UUID()
        fruit.name = "Avocado"
        fruit.family = "Lauraceae"
        fruit.genus = "Persea"
        fruit.order = "Laurales"
        fruit.carbohydrates = 13.37
        fruit.calories = 1337
        fruit.protein = 13.37
        fruit.sugar = 113.37
        fruit.fat = 13.37
        
        return FruitInfoPage(fruit: fruit)
    }
}
