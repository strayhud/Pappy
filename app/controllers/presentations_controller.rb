class PresentationsController < ApplicationController
  layout :resolve_layout
  
  # GET /presentations
  # GET /presentations.xml
  def index
    @presentations = Presentation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @presentations }
    end
  end
  
  def upload
    @presentation = Presentation.find(params[:id])

    respond_to do |format|
      format.html # upload.html.erb
      format.xml  { render :xml => @presentation }
    end
  end

  def play
    @presentation = Presentation.find(params[:id])
    @slides = @presentation.slides.order("position")

    respond_to do |format|
      format.html # upload.html.erb
      format.xml  { render :xml => @presentation }
    end
  end

  # GET /presentations/1
  # GET /presentations/1.xml
  def show
    @presentation = Presentation.find(params[:id], :include => :slides)
    @slides = @presentation.slides.order("position")
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @presentation }
    end
  end

  # GET /presentations/new
  # GET /presentations/new.xml
  def new
    @presentation = Presentation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @presentation }
    end
  end

  # GET /presentations/1/edit
  def edit
    @presentation = Presentation.find(params[:id])
  end

  # POST /presentations
  # POST /presentations.xml
  def create
    @presentation = Presentation.new(params[:presentation])

    respond_to do |format|
      if @presentation.save
        format.html { redirect_to(@presentation, :notice => 'Presentation was successfully created.') }
        format.xml  { render :xml => @presentation, :status => :created, :location => @presentation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @presentation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /presentations/1
  # PUT /presentations/1.xml
  def update
    @presentation = Presentation.find(params[:id])

    respond_to do |format|
      if @presentation.update_attributes(params[:presentation])
        format.html { redirect_to(@presentation, :notice => 'Presentation was successfully updated.') }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.json  { render :json => @presentation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /presentations/1
  # DELETE /presentations/1.xml
  def destroy
    @presentation = Presentation.find(params[:id])
    @presentation.destroy

    respond_to do |format|
      format.html { redirect_to(presentations_url) }
      format.xml  { head :ok }
    end
  end
  
  private

    def resolve_layout
      case action_name
      when "play"
        "slideshow"
      else
        "application"
      end
    end
  
end
