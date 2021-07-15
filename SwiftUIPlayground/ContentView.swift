//
//  ContentView.swift
//  SwiftUIPlayground
//
//  Created by Jeemyeong Lee on 2021/07/05.
//
//

import SwiftUI

import Combine

struct ContentView: View {

    var body: some View {
        VStack {
            Text("Hi")
        }
        .onAppear {
            doThings()
        }
    }

    func doThings() {
        print("start")
        let future = Future<Int, Never> { promise in
            // promise(.success(1))
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                promise(.success(1))
            }
        }
        future.sink(receiveCompletion: { print($0) },
                receiveValue: { print($0) })

        print("end")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
