class TreeController < ApplicationController
  def index
    @judge_count = Judge.count
    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', 'Name' )
    data_table.new_column('string', 'Parent')
    data_table.new_column('string', 'Tip')
    data_table.add_rows(Judge.all.asc(:name).collect{|j| [{v: j.id.to_s, f:"<div class='judge #{j.level_to_word}'>#{j.name_output}<div class='level'>#{j.level_output}#{j.country_output}</div></div>"}, j.parent_judge.try(:id).try(:to_s), "#{j.name} (#{j.level})"]})

    @chart = GoogleVisualr::Interactive::OrgChart.new(data_table, {allowHtml: true})
  end
end