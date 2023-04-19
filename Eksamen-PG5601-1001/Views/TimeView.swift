
import SwiftUI

struct TimeView: View {
    
    @Binding var fruitTime: Date

    
    init(_ fruitTime: Binding<Date>) {
        self._fruitTime = fruitTime
        UIDatePicker.appearance().backgroundColor = UIColor.init(.white)
        UIDatePicker.appearance().tintColor  = UIColor.init(Color("OliveGreen"))
    }
    

    
    var body: some View {
        
        VStack {
            
            DatePicker("", selection: $fruitTime, in: ...Date())
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color("OliveGreen"))
                        .opacity(1)
                        .frame(width: .infinity, height: 350 )
                        .cornerRadius(50)
                    
                ).font(.headline)
                .foregroundColor(.white)
                .offset(y: -330)
            
            Text("When did you eath the fruit?")
                .font(.largeTitle)
                .offset(y: -345)
                .foregroundColor(.white)
            

        }
            
    }
}

struct TimeView_Previews: PreviewProvider {
    static var previews: some View {
        TimeView(.constant(Date.now))
    }
}
