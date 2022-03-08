class EngagementsController < ApplicationController
  def index
    matching_engagements = Engagement.all

    @list_of_engagements = matching_engagements.order({ :created_at => :desc })

    render({ :template => "engagements/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_engagements = Engagement.where({ :id => the_id })

    @the_engagement = matching_engagements.at(0)

    render({ :template => "engagements/show.html.erb" })
  end

  def create
    the_engagement = Engagement.new
    the_engagement.client_id = params.fetch("query_client_id")
    the_engagement.user_id = session.fetch(:user_id)
    the_engagement.engagement_name = params.fetch("query_engagement_name")
    the_engagement.engagement_detail = params.fetch("query_engagement_detail")

    if the_engagement.valid?
      the_engagement.save
      redirect_to("/engagements", { :notice => "Engagement created successfully." })
    else
      redirect_to("/engagements", { :notice => "Engagement failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_engagement = Engagement.where({ :id => the_id }).at(0)

    the_engagement.client_id = params.fetch("query_client_id")
    the_engagement.user_id = session.fetch(:user_id)
    the_engagement.engagement_name = params.fetch("query_engagement_name")
    the_engagement.engagement_detail = params.fetch("query_engagement_detail")

    if the_engagement.valid?
      the_engagement.save
      redirect_to("/engagements/#{the_engagement.id}", { :notice => "Engagement updated successfully."} )
    else
      redirect_to("/engagements/#{the_engagement.id}", { :alert => "Engagement failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_engagement = Engagement.where({ :id => the_id }).at(0)

    the_engagement.destroy

    redirect_to("/engagements", { :notice => "Engagement deleted successfully."} )
  end
end