class WorkSession

    include Mongoid::Document

    belongs_to :user, class_name: "User"

    field :start, type:Time
    field :end, type:Time
    field :note, type:String

end