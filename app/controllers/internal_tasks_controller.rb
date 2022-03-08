class InternalTasksController < ApplicationController
  def index
    matching_internal_tasks = InternalTask.all

    @list_of_internal_tasks = matching_internal_tasks.order({ :created_at => :desc })

    render({ :template => "internal_tasks/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_internal_tasks = InternalTask.where({ :id => the_id })

    @the_internal_task = matching_internal_tasks.at(0)

    render({ :template => "internal_tasks/show.html.erb" })
  end

  def create
    the_internal_task = InternalTask.new
    the_internal_task.engagement_id = params.fetch("query_engagement_id")
    if the_internal_task.engagement_id == nil
    else
      @matching_engagement = Engagement.where ({:id => the_internal_task.engagement_id})
      @the_engagement = @matching_engagement.at(0)
      @matching_client = Client.where({:id => @the_engagement.client_id})
      @the_client = @matching_client.at(0)
      the_internal_task.client_id = @the_client.id
    end
    the_internal_task.task_name = params.fetch("query_task_name")
    the_internal_task.task_detail = params.fetch("query_task_detail")

    if the_internal_task.valid?
      the_internal_task.save
      redirect_to("/internal_tasks", { :notice => "Internal task created successfully." })
    else
      redirect_to("/internal_tasks", { :notice => "Internal task failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_internal_task = InternalTask.where({ :id => the_id }).at(0)

    the_internal_task.engagement_id = params.fetch("query_engagement_id")
    the_internal_task.client_id = params.fetch("query_client_id")
    the_internal_task.task_name = params.fetch("query_task_name")
    the_internal_task.task_detail = params.fetch("query_task_detail")

    if the_internal_task.valid?
      the_internal_task.save
      redirect_to("/internal_tasks/#{the_internal_task.id}", { :notice => "Internal task updated successfully."} )
    else
      redirect_to("/internal_tasks/#{the_internal_task.id}", { :alert => "Internal task failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_internal_task = InternalTask.where({ :id => the_id }).at(0)

    the_internal_task.destroy

    redirect_to("/internal_tasks", { :notice => "Internal task deleted successfully."} )
  end
end