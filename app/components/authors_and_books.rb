class AuthorsAndBooks < Netzke::Viewport::Base
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
    c.scope = lambda {|rel| rel.where(author_id: client_config[:current_author_id])}
  end
end
