class TodoSerializer
  include ActiveModel::Serialization
  attr_accessor :title, :description
end