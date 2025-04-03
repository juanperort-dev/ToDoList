//
//  NoItemsView.swift
//  TodoList
//
//  Created by Juan José Perálvarez Ortiz on 26/3/25.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                loadInfo
                showNavigation
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
    
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .navigationTitle("NoItemsView")
        }
    }
}

extension NoItemsView {
    private var loadInfo: some View {
        VStack {
            Text("No hay ToDo")
                .font(.title)
                .fontWeight(.semibold)
            
            Text("Añade nuevos ToDo y ponte manos a la obra! 🤨")
                .padding(.bottom, 20)
        }
    }
    
    private var showNavigation: some View {
        NavigationLink(
            destination: AddView(),
            label: {
                Text("Añade uno nuevo 🎉")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(animate ? secondaryAccentColor : Color.accentColor)
                    .cornerRadius(10)
    })
        .padding(.horizontal, animate ? 30 : 50)
        .shadow(
            color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
            radius: animate ? 30 : 10,
            x: 0,
            y: animate ? 50 : 30)
        .scaleEffect(animate ? 1.1 : 1.0)
        .offset(y: animate ? -7 : 0)
    }
    
}
