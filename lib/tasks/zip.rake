require 'rubygems'
require 'zip'

task zip: :environment do
  folder = File.join(Rails.root, "lib")
  input_filenames = ['file1.pdf', 'file2.pdf']

  zipfile_name = File.join(Rails.root, "lib", "archive.zip")

  Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
    input_filenames.each do |filename|
      zipfile.add(filename, File.join(folder, filename))
    end
  end
end
