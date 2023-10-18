//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by SCOTT CROWDER on 10/17/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("GridStack Example")
                .promoteTitle()
            GridStack(rows: 3, columns: 3) {row, col in
                Button {
                    print("click coordinates: (\(row), \(col))")
                } label: {
                    Text("Button (\(row), \(col))")
                        .foregroundStyle(.white)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 100)
                        .background(.red)
                }
            }
            .padding(.trailing)
            .padding(.leading)
        }
        
        
    }
    
}

struct ProminentTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .padding()
    }
}

extension View {
    func promoteTitle() -> some View {
        modifier(ProminentTitle())
    }
}

#Preview {
    ContentView()
}
