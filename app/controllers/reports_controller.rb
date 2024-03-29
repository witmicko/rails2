class ReportsController < ApplicationController

  def cardio
    data = FitnessActivity.where(user: params[:id], act_type: 'Running').entries
    @distance =[]
    @speed=[]
    data.each { |act|
      if act.distance
        @distance << [act.created_at, act.distance]
      end
      if act.distance && act.duration
        speed = act.distance.to_f / act.duration.to_f
        @speed << [act.created_at, speed]
      end
      puts
    }
  end

  def strength
    data = StrengthActivity.where(user: params[:id])
    @weight =[]
    data_bench = data.where(act_type: 'Bench press').entries
    data_squats = data.where(act_type: 'Squats').entries
    data_deadlift = data.where(act_type: 'Deadlift').entries
    data_ohp = data.where(act_type: 'Overhead Press').entries

    @bench = []
    @squats = []
    @deadlift = []
    @ohp = []

    data_bench.each { |d| @bench << [d.created_at, d.weight] }
    data_squats.each { |d| @squats << [d.created_at, d.weight] }
    data_deadlift.each { |d| @deadlift << [d.created_at, d.weight] }
    data_ohp.each { |d| @ohp << [d.created_at, d.weight] }
  end

  def weight
    data = Measurement.where(user: params[:id]).entries
    @mass = []
    @fat = []
    data.each { |m|
        @mass << [m.created_at, m.weight]
        @fat << [m.created_at, m.fat]
    }



  end
end
