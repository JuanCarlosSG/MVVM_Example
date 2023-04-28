//
//  TodoDetailView.swift
//  MVVM Example
//
//  Created by Juan Carlos on 27/04/23.
//

import SwiftUI

struct TodoDetailView: View {
    var todo : TODO
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(todo.completed ? "Completed" : "Pending Completion")
                .foregroundColor(todo.completed ? .green : .red)
                .font(.title)
            Text("\(todo.userId)")
                .font(.title2)
            Text("\(todo.id)")
                .font(.title2)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .navigationTitle(todo.title)
    }
}

struct TodoDetailView_Binding: View {
    @Binding var todo : TODO!
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(todo.completed ? "Completed" : "Pending Completion")
                .foregroundColor(todo.completed ? .green : .red)
                .font(.title)
            Text("\(todo.userId)")
                .font(.title2)
            Text("\(todo.id)")
                .font(.title2)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .navigationTitle(todo.title)
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailView(todo: TODO(userId: 92301831, id: 10239187293, title: "Test", completed: true))
    }
}

