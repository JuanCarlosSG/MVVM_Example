//
//  TodoListView.swift
//  MVVM Example
//
//  Created by Juan Carlos on 30/03/23.
//

import SwiftUI

struct TodoListView: View {
    @ObservedObject var exampleViewModel = ExampleViewModel()
    var body: some View {
        Group {
            if !exampleViewModel.todos.isEmpty {
                List {
                    ForEach(exampleViewModel.todos) { todo in
                        HStack(alignment: .top) {
                            Text(todo.title)
                            Spacer()
                            Image(systemName: todo.completed ? "checkmark.circle.fill" : "x.circle.fill")
                                .foregroundColor(todo.completed ? .green : .red)
                        }
                    }
                }
            } else {
                ProgressView()
            }
        }
        .onAppear {
            exampleViewModel.getTodos()
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
