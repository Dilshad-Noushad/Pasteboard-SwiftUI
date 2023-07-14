//
//  ContentView.swift
//  Demo1
//
//  Created by Dilshad N on 27/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var vm: ViewModel
    @State private var isPresented: Bool = false
    
    // MARK: - Navbar appearance
    init() {
        let navAppearance = UINavigationBar.appearance()
        navAppearance.largeTitleTextAttributes = [.font: UIFont(name: "Merriweather-Bold", size: 40) ?? ""]
    }
    
    var body: some View {
     
        NavigationView {
            ZStack(alignment: .bottom) {
                ScrollView {
                    ForEach(vm.data, id: \.id) { item in
                       CardView(data: item)
                    }
                }
                .navigationTitle(Text("People"))
                .navigationBarItems(trailing: Button(action: {
                    self.isPresented.toggle()
                }, label: {
                    Image(systemName: "plus")
                        .foregroundColor(Color.red)
                }))
                .fullScreenCover(isPresented: $isPresented) {
                    UserView { data in
                        vm.data.append(data)
                        
                    }
                }
                if vm.isNameCpyd == true {
                    Text("Copied")
                        .font(.title2)
                        .frame(width: 100, height: 60)
                        .background(.green.opacity(0.4))
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ViewModel())
    }
}
