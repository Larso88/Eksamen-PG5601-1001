

import SwiftUI

struct FruitRow: View {
    

    let fruit: DbFruit
    //initialising the fruit.
    init(_ fruit: DbFruit) {
        self.fruit = fruit
    }
    //Might no be the pretties of solutions but it works. The switch case decides what kind of color is asigned to what family. The color is customized in "Assets".
    var backgroundColor: Color {
        
         switch fruit.family {
        case "Actinidiaceae":
             return Color("1")
        case "Anacardiaceae":
             return Color("2")
        case "Bromeliaceae":
             return Color("3")
        case "Cactaceae":
            return Color("4")
        case "Caricaceae":
            return Color("5")
        case "Cucurbitaceae":
            return Color("6")
        case "Ericaceae":
            return Color("7")
        case "Ebenaceae":
            return Color("8")
        case "Grossulariaceae":
            return Color("9")
        case "Lauraceae":
             return Color("10")
        case "Lythraceae":
            return Color("11")
        case "Malvaceae":
             return Color("12")
         case "Moraceae":
             return Color("13")
         case "Musaceae":
             return Color("14")
         case "Myrtaceae":
             return Color("15")
         case "Passifloraceae":
             return Color("16")
         case "Rosaceae":
             return Color("17")
         case "Rutaceae":
             return Color("18")
         case "Sapindaceae":
             return Color("19")
         case "Solanaceae":
             return Color("20")
         case "Vitaceae":
             return Color("21")
        default:
            return Color.red
        }
    }
    //Small view that shows one row as the exams askes for.
    var body: some View {
        HStack {
            //The square that shows the family color. The foreground color takes in the variable from the switch case so the color is correct with the right family.
            Rectangle()
                .foregroundColor(backgroundColor)
                .frame(width: 50, height: 50)
                .border(Color("OliveGreen"), width: 2)
                .cornerRadius(5)
            Text("Name: \n \(fruit.name ?? "Data unavailable")")
                .foregroundColor(Color("OliveGreen"))
                .font(.headline)
            Spacer()
            Text("Family: \n \(fruit.family ?? "Data unavailable")")
                .foregroundColor(Color("OliveGreen"))
                .font(.headline)
        }
    }
    
}
//Sending in a fruit to the preview for preview purposes.
struct FruitRow_Previews: PreviewProvider {
    static let myContext = DataModel.myShared.myContext
    
    static var previews: some View {
        let fruit = DbFruit(context: myContext)
        
        fruit.id = UUID()
        fruit.name = "Apple"
        fruit.family = "Rosaceae"
        fruit.genus = "Malus"
        fruit.order = "Rosales"
        fruit.carbohydrates = 11.4
        fruit.calories = 52
        fruit.protein = 0.3
        fruit.sugar = 10.3
        fruit.fat = 0.4
        
        return FruitRow(fruit)
    }
}
