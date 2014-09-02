require_relative 'workout'
require 'csv'
require 'table_print'

# create a hash of workout info from CSV
def load_workout_data(filename)
  workouts = {}

  CSV.foreach(filename, headers: true, header_converters: :symbol, converters: :numeric) do |row|
    workout_id = row[:workout_id]

    if !workouts[workout_id]
      workouts[workout_id] = {
        date: row[:date],
        exercises: []
      }
    end

    exercise = {
      name: row[:exercise],
      category: row[:category],
      duration_in_min: row[:duration_in_min],
      intensity: row[:intensity]
    }

    workouts[workout_id][:exercises] << exercise
  end

  workouts
end

def pull_exercises(id)
  data = load_workout_data('workouts.csv')

  exercises = []

  data.each do |date_data|

    if date_data[0] == id
      exercises = date_data[1][:exercises]
    end

  end

  exercises
end

def create_report_entry(id)
  data_hash = load_workout_data('workouts.csv')
  day_id_sought = ''
  date_sought = ''


  data_hash.each do |day_id, day_data|
    if day_id == id
      day_id_sought = day_id
      date_sought = day_data[:date]
    end
  end

  workout = Workout.new(pull_exercises(id))

  {
    id: day_id_sought,
    date: date_sought,
    type: workout.type,
    duration: workout.total_duration,
    calories_burned: workout.calories_burned

  }

  [day_id_sought, date_sought, workout.type, workout.total_duration, workout.calories_burned]
end







# def create_workout(id)
workout_1 = Workout.new(pull_exercises(6))

tp workout_1

# p load_workout_data('workouts.csv').class



