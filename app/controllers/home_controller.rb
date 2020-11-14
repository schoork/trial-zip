require 'rubygems'
require 'zip'

class HomeController < ApplicationController

  def index
  end

  def download
    filename = "archize.zip"
    temp_file = Tempfile.new(filename)

    folder = File.join(Rails.root, "lib")
    input_filenames = ['file1.pdf', 'file2.pdf']

    begin
      Zip::OutputStream.open(temp_file) {|zos|}

      Zip::File.open(temp_file.path, Zip::File::CREATE) do |zip|
        input_filenames.each do |filename|
          zip.add(filename, File.join(folder, filename))
        end
      end

      zip_data = File.read(temp_file.path)

      send_data(zip_data, type: 'application/zip', filename: filename)
    ensure
      temp_file.close
      temp_file.unlink
    end
  end

end
