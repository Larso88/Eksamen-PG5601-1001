

import SwiftUI

struct NutritionView: View {
    
    @State private var sugarAnimationOperator: Bool = false
    
    
    
    let fruit: DbFruit
    

    var body: some View {
        Section("Nutritions: ") {
            Text("Carbohydrates: \(fruit.carbohydrates, specifier: "%.1f")g")
            Text("Calories: \(fruit.calories, specifier: "%.1f")g")
            Text("Proteins: \(fruit.protein, specifier: "%.1f")g")
            Text("Sugar: \(fruit.sugar, specifier: "%.1f")g")
                .background(RoundedRectangle(cornerRadius: 20)
                    .fill(sugarAnimationOperator ? .red : .white)
                    .opacity(0.6)
                    .frame( width: 140 ,height: 35)
                    .cornerRadius(sugarAnimationOperator ?  100 : 50)
                )
            
            Text("Fat: \(fruit.fat, specifier: "%.1f")g")
            if fruit.sugar > 10 {
                Text("This fruit has a high sugar consentrate").foregroundColor(.red)
            }
        }.onAppear{
            withAnimation(Animation
                .default
                .delay(0.7)
                .repeatForever(autoreverses: true)
            ){
                
                if fruit.sugar > 10 {
                    sugarAnimationOperator.toggle()
                }
                
            }
        }
    }
}

struct NutritionView_Previews: PreviewProvider
{
    static let myContext = DataModel.myShared.myContext
    
    static var previews: some View
    {
        let fruit = DbFruit(context: myContext)
        
        fruit.id = UUID()
        fruit.name = "Avocado"
        fruit.family = "Lauraceae"
        fruit.genus = "Persea"
        fruit.order = "Laurales"
        fruit.carbohydrates = 13.37
        fruit.calories = 1337
        fruit.protein = 13.37
        fruit.sugar = 133.37
        fruit.fat = 13.37
        
        return NutritionView(fruit: fruit)
    }
}
