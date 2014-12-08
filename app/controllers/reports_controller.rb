class ReportsController < ApplicationController

  def cardio
    data = FitnessActivity.where(user: params[:id], act_type: 'Running').entries
    @distance =[]
    @speed=[]
    data.each { |act|
      @distance << [act.created_at, act.distance]
      @speed << [act.distance, act.duration]
    }
  end

  def strength
    data = StrengthActivity.where(user: params[:id])
    @weight =[]
    data_bench = data.where(act_type:'Bench press').entries
    data_squats = data.where(act_type:'Squats').entries
    data_deadlift = data.where(act_type:'Deadlift').entries
    data_ohp = data.where(act_type:'Overhead Press').entries

    @bench = []
    @squats = []
    @deadlift = []
    @ohp = []

    data_bench.each { |d| @bench << [d.created_at, d.weight] }
    data_squats.each { |d| @squats << [d.created_at, d.weight] }
    data_deadlift.each { |d| @deadlift << [d.created_at, d.weight] }
    data_ohp.each { |d| @ohp << [d.created_at, d.weight] }
  end
end
