class AvotesController < ApplicationController
  before_action :set_avote, only: [:show, :edit, :update, :destroy]

  # GET /avotes
  # GET /avotes.json
  def index
    @avotes = Avote.all
  end

  # GET /avotes/1
  # GET /avotes/1.json
  def show
  end

  # GET /avotes/new
  def new
    @avote = Avote.new
  end

  # GET /avotes/1/edit
  def edit
  end

  # POST /avotes
  # POST /avotes.json
  def create
    @avote = Avote.new(avote_params)

    respond_to do |format|
      if @avote.save
        format.html { redirect_to @avote, notice: 'Avote was successfully created.' }
        format.json { render :show, status: :created, location: @avote }
      else
        format.html { render :new }
        format.json { render json: @avote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /avotes/1
  # PATCH/PUT /avotes/1.json
  def update
    respond_to do |format|
      if @avote.update(avote_params)
        format.html { redirect_to @avote, notice: 'Avote was successfully updated.' }
        format.json { render :show, status: :ok, location: @avote }
      else
        format.html { render :edit }
        format.json { render json: @avote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /avotes/1
  # DELETE /avotes/1.json
  def destroy
    @avote.destroy
    respond_to do |format|
      format.html { redirect_to avotes_url, notice: 'Avote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @answer = Answer.find_by(id: params[:id])
    if !Avote.all.include?Avote.find_by(answer_id: @answer.id, user_id: current_user[:id], upvote:1)
     @avote = Avote.new(upvote: 1, user_id: current_user[:id], answer_id: @answer.id)
      @avote.save
      @answer.up_vote += 1
      @answer.vote_score += 1
      @answer.save
    else
      @avote = Avote.find_by(answer_id: @answer.id, user_id: current_user[:id], upvote:1)
      @avote.destroy
      @answer.up_vote -= 1
      @answer.vote_score -= 1
      @answer.save
    end
    redirect_to(questions_path)
  end

  def downvote
    @answer = Answer.find_by(id: params[:id])
    if !Avote.all.include?Avote.find_by(answer_id: @answer.id, user_id: current_user[:id], upvote:0)
      @avote = Avote.new(upvote: 0, user_id: current_user[:id], answer_id: @answer.id)
      @avote.save
      @answer.down_vote += 1
      @answer.vote_score -= 1
      @answer.save
    else
      @avote = Avote.find_by(answer_id: @answer.id, user_id: current_user[:id], upvote:0)
      @avote.destroy
      @answer.down_vote -= 1
      @answer.vote_score += 1
      @answer.save
    end
    redirect_to(questions_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_avote
      @avote = Avote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def avote_params
      params.require(:avote).permit(:upvote, :user_id, :answer_id)
    end
end
