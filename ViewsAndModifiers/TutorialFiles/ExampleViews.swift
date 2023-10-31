//
//  ExampleViews.swift
//  ViewsAndModifiers
//
//  Created by SCOTT CROWDER on 10/17/23.
//

import SwiftUI

struct ExampleViews: View {
    var body: some View {
//        FrameExampleView()
//        FrameColorExample()
//        ColorFrameExample()
//        PaddingColorExample()
//        TernaryOperatorExample()
//        EnviornmentModifiers()
//        ViewsAsProperties()
//        PrimaryView()
//        CustomModifiers()
        GridView()
    }
}

struct FrameExampleView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(.red)
    }
    
}

struct FrameColorExample: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
        }
        .background(.red)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
}

struct ColorFrameExample: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.red)
    }
    
}

struct PaddingColorExample: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .background(.red)
                .padding()
                .background(.green)
                .padding()
                .background(.blue)
                .padding()
                .background(.yellow)
                .padding()
                .background(.cyan)
                .padding()
        }
        
    }
    
}

struct TernaryOperatorExample: View {
    @State private var useRedText: Bool = true
    var body: some View {
        if useRedText {
            Button("Hello world") {
                useRedText.toggle()
            }
            .foregroundStyle(.red)
        } else {
            Button("Hello world") {
                useRedText.toggle()
            }
            .foregroundStyle(.blue)
        }
        
        
        Button("Click me to change my color") {
            useRedText.toggle()
        }
        .foregroundColor(useRedText ? .red : .blue)
        .frame(maxWidth: 200)
        .background(.black)
        .clipShape(.rect(cornerRadius: 20))
    }
}

struct EnviornmentModifiers: View {
    var body: some View {
        VStack {
            Text("Car")
                .font(.largeTitle)
            Text("Truck")
            Text("Van")
            Text("SUV")
        }
        .font(.subheadline)
        
        VStack {
            Text("Car")
                .blur(radius: 0)
            Text("Truck")
            Text("Van")
            Text("SUV")
        }
        .blur(radius: /*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
    }
}

struct ViewsAsProperties: View {
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")
    
    var spells: some View {
        VStack {
            Text("Lumos")
            Text("Obliviate")
        }
    }
    
    var spellsGroup: some View {
        Group {
            Text("Lumos")
            Text("Obliviate")
        }
    }
    
    @ViewBuilder var spellsViewBuilder: some View {
        Text("Lumos")
        Text("Obliviate")
    }
    
    var body: some View {
        VStack {
            motto1
                .foregroundStyle(.red)
            motto2
                .foregroundStyle(.blue)
            motto1
                .foregroundStyle(.green)
            spells
            spellsGroup
                .foregroundColor(.yellow)
            spellsViewBuilder
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        }
    }
}

struct ChildView: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(.blue)
            .clipShape(.capsule)
    }
}

struct PrimaryView: View {
    var body: some View {
        VStack {
            ChildView(text: "First")
                .foregroundStyle(.white)
            ChildView(text: "Second")
                .foregroundStyle(.yellow)
                .padding()
                .background(.green)
                .clipShape(.rect(cornerRadius: 20))
        }
    }
}

struct TitleView: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
    }
}

struct Watermark: ViewModifier {
    var watermarkText: String
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(watermarkText)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(watermarkText: text))
    }
}

struct CustomModifiers: View {
    var body: some View {
        VStack {
            Text("Hello World")
                .modifier(TitleView())
            Color.blue
                .frame(width: 300, height: 200)
                .watermarked(with: "This image is copyright protected")
        }
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) {row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}



struct GridView: View {
    var body: some View {
        GridStack(rows: 3, columns: 3) {row, col in
            Button {
                print("click")
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

#Preview {
    ExampleViews()
}
