class DvdsController < ApplicationController
  # GET /dvds
  # GET /dvds.json
  def index
	if params[:genre] 
		genre = params[:genre]
		case genre
			when "horror"
				@dvds = Dvd.where(:genre => ("horror"))
			when "action"
				@dvds = Dvd.where(:genre => ("action"))
			when "comedy"
				@dvds = Dvd.where(:genre => ("comedy"))
			when "family"
				@dvds = Dvd.where(:genre => ("family"))
			when "mystery"
				@dvds = Dvd.where(:genre => ("mystery"))
			when "other"
				@dvds = Dvd.where(:genre => ("other"))
			when "romance"
				@dvds = Dvd.where(:genre => ("romance"))
			when "sci"
				@dvds = Dvd.where(:genre => ("sci"))
		end
	else
		@horror = Dvd.where(:genre => ("horror"))
		@action = Dvd.where(:genre => ("action"))
		@comedy = Dvd.where(:genre => ("comedy"))
		@family = Dvd.where(:genre => ("family"))
		@other = Dvd.where(:genre => ("other"))
		@mystery = Dvd.where(:genre => ("mystery"))
		@romance = Dvd.where(:genre => ("romance"))
		@sci = Dvd.where(:genre => ("sci"))
	end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dvds }
    end
  end

  # GET /dvds/1
  # GET /dvds/1.json
  def show
    @dvd = Dvd.find(params[:id])
	
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dvd }
    end
  end

  # GET /dvds/new
  # GET /dvds/new.json
  def new
    @dvd = Dvd.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dvd }
    end
  end

  # GET /dvds/1/edit
  def edit
    @dvd = Dvd.find(params[:id])
	@genre = @dvd[:genre]
  end

  # POST /dvds
  # POST /dvds.json
  def create
    @dvd = Dvd.new(params[:dvd])

    respond_to do |format|
      if @dvd.save
        format.html { redirect_to @dvd, notice: 'Dvd was successfully created.' }
        format.json { render json: @dvd, status: :created, location: @dvd }
      else
        format.html { render action: "new" }
        format.json { render json: @dvd.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dvds/1
  # PUT /dvds/1.json
  def update
    @dvd = Dvd.find(params[:id])

    respond_to do |format|
      if @dvd.update_attributes(params[:dvd])
        format.html { redirect_to @dvd, notice: 'Dvd was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @dvd.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dvds/1
  # DELETE /dvds/1.json
  def destroy
    @dvd = Dvd.find(params[:id])
	@genre = @dvd[:genre]
    @dvd.destroy

    respond_to do |format| 
	#link back to where we came from using genre of destroyed DVD
      format.html { redirect_to(:controller => "dvds", :genre => @genre) }
      format.json { head :ok }
    end
  end
end
