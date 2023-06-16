

import SwiftUI

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    return formatter
}()

struct Workout: Identifiable, Codable {
    let id: UUID
    let name: String
    let numberOfReps: Int
    let weight: Double
    let date: Date
    
    init(name: String, numberOfReps: Int, weight: Double, date: Date) {
        self.id = UUID()
        self.name = name
        self.numberOfReps = numberOfReps
        self.weight = weight
        self.date = date
    }
}

struct CalendarView: View {
    @Binding var workouts: [Workout]
    @Environment(\.presentationMode) var presentationMode

    let calendar = Calendar.current
    @State var selectedWorkout: Workout? = nil

    var workoutsByDate: [Date: [Workout]] {
        Dictionary(grouping: workouts, by: { calendar.startOfDay(for: $0.date) })
    }

    var sortedDates: [Date] {
        workoutsByDate.keys.sorted(by: >)
    }
    
    func previousWorkout(of workout: Workout) -> Workout? {
        let similarWorkouts = workouts.filter { $0.name == workout.name }
        guard let workoutIndex = similarWorkouts.firstIndex(where: { $0.id == workout.id }),
              workoutIndex > 0 else {
            return nil
        }
        return similarWorkouts[workoutIndex - 1]
    }

    var body: some View {
        VStack {
            List {
                ForEach(sortedDates, id: \.self) { date in
                    if let workoutsOnDate = workoutsByDate[date] {
                        Section(header: Text("\(date, formatter: dateFormatter)").foregroundColor(.black)) {
                            ForEach(workoutsOnDate) { workout in
                                Button(action: {
                                    self.selectedWorkout = workout // Set the selected workout when the item is tapped
                                }) {
                                    Text("\(workout.name) on \(dateFormatter.string(from: workout.date))")
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                }
            }
            
            
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Back to Weightlifting")
                    .frame(width: 200, height: 50)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(15)
            }
            .padding()
        }
        .sheet(item: $selectedWorkout) { workout in // Display the workout details in a new sheet
            WorkoutDetailView(workout: workout)
        }
    }
}


struct WorkoutDetailView: View {
    var workout: Workout
    @State var previousWorkout: Workout? = nil
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("Workout: \(workout.name)")
            Text("Reps: \(Int(workout.numberOfReps))")
            Text("Weight: \(Int(workout.weight))")
            Text("Date: \(workout.date, formatter: dateFormatter)")
            
            if let previousWorkout = previousWorkout {
                Text("Previous Workout: \(previousWorkout.name)")
                Text("Reps: \(Int(previousWorkout.numberOfReps))")
                Text("Weight: \(Int(previousWorkout.weight))")
                Text("Date: \(previousWorkout.date, formatter: dateFormatter)")
            }
        }
        .padding()
        //.navigationTitle("Workout Details")
        .foregroundColor(.black)
        
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Text("Back to Weightlifting")
                .frame(width: 200, height: 50)
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(15)
        }
        .padding()
    }
}

struct WeightView: View {
    @State private var isShowing = false
    @Environment(\.presentationMode) var presentationMode
    @State private var workouts: [Workout] = [] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(workouts) {
                UserDefaults.standard.set(encoded, forKey: "Workouts")
            }
        }
    }
    @State private var showingCalendar = false
    @State private var showingWorkoutLog = false
    @State private var workoutName = ""
    @State private var numberOfReps = ""
    @State private var weight = ""

    init() {
        if let items = UserDefaults.standard.data(forKey: "Workouts") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Workout].self, from: items) {
                _workouts = State(initialValue: decoded)
            }
        } else {
            _workouts = State(initialValue: [])
        }
    }

    var body: some View {
        NavigationView{
            ZStack {
                if isShowing{
                    SideMenuView(isShowing: $isShowing)
                }
                WeightHomeView(workouts: $workouts, showingWorkoutLog: $showingWorkoutLog, showingCalendar: $showingCalendar, workoutName: $workoutName, numberOfReps: $numberOfReps, weight: $weight)
                    .cornerRadius(isShowing ? 30 : 10)
                    .offset(x: isShowing ? 300 : 0, y: isShowing ? 44 : 0)
                    .scaleEffect(isShowing ? 0.8 : 1)
                    .navigationBarItems(leading: Button(action: {
                        withAnimation(.spring()){
                            isShowing.toggle()
                        }
                    }, label: {
                        Image(systemName: "list.bullet")
                            .foregroundColor(.black)
                    }))
            }
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Back to Weightlifting")
                    .frame(width: 200, height: 50)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(15)
            }
            .padding()
        }
    }
}

