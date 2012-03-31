require 'active_record'

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => "blog.sqlite3")
ActiveRecord::Base.include_root_in_json = false

class Post < ActiveRecord::Base
  has_many :comments
end

class Comment < ActiveRecord::Base
  belongs_to :post
end

PostResource = Renee.resource {
  backed_by Post
  allow :index, :get, :create, :delete, :delete_all, :update, :replace
  attributes :id, :title, :contents
  respond_with :json

  child :comments, Renee.resource {
    backed_by Comment
    allow :index, :get, :create, :delete, :delete_all, :update, :replace
    attributes :id, :text
    respond_with :json
  }
}

