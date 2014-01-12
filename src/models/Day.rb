class Day

    include Mongoid::Document

    belongs_to :user, class_name: "User"

    field :date, type:Date
    field :bodyHours, type:Integer

end