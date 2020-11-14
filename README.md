# Zipping Files

Uses the [RubyZip](https://github.com/rubyzip/rubyzip) gem.

## Installation

In the Gemfile:

```
gem 'rubyzip'
```

## Usage

1. Check lib/tasks/zip.rake for a basic zip of current files.
2. Check app/controllers/home_controller.rb (download) action for how to
   send the zip as data (link on app/views/home/index.html.erb).
3. The shrine action in app/controllers/home_controller.rb is a working
   example with Shrine/S3 files (a few details explained below).

### Shrine/S3

It is worth noting that this will not actually work in this repo,
because Shrine and S3 have not actually been setup. The controller
action is copied from a working controller action in another app.

This requires the S3 files to be downloaded first to a temp folder and
then added to the zip file. This is done by downloading them and storing
their path and filename in the `filenames` array.

This supposes a model FileUpload that belongs to a user.

app/models/user.rb
```
class User < ApplicationRecord
  ...
  has_many :file_uploads, as: :owner
```

app/models/file_upload.rb:
```
class FileUpload < ApplicationRecord
  include DataFileUploader::Attachment(:upload)
  belongs_to :owner, polymorphic: true, optional: true
end
```

The FileUpload has a data field `:data_upload` where the Shrine
information is stored.
