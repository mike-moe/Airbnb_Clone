//
//  ProfileRowView.swift
//  AirbnbApp
//
//  Created by Mahyar Moazezi on 1/9/24.
//

import SwiftUI

struct ProfileRowView: View {
    let icon : String!
    let title : String!
    var body: some View {
        HStack{
            Image(systemName: icon)
            Text(title)
            Spacer()
            Image(systemName: "chevron.right")
        }.padding(.vertical,10)
    }
}

#Preview {
    ProfileRowView(icon: "gear",title: "Setting")
}
