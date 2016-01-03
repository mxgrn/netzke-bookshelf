class Books < Netzke::Grid::Base
  def configure(c)
    super

    c.model = Book

    # which columns to show
    c.columns = [
      # you may configure columns inline like this:
      { name: :author__name, text: "Author", width: 200 },
      :title,
      :exemplars,
      :completed
    ]

    # which buttons to show in the bottom toolbar
    c.bbar = [:add, :edit, :delete, '->', :apply]
  end

  # you may also use DSL to configure columns individually
  column :completed do |c|
    c.width = 100
  end
end
