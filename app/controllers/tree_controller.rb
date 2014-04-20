class TreeController < ApplicationController
  def index
    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', 'Name' )
    data_table.new_column('string', 'Parent')
    data_table.new_column('number', 'Level')
    data_table.add_rows(Judge.all.collect{|j| [{v: j.id.to_s, f:"#{j.name}<div class='level'>Level #{j.level}</div>"}, j.parent_judge.try(:id).try(:to_s), j.level]})

    @chart = GoogleVisualr::Interactive::OrgChart.new(data_table, {allowHtml: true})
  end
end