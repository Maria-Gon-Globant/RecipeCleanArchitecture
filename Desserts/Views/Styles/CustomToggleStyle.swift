//
//  CustomToggleStyle.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 30/04/24.
//

import SwiftUI

struct CustomToggleStyle: ToggleStyle{
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .center){
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .foregroundStyle(Color(hex: 0x0e6ebf2))
                .frame(width: 300, height: 50)
            
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .foregroundStyle(Color(hex: 0x00a2533))
                .frame(width: 145, height: 44)
                .offset(x: configuration.isOn ? 80 : -80)
                .shadow(color: .gray, radius: 5)
            HStack{
                Text("Ingredients")
                    .bold()
                    .foregroundStyle(configuration.isOn ? Color(.black) : Color(.white))
                Spacer()
                Text("Instructions")
                    .bold()
                    .foregroundStyle(configuration.isOn ? Color(.white) : Color(.black))
            }.frame(width: 250)
        }.onTapGesture {
            withAnimation(.easeInOut(duration: 0.2)){
                configuration.isOn.toggle()
                
            }
        }
    }
}
