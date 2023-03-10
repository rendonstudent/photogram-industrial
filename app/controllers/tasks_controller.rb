class TasksController < ApplicationController

 before_action :set_task, only: %i[ show edit update destroy move]

  def move
    if @task.not_yet_started?
      @task.in_progress!
    elsif @task.in_progress?
      @task.completed!
    else
      @task.in_progress!
    end

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task updated" }
    end
  end

  # GET /tasks or /tasks.json
  def index
