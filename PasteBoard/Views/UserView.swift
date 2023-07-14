//
//  UserView.swift
//  Demo1
//
//  Created by Dilshad N on 27/11/22.
//

import SwiftUI

struct UserView: View {
    
    var data: (Model) -> ()
    @State var name: String = ""
    @State var msg: String = ""
    @Environment (\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Name", text: $name)
                .padding()
                .font(.headline)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(Color.blueColor)
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.white.opacity(0.5), lineWidth: 2)
                )
                .padding(.horizontal)
            
            TextField("Message", text: $msg, axis: .vertical)
                .padding()
                .font(.headline)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(Color.blueColor)
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.white.opacity(0.5), lineWidth: 2)
                )
                .padding(.horizontal)
            
            Button {
                self.data(.init(name: name, msg: msg))
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Save")
                    .foregroundColor(.white)
                    .padding()
                    .font(.title.bold())
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(.black.opacity(0.8))
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.white.opacity(0.8), lineWidth: 2)
                    )
                    .padding(.horizontal)
                    .padding(.top, 20)
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 300)
        .background(
            LinearGradient(colors: [.flame, .blueColor], startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .cornerRadius(20)
        .shadow(radius: 2)
        .padding(.horizontal, 20)
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(data: {_ in})
    }
}