struct WeightHomeView: View {
    @Binding var workouts: [Workout]
    @Binding var showingWorkoutLog: Bool
    @Binding var showingCalendar: Bool
    @Binding var workoutName: String
    @Binding var numberOfReps: String
    @Binding var weight: String
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showWorkoutLoggedAlert = false
    
    
    var body: some View {
        ZStack {
            //Image("Weight_back")
            VStack {
                
                Button {
                    showingWorkoutLog = true
                } label: {
                    Text("Enter Workout")
                        .font(.system(size: 24, weight: .bold)) // Larger, bold font
                        .frame(minWidth: 0, maxWidth: 300, minHeight: 0, maxHeight: 200) // Full screen button
                        .background(Color.gray)
                        .foregroundColor(Color.white)
                        .cornerRadius(15)
                }
                
                .padding()
                .shadow(color: .black, radius: 10, x: 0, y: 10)
                .sheet(isPresented: $showingWorkoutLog) {
                    VStack {
                        TextField("Workout name", text: $workoutName)
                            .foregroundColor(.black)
                            .italic()
                            .padding(.leading, 20)

                        TextField("Number of reps", text: $numberOfReps)
                            .foregroundColor(.black)
                            .italic()
                            .padding(.leading, 20)

                        TextField("Weight", text: $weight)
                            .foregroundColor(.black)
                            .italic()
                            .padding(.leading, 20)
                        Button("Save workout") {
                            if let numberOfRepsInt = Int(numberOfReps), let weightDouble = Double(weight) {
                                let workout = Workout(name: workoutName, numberOfReps: numberOfRepsInt, weight: weightDouble, date: Date())
                                workouts.append(workout)

                                // Store the updated workouts to UserDefaults
                                let encoder = JSONEncoder()
                                if let encoded = try? encoder.encode(workouts) {
                                    UserDefaults.standard.set(encoded, forKey: "Workouts")
                                }

                                workoutName = ""
                                numberOfReps = ""
                                weight = ""
                                showingWorkoutLog = false
                                showWorkoutLoggedAlert = true  // Add this line
                            }
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        
                        // "Back to Weightlifting" button
                        Button(action: {
                            self.showingWorkoutLog = false
                        }) {
                            Text("Back to Weightlifting")
                                .frame(width: 200, height: 50)
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(15)
                        }
                        .padding()
                    }
                }
                
                Button(action: {
                    showingCalendar = true
                }) {
                    Text("Calendar")
                        .frame(minWidth: 0, maxWidth: 300, minHeight: 0, maxHeight: 200) // Full screen button
                        .background(Color.gray)
                        .font(.system(size: 24, weight: .bold)) // Larger, bold font
                        .foregroundColor(Color.white)
                        .cornerRadius(15)
                }
                .padding()
                .shadow(color: .black, radius: 10, x: 0, y: 10)
                .sheet(isPresented: $showingCalendar) {
                    CalendarView(workouts: $workouts)
                }
                
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .foregroundColor(.white)
        .navigationBarBackButtonHidden(true)
    }
}



struct WorkoutListView: View {
    @Binding var workouts: [Workout]
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        List(workouts) { workout in
            VStack(alignment: .leading) {
                Text(workout.name)
                Text("Reps: \(Int(workout.numberOfReps))")
                Text("Weight: \(Int(workout.weight))")
                Text("Date: \(workout.date, formatter: dateFormatter)")
            }
        }
        
    }
}







