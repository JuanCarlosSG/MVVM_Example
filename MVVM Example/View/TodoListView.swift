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
                        NavigationLink {
                            TodoDetailView(todo: todo)
                        } label: {
                            HStack(alignment: .top) {
                                Text(todo.title)
                                Spacer()
                                Image(systemName: todo.completed ? "checkmark.circle.fill" : "x.circle.fill")
                                    .foregroundColor(todo.completed ? .green : .red)
                            }
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

struct TodoListView_State_NavLink: View {
    @ObservedObject var exampleViewModel = ExampleViewModel()
    @State var showDetailView : Bool = false
    @State var currentToDo : TODO!
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
                        .onTapGesture {
                            currentToDo = todo
                            showDetailView.toggle()
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
        .navigationDestination(isPresented: self.$showDetailView) {
            TodoDetailView_Binding(todo: $currentToDo)
        }
    }
}

//struct TodoListView_Previews: PreviewProvider {
//    static var previews: some View {
//        TodoListView()
//    }
//}
