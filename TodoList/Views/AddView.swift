//
//  AddView.swift
//  TodoList
//
//  Created by Juan José Perálvarez Ortiz on 18/3/25.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldtext: String = ""
    @State var alerTitle: String = ""
    @State var showAlert: Bool = false
    private let titleNavBar: String = "Añade un item ✍🏽"
    
    var body: some View {
        ScrollView {
            VStack {
                placeholder
                saveButtonPressed
            }
            .padding(14)
        }
        .navigationTitle(titleNavBar)
        .alert(isPresented: $showAlert, content: getAlert)
    }
}

struct Addview_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
    }
}

extension AddView {
    private var placeholder: some View {
        TextField("Escribe algo aquí...".capitalized, text: $textFieldtext)
            .padding(.horizontal)
            .frame(height: 55)
            .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
            .cornerRadius(10)
    }
    
    private var saveButtonPressed: some View {
        Button {
            if textIsAproppiate() {
                listViewModel.saveButtonPressed(title: textFieldtext)
                dismiss()
            }
        } label: {
            Text("Guardar".uppercased())
                .foregroundColor(.white)
                .font(.headline)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
        }
        .background(Color.accentColor)
        .cornerRadius(10)
    }
    
    func textIsAproppiate() -> Bool {
        if textFieldtext.count < 3 {
            alerTitle = "El nuevo TODO tiene que tener al menos 3 carácteres"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alerTitle))
    }
}
