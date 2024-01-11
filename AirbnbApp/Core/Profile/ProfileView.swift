//
//  ProfileView.swift
//  AirbnbApp
//
//  Created by Mahyar Moazezi on 1/9/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Profile").font(.title).fontWeight(.bold)
            Text("Log in to start your planning trip.").font(.headline)
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Log In").foregroundStyle(.white).fontWeight(.semibold).frame(maxWidth: .infinity,minHeight: 50).background(.pink).clipShape(RoundedRectangle(cornerRadius: 10)).padding(.vertical)
                
            })
            HStack{
                Text("Don't Have an account?").font(.caption).fontWeight(.semibold)
                Text("Sign up").underline().font(.headline).fontWeight(.bold)
            }
            VStack{
                ProfileRowView(icon: "gear",title:"Setting")
                Divider()
                
                ProfileRowView(icon: "gear",title:"Accessibility")
                Divider()
                ProfileRowView(icon: "questionmark.circle",title:"Visit the help center")
            }
          Spacer()
            
        }.padding()
    }
}

#Preview {
    ProfileView()
}
