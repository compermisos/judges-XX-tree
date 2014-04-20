class Judge
  include Mongoid::Document

  field :name
  field :level, type: Fixnum

  has_many :child_judges, :class_name => 'Judge', inverse_of: :parent_judge
  belongs_to :parent_judge, :class_name => 'Judge', inverse_of: :child_judges

  validates_presence_of :name, :level
end