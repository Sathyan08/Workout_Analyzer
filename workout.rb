class Workout
  # YOUR CODE HERE
  def initialize(exercise_array)
    @exercise_array   = exercise_array
    @cardio_score     = 0
    @strength_score   = 0
    @other_score      = 0
    @total_duration   = 0
    @calories_burned  = 0

    exercise_array.each do |exercise|
      @total_duration += exercise[:duration_in_min]

      if exercise[:category] == "cardio"
        @cardio_score +=1
      elsif exercise[:category] == "strength"
        @strength_score += 1
      else
        @other_score += 0
      end

      if exercise[:intensity] == "high"
        @calories_burned += (10 * exercise[:duration_in_min])
      elsif exercise[:intensity] == "medium"
        @calories_burned += (8 * exercise[:duration_in_min])
      elsif exercise[:intensity] == "low" || exercise[:category] == "strength"
        @calories_burned += (5 * exercise[:duration_in_min])
      else
        @calories_burned += (6 * exercise[:duration_in_min])
      end

      @total_duration += exercise[:duration_in_min]


    end

    @total_score = (@cardio_score + @strength_score + @other_score)

    if @cardio_score > (@total_score/2.0)
      @type = "cardio"
    elsif @strength_score > (@total_score/2.0)
      @type = "strength"
    else
      @type = "other"
    end

  end

    def cardio_score
      @cardio_score
    end

    def strength_score
      @strength_score
    end

    def other_score
      @other_score
    end

    def total_score
      @total_score
    end

    def exercise_array
      @exercise_array
    end

    def type
      @type
    end

    def calories_burned
      @calories_burned.to_f
    end

    def total_duration
      @total_duration
    end

end
