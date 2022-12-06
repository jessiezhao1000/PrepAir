//
//  Task.swift
//  PrepAir-1
//
//  Created by Jessie Zhao on 12/6/22.
//

import SwiftUI

//Task model and sample
//array of task
struct Task: Identifiable{
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
}
//total task meta view
struct TaskMetaData: Identifiable{
    var id = UUID().uuidString
    var task: [Task]
    var taskDate: Date
}

func getSampleDate(offset: Int)->Date{
    let calender = Calendar.current
    let date = calender.date(byAdding: .day, value: offset, to: Date())
    return date ?? Date()
}
// Samples
var tasks: [TaskMetaData] = [
    TaskMetaData(task: [
        Task(title: "ni sha bi"),
        Task(title: "ni shi sha bi"),
        Task(title: "ni shi da sha bi")
    ], taskDate: getSampleDate(offset: 99))
]
