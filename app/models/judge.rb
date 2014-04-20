class Judge
  include Mongoid::Document

  field :name
  field :level, type: Fixnum

  has_many :child_judges, :class_name => 'Judge', inverse_of: :parent_judge
  belongs_to :parent_judge, :class_name => 'Judge', inverse_of: :child_judges

  validates_presence_of :name, :level

  def level_output
    if level == 0
      "inativo"
    else
      "Level #{level}"
    end
  end
  def name_output
    name_parts = name.split(' ')
    if name_parts.count > 2
      "#{name_parts.first} #{name_parts.last}"
    else
      name
    end
  end
end