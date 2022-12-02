//
//  CustomDatePicker.swift
//  PrepAir-1
//
//  Created by Jessie Zhao on 12/1/22.
//

import SwiftUI

struct CustomDatePicker: View {
    @Binding var currentDate: Date
    //month update on arrow button clicks
    @State var currentMonth: Int = 0
    var body: some View {
                   
//                .frame(width: 400, height: 500)
                
            VStack(spacing: 35){
                //days...
                let days: [String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
                HStack(spacing: 20){
                
                    VStack(alignment: .leading, spacing: 10){
                        
                        Text(extractData()[0])
                            .font(.caption)
                            .fontWeight(.semibold)
                        
                        Text(extractData()[1])
                            .font(.title.bold())
                    }
                    
                    Spacer(minLength: 0)
                    
                    Button{
                        withAnimation{
                            currentMonth -= 1
                        }
                    }label: {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                    }
                    Button{
                        withAnimation{
                            currentMonth += 1
                        }
                    }label: {
                        Image(systemName: "chevron.right")
                            .font(.title2)
                    }

                }
                .padding(.horizontal)
                //day view
                
                HStack(spacing: 0){
                    ForEach(days, id: \.self){day in
                        Text(day)
                            .font(.callout)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                    }
                }
                //dates..
                //lazy grid
                let columns = Array(repeating: GridItem(.flexible()), count: 7)
                
                LazyVGrid(columns: columns, spacing: 15){
                    ForEach(extractDate()){value in
                      
                        CardView(value: value)
                    }
                }
            }
            .onChange(of: currentMonth) { newValue in
                //updating month
                currentDate = getCurrentMonth()
        }
           
    }
    
    @ViewBuilder
    func CardView(value: DateValue)->some View{
        
        VStack{
            
            if value.day != -1{
                Text("\(value.day)")
                    .font(.title3.bold())
            }
        }
        .padding(.vertical,8)
        .frame(height: 60, alignment: .top)
    }
    
    //extracting year and month for display
    func extractData()->[String]{
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        
        let date = formatter.string(from: currentDate)
        
        return date.components(separatedBy: " ")
    }
    
    func getCurrentMonth()->Date{
        let calendar = Calendar.current
        //getting curr mon date
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else{
            return Date()
        }
        return currentMonth
    }
    
    func extractDate()->[DateValue]{
        let calendar = Calendar.current
        //getting curr mon date
        let currentMonth = getCurrentMonth()
//        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else{
//            return []
        
        var days = currentMonth.getAllDatess().compactMap { date -> DateValue in
            //getting day
            let day = calendar.component(.day, from: date)
            return DateValue(day: day, date: date)
        }
        //adding offset days to get exact weel day..
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday - 1{
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        return days
    }
}

struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        ContendCalanderView()
    }
}

//entending dat eto get current date
extension Date{
    
    func getAllDatess()->[Date]{
        
        let calendar = Calendar.current
        //getting start Date
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year,.month], from: self))!
        
        let range = calendar.range(of: .day, in: .month, for: startDate)!
        //getting date
        return range.compactMap {day -> Date in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}
