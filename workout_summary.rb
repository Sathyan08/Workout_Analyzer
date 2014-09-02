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


def create_report
  data = load_workout_data('workouts.csv')
  ids_array = []

  data.each do |date_data|

    ids_array << date_data[0]

  end

  workouts = []

  ids_array.each do |id_number|
    workouts << Workout.new(id_number)
  end

  workouts
end





tp create_report, "id","date","type","duration","calories_burned"




