//
//  CardView.swift
//  Demo1
//
//  Created by Dilshad N on 27/11/22.
//

import SwiftUI

struct CardView: View {
    
    var data: Model
    @EnvironmentObject var vm: ViewModel
    
    @State var colors: [Color] = [.ocean, .flame, .blueColor, .purpleColor]
   
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .foregroundColor(getRandomColor())
                .frame(maxWidth: .infinity)
                .frame(height: 120)
                .padding([.leading, .trailing], 10)
                .overlay(
                    HStack {
                        VStack(alignment: .leading) {
                            Text(data.name)
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .heavy, design: .rounded))
                                .padding([.top, .bottom], 5)
                                .padding(.horizontal, 15)
                                .background(Color.cyan)
                                .cornerRadius(10)
                                .onTapGesture {
                                    vm.isNameCpyd.toggle()
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                        vm.isNameCpyd = false
                                    }
                                    //MARK: - Copy user name
                                    UIPasteboard.general.string = data.name
                                }
                            Text(data.msg)
                                .font(.headline.bold())
                                .padding(.vertical, 5)
                            
                            Spacer()
                        }
                        .padding(.leading, 30)
                        .padding(.top, 20)
                        
                        Spacer()
                    }
                )
            
        }
        
    }
    //MARK: - function for Random color
    /// function for Random color
    /// - Returns: random Color
   public func getRandomColor() -> Color {
        guard let randomClr = colors.randomElement() else {
            return Color.purpleColor
        }
        return randomClr
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(data: Model(name: "Tom", msg: "It's me Tom🐱"))
            .environmentObject(ViewModel())
    }
}
//MARK: - Extension Color
extension Color {
  static let ocean = Color("ocean")
  static let blueColor = Color("blueColor")
  static let flame = Color("flame")
  static let purpleColor = Color("purpleColor")
        
}
