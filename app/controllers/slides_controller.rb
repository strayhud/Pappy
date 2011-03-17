class SlidesController < ApplicationController
  # GET /slides
  # GET /slides.xml
  def index
  end

  # GET /slides/1
  # GET /slides/1.xml
  def show
  end

  # GET /slides/new
  # GET /slides/new.xml
  def new
  end

  # GET /slides/1/edit
  def edit
    @slide = Slide.find(params[:id])
  end

  # POST /slides
  # POST /slides.xml
  def create
    newparams = coerce(params) 
    @slide = Slide.new(newparams[:slide])
    @slide.name = @slide.image_file_name
    @slide.number = @slide.presentation.slides.count
    if @slide.save
      flash[:notice] = "Successfully created slide."
      respond_to do |format| 
        format.html {redirect_to @slide.presentation} 
        format.json { render :json => { :result => 'success', :slide => slide_url(@slide) } }
      end
    else
      render :action => 'new'
    end
 end

  # PUT /slides/1
  # PUT /slides/1.xml
  def update
    @slide = Slide.find(params[:id])
    @slide.name = params[:slide][:name]
    @slide.number = params[:slide][:number]
    if @slide.update_attributes(params[:slide])
      flash[:notice] = "Successfully updated slide."
      redirect_to edit_presentation_path(@slide.presentation)
    else
      render :action => 'edit'
    end
  end

  # DELETE /slides/1
  # DELETE /slides/1.xml
  def destroy
    @slide = Slide.find(params[:id])
    @presentation = @slide.presentation
    @slide.destroy

    respond_to do |format|
      format.html { redirect_to(@presentation, :notice => 'Presentation was successfully created.') }
      format.xml  { head :ok }
    end
  end
  
private
  def coerce(params)
    if params[:slide].nil? 
      h = Hash.new 
      h[:slide] = Hash.new 
      h[:slide][:presentation_id] = params[:presentation_id] 
      h[:slide][:image_id] = params[:image_id] 
      h[:slide][:image] = params[:Filedata] 
      h[:slide][:image].content_type = MIME::Types.type_for(h[:slide][:image].original_filename).to_s
      h
    else 
      params
    end 
  end


end
