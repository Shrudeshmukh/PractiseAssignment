//
//  LoginFormView.swift
//  Demo
//
//  Created by admin on 27/01/25.
//

import SwiftUI

struct LoginFormView: View {
    @State private var username:String=""
    @State private var password:String=""
    
    var body: some View {
            VStack{
                Text("LOGIN")
                    .font(.title)
                    .padding()
                
                TextField("Username",text:$username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("password",text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action:{
                    
                }){
                    Text("Login").font(.body)
                }
                .padding(.all)
                .foregroundColor(.white)
                .background(.blue)
                .frame(width:200, height: 50)
            }
            .padding(.all)
    
        }
    }



struct LoginFormView_Previews: PreviewProvider {
    static var previews: some View {
        LoginFormView()
    }
}
    

