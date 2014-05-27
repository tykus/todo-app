class TasksController < ApplicationController
	respond_to :html, :json

	layout false
	
	before_action :find_task, :except => [:index, :new, :create]
	before_action :find_project

	def index
		@tasks = @project.tasks
	end

	def show
	end

	def new
		@task = Task.new
	end

	def create
		@task = Task.new(task_params)

		if @project.tasks << @task
			redirect_to(:action => 'index')
		else
			render('new')
		end
	end

	def edit
	end

	def update
		if @task.update(task_params)
			redirect_to(:action => 'index')
		else
			render('edit')
		end
	end

	def delete
	end

	def destroy
		@task.destroy
		redirect_to(:action => 'index')
	end

	private
		def find_project
			@project = Project.find(params[:project_id])
		end

		def find_task
			@task = Task.find(params[:id])
		end

		def task_params
			params.require(:task).permit(:title, :description, :due_date, :completed, :project_id)
		end
end
