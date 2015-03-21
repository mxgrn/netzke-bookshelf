class AuthorsAndBooks < Netzke::Basepack::Viewport
  js_configure do |c|
    # For the client-side of our component to include the Javascript code (see below)
    c.mixin
  end

  def configure(c)
    super
    c.items = [:authors, :books]
    c.layout = {type: :hbox, align: :stretch}
  end

  component :authors do |c|
    c.flex = 1
  end

  component :books do |c|
    c.columns = [:title, :exemplars, :completed]
    c.flex = 1

    # Filter books data by author (component_session is simply the session store scope out to the AuthorsAndBooks component, and is set in the endpoint call below)
    c.scope = {author_id: component_session[:current_author_id]}
  end

  # This "gets called" by the client side
  endpoint :server_set_author do |params, this|
    # params[:author_id] comes from the client side of the component (see the Javascript code below)
    component_session[:current_author_id] = params[:author_id]
  end
end
