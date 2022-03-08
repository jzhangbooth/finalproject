class ClientsController < ApplicationController
  def index
    matching_clients = Client.all

    @list_of_clients = matching_clients.order({ :created_at => :desc })

    render({ :template => "clients/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_clients = Client.where({ :id => the_id })

    @the_client = matching_clients.at(0)

    render({ :template => "clients/show.html.erb" })
  end

  def create
    the_client = Client.new
    the_client.client_name = params.fetch("query_client_name")
    the_client.client_email = params.fetch("query_client_email")

    if the_client.valid?
      the_client.save
      redirect_to("/clients", { :notice => "Client created successfully." })
    else
      redirect_to("/clients", { :alert => client.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_client = Client.where({ :id => the_id }).at(0)

    the_client.client_name = params.fetch("query_client_name")
    the_client.client_email = params.fetch("query_client_email")

    if the_client.valid?
      the_client.save
      redirect_to("/clients/#{the_client.id}", { :notice => "Client updated successfully."} )
    else
      redirect_to("/clients/#{the_client.id}", { :alert => client.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_client = Client.where({ :id => the_id }).at(0)

    the_client.destroy

    redirect_to("/clients", { :notice => "Client deleted successfully."} )
  end
end
