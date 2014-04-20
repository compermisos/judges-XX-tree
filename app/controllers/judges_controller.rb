class JudgesController < ApplicationController
  before_action :authenticate_user!
  def new
    @fathers = Judge.asc(:name)
    @judge = Judge.new
  end
  def create
    @judge = Judge.new(judge_params)
    if @judge.save
      redirect_to :root, notice: 'Juiz criado'
    else
      @fathers = Judge.where(:level.gte => 2).desc(:asc)
      flash[:error] = "Erro ao criar Juiz"
      render 'new'
    end
  end

  private
  def judge_params
    params.require(:judge).permit(:name, :level, :parent_judge_id)
  end
end