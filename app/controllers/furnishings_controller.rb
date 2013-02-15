class FurnishingsController < ApplicationController

  # GET /furnishings
  # GET /furnishings.xml
  def index
    @furnishings = Furnishing.find(:all, :order => "name ASC", :conditions => { :is_main => true })

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @furnishings }
    end
  end

  # GET /furnishings/1
  # GET /furnishings/1.xml
  def show
    @furnishing = Furnishing.find(params[:id])
    @range = Furnishing.find(:all, :conditions => [ "shape = ? AND (id != ?)", @furnishing.shape, @furnishing.id ])
    # @range = Furnishing.find(:all, :conditions => { :shape => @furnishing.shape })

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @furnishing }
    end
  end

  # GET /furnishings/new
  # GET /furnishings/new.xml
  def new
    @furnishing = Furnishing.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @furnishing }
    end
  end

  # GET /furnishings/1/edit
  def edit
    @furnishing = Furnishing.find(params[:id])
  end

  # POST /furnishings
  # POST /furnishings.xml
  def create
    @furnishing = Furnishing.new(params[:furnishing])
    @furnishing[:name] = @furnishing[:name].capitalize

    respond_to do |format|
      if @furnishing.save
        flash[:notice] = 'Furnishing was successfully created.'
        format.html { redirect_to(@furnishing) }
        format.xml  { render :xml => @furnishing, :status => :created, :location => @furnishing }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @furnishing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /furnishings/1
  # PUT /furnishings/1.xml
  def update
    @furnishing = Furnishing.find(params[:id])

    respond_to do |format|
      if @furnishing.update_attributes(params[:furnishing])
        flash[:notice] = 'Furnishing was successfully updated.'
        format.html { redirect_to(@furnishing) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @furnishing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /furnishings/1
  # DELETE /furnishings/1.xml
  def destroy
    @furnishing = Furnishing.find(params[:id])
    @furnishing.destroy

    respond_to do |format|
      format.html { redirect_to(furnishings_url) }
      format.xml  { head :ok }
    end
  end
end
