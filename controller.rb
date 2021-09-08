require_relative "view"
require_relative "record"


class Controller
  def initialize(consola)
    @consola = consola
    @view = View.new
  end

  # USER ACTIONS

  def list
    display_records
  end

  def create
    # 1. Ask user for a file name (view)
    name = @view.ask_user_for("name")
    # 2. Ask user for a content (view)
    content = @view.ask_user_for("content")
    # 3. Create record (model)
    record = Record.new(name, content)
    # 4. Store in consola (repo)
    @consola.add_record(record)
    # 5. Display
    display_records
  end

  def destroy
    # 1. Display records
    display_records
    # 2. Ask user for index (view)
    index = @view.ask_user_for_index
    # 3. Remove from consola (repo)
    @consola.remove_record(index)
    # 4. Display
    display_records
  end

  private

  def display_records
    # 1. Get records (repo)
    records = @consola.all
    # 2. Display records in the terminal (view)
    @view.display(records)
  end
end
