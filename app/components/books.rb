class Books < Netzke::Basepack::Grid
  def configure(c)
    c.columns = [
      # you may configure columns inline like this:
      { name: :author__name, text: "Author", width: 200 },

      :title,
      :exemplars,
      :completed
    ]

    c.model = "Book"

    # which buttons to show in the bottom toolbar
    c.bbar = [:add, :edit, :del, '->', :apply]

    super
  end

  # you may also use DSL to configure columns individually
  column :completed do |c|
    c.width = 100
  end
end
