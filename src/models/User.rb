class User

    include Mongoid::Document

    field :uid, type:String
    field :provider, type:String
    field :name, type:String

    field :token, type:String

    has_many :days, class_name: "Day", autosave: true
    has_many :worksession, class_name: "WorkSession", autosave: true

end