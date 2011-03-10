class QformsController < ApplicationController
  # GET /qforms
  # GET /qforms.xml
  def index
    @qforms = Qform.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @qforms }
    end
  end

  # GET /qforms/1
  # GET /qforms/1.xml
  def show
    @qform = Qform.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @qform }
    end
  end

  def send_mail
    @qform = Qform.find(params[:id])

    respond_to do |format|
      format.html # send_email.html.erb
      format.xml  { render :xml => @qform }
    end
  end

  def deliver_mail
    @qform = Qform.find(params[:id])
    
    @to = params[:to_field]
    @subject = "["+@qform.customer+"] "+params[:subject_field]
    
    UserMailer.send_form(@qform,@to,@subject).deliver
    
    respond_to do |format|
      format.html { redirect_to(@qform, :notice => 'Form successfully emailed.') }
      format.xml  { render :xml => @qform }
    end
  end

  # GET /qforms/new
  # GET /qforms/new.xml
  def new
    @qform = Qform.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @qform }
    end
  end

  # GET /qforms/1/edit
  def edit
    @qform = Qform.find(params[:id])
  end

  # POST /qforms
  # POST /qforms.xml
  def create
    @qform = Qform.new(params[:qform])
    
    clear_and_update(@qform,params)
    
    respond_to do |format|
      if @qform.save
        format.html { redirect_to(@qform, :notice => 'Qform was successfully created.') }
        format.xml  { render :xml => @qform, :status => :created, :location => @qform }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @qform.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /qforms/1
  # PUT /qforms/1.xml
  def update
    @qform = Qform.find(params[:id])

    clear_and_update(@qform,params)
    
    respond_to do |format|
      if @qform.update_attributes(params[:qform])
        format.html { redirect_to(@qform, :notice => 'Qform was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @qform.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /qforms/1
  # DELETE /qforms/1.xml
  def destroy
    @qform = Qform.find(params[:id])
    @qform.destroy

    respond_to do |format|
      format.html { redirect_to(qforms_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def clear_and_update(q,params)
    q.recording = params[:record]
    q.platform = array_to_string(params[:platform_names])
    q.opportunity = array_to_string(params[:opportunity_names])
    q.audience = array_to_string(params[:audience_names])
    q.technologies = array_to_string(params[:technology_names])
  end
  
  def array_to_string(p)
    attr = nil
    if (p!=nil)
      attr = p.join ','
    end
    attr
  end
end
