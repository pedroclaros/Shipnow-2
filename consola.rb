require "csv"
require_relative "record"

class Consola
  def initialize(csv_file)
    @records = [] # <--- record instances
    @csv_file = csv_file
    load_csv
  end

  def add_record(record)
    @records << record
    save_to_csv
  end

  def remove_record(index)
    @records.delete_at(index)
    save_to_csv
  end

  def all
    return @records
  end

  private

  def load_csv
    CSV.foreach(@csv_file) do |row|
      @records << Record.new(row[0], row[1])
    end
  end

  def save_to_csv
    CSV.open(@csv_file, 'wb') do |csv|
      @records.each do |record|
        csv << [record.name, record.content]
      end
    end
  end
end
