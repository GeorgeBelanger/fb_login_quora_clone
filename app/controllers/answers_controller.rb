class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = Answer.new
    @@question = Question.find(params['format'])
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.new(user_id: current_user[:id], question_id: @@question.id, vote_score: 0, up_vote: 0, down_vote: 0, answer_context: answer_params[:answer_context], answer_body: answer_params[:answer_body])
    @@question.num_answers += 1
    @@question.save

    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer, notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update

    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to questions_path, notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: questions_path}
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @@question.num_answers -= 1
    @@question.save
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @answer = Answer.find(params[:id])
    @answer.up_vote += 1
    @answer.vote_score += 1
    @answer.save
    redirect_to(questions_path)
  end

  def downvote
    @answer = Answer.find(params[:id])
    @answer.down_vote -= 1
    @answer.vote_score -= 1
    @answer.save
    redirect_to(questions_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:user_id, :question_id, :vote_score, :up_vote, :down_vote, :answer_context, :answer_body)
    end
end
