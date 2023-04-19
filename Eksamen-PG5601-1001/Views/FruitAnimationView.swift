

import SwiftUI

struct FruitAnimationView: View {
    @SectionedFetchRequest<String, DbFruit>(sectionIdentifier: \.family!, sortDescriptors: [
        SortDescriptor(\.name)
    ])
    
    
    private var families:SectionedFetchResults<String, DbFruit>
    
    
    @StateObject var fruit: DbFruit
    
    let emjoicons = ["🍎", "🍊", "🍋", "🫐", "🍒", "🍍", "🥝", "🍇", "�" ]
    
    var chosenEmojicon = ""
   
    @State var fruitAnimationOperator: Bool = false
    
    var body: some View {
        ZStack {
           
            Button{
                withAnimation(Animation
                    .timingCurve(0.5, 0, 0.75, 0)
                    .speed(0.1)
                    .delay(0.3)
                    
                    .repeatCount(0, autoreverses: true)
                    
                ){
                    fruitAnimationOperator.toggle()
                }
                
            }label: { VStack {
                Circle()
                    .fill(.orange)
                    .frame(width: 70, height: 70)
                    .shadow(color: Color("OliveGreen"), radius: 4)
                    .overlay(Image(systemName: "cloud.rain")
                        .foregroundColor(.white)
                        .font(.title)
                    )
                Text("Regn frukt").foregroundColor(Color("OliveGreen"))
            }
                
            }.offset(y: 280)
            .offset(x: -122)
            /*It`s not pretty, but it works... Tried to find a way
            /to change the variable outside the view and then pass it into the view, depending on fruit, but got error and crashes.*/
            switch fruit.name {
                case "Apple":
                    Text(emjoicons[0])
                        .offset(x: CGFloat(Int.random(in: 0...50)))
                        .offset(y: fruitAnimationOperator ? 500 : -500)
                        .font(fruitAnimationOperator ? .title3 : .title)
                        .rotationEffect(Angle(degrees: fruitAnimationOperator ? 20 : 0))

                case "Orange":
                Text(emjoicons[1])
                    .offset(x: CGFloat(Int.random(in: 0...50)))
                    .offset(y: fruitAnimationOperator ? 500 : -500)
                    .font(fruitAnimationOperator ? .title3 : .title)
                    .rotationEffect(Angle(degrees: fruitAnimationOperator ? 20 : 0))
            case "Lemon":
                Text(emjoicons[2])
                    .offset(x: CGFloat(Int.random(in: 0...50)))
                    .offset(y: fruitAnimationOperator ? 500 : -500)
                    .font(fruitAnimationOperator ? .title3 : .title)
                    .rotationEffect(Angle(degrees: fruitAnimationOperator ? 20 : 0))
            case "Blueberry":
                Text(emjoicons[3])
                    .offset(x: CGFloat(Int.random(in: 0...50)))
                    .offset(y: fruitAnimationOperator ? 500 : -500)
                    .font(fruitAnimationOperator ? .title3 : .title)
                    .rotationEffect(Angle(degrees: fruitAnimationOperator ? 20 : 0))
            case "Cherry":
                Text(emjoicons[4])
                    .offset(x: CGFloat(Int.random(in: 0...50)))
                    .offset(y: fruitAnimationOperator ? 500 : -500)
                    .font(fruitAnimationOperator ? .title3 : .title)
                    .rotationEffect(Angle(degrees: fruitAnimationOperator ? 20 : 0))
            case "Pineapple":
                Text(emjoicons[5])
                    .offset(x: CGFloat(Int.random(in: 0...50)))
                    .offset(y: fruitAnimationOperator ? 500 : -500)
                    .font(fruitAnimationOperator ? .title3 : .title)
                    .rotationEffect(Angle(degrees: fruitAnimationOperator ? 20 : 0))
            case "Kiwi", "Kiwifruit":
                Text(emjoicons[6])
                    .offset(x: CGFloat(Int.random(in: 0...50)))
                    .offset(y: fruitAnimationOperator ? 500 : -500)
                    .font(fruitAnimationOperator ? .title3 : .title)
                    .rotationEffect(Angle(degrees: fruitAnimationOperator ? 20 : 0))
            case "Grape", "Grapes":
                Text(emjoicons[7])
                    .offset(x: CGFloat(Int.random(in: 0...50)))
                    .offset(y: fruitAnimationOperator ? 500 : -500)
                    .font(fruitAnimationOperator ? .title3 : .title)
                    .rotationEffect(Angle(degrees: fruitAnimationOperator ? 20 : 0))
                
            default:
                Text(emjoicons[8])
                    .offset(x: CGFloat(Int.random(in: 0...50)))
                    .offset(y: fruitAnimationOperator ? 500 : -500)
                    .font(fruitAnimationOperator ? .title3 : .title)
                    .rotationEffect(Angle(degrees: fruitAnimationOperator ? 20 : 0))
            }
            
        }
    }
}

struct FruitAnimationView_Previews: PreviewProvider {
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
