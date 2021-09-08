class Router
  def initialize(controller)
    @controller = controller
    @running    = true
  end

  def run
    puts "Welcome to Shipnow!"
    puts "           --           "

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @controller.list
    when 2 then @controller.create
    when 3 then @controller.destroy
    when 4 then stop
    else
      puts "Please enter the comand choice"
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1- Show - List all datas"
    puts "2- Create_file - Create a new file"
    puts "3- Destroy - Destroy a file"
    puts "4- Stop - Stop and exit the program"
  end
end
