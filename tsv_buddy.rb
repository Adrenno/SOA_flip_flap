# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # Converts a String with TSV data into internal data structure @data
  # arguments: tsv - a String in TSV format
  # returns: nothing
  
  def take_tsv(tsv)
    tsv_data = tsv.split("\n").map { |line| line.split("\t") }
    keys = tsv_data.shift #the first lines are the keys
    @data = tsv_data.map do |row|
      keys.zip(row).to_h
    end
  end

  # Converts @data into a tsv string
  # arguments: none
  # returns: String in TSV format
  def to_tsv
    headers = @data.first.keys.join("\t") + "\n"
    rows = @data.map { |row| row.values.join("\t") }.join("\n")
    headers + rows + "\n"
  end
end
