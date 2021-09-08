require_relative 'consola'
require_relative 'controller'
require_relative 'router'

csv_file   = File.join(__dir__, 'records.csv')
consola   = Consola.new(csv_file)
controller = Controller.new(consola)

router = Router.new(controller)

# Start the app
router.run
