=begin
  @File Name     :- categories_controller.rb
  @Create By     :- Vikram Kumar Mishra(Mindfire Solutions)
  @Date Created  :- 2012-05-28
  @Last Modified :-
  @purpose       :- To handle CRUD categories by admin
=end

class Admin::CategoriesController < AdminController

  #retrieve all categories, which will be used in each action except show and destroy actions
  before_filter :find_categories, :except => [:show, :destroy]

  # GET /admin/categories
  # GET /admin/categories.json
  # @params :- NONE
  # @return :- Array OF CATEGORIES
  def index
    
    # send data in different format
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end #end respond_to block

  end # end method

  # GET /categories/1
  # GET /categories/1.json
  # @params :- NONE(ID Via URL)
  # @return :- Array(CATEGORY)
  
  def show
    #retrieve the category from DB on the basis of ID.
    @category = Category.find(params[:id])

    # send data in different format
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end # end respond_to block
    
  end # end method

  # GET /categories/new
  # GET /categories/new.json
  # Display the form to create a category.
  def new
    
    #create a new category object
    @category = Category.new

    # send data in different format
    respond_to do |format|
      format.html{render :layout => false} # new.html.erb
      format.json { render json: @category }
    end# end respond_to block

  end # end action

  # GET /categories/1/edit
  # Display the form with pre-existing values to update a category.
  def edit

    #retrieve category to edit
    @category = Category.find(params[:id])

    respond_to do |format|
      format.html{render :layout => false}
    end

  end # end action

  
  # POST /categories
  # POST /categories.json
  # Create the category by inserting the values to DB.
  def create
    #initialize Category object with params
    @category = Category.new(params[:category])

    # send data in different format
    respond_to do |format|
      if @category.save # category saved successfully
        format.html { redirect_to admin_category_path(@category), notice: 'Category was successfully created.' }
        format.json { render json: @category, status: :created, location: @category }
      else  # category could not saved successfully
        format.html { render action: "new" } # re-render the form with errors
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end # end if
    end # end respond_to block
  end # end action

  # PUT /categories/1
  # PUT /categories/1.json
  # Update the category by updating the values in DB..
  def update

    #find category b ID.
    @category = Category.find(params[:id])

    # send data in different format
    respond_to do |format|
      if @category.update_attributes(params[:Category]) # category updated successfully
        format.html { redirect_to admin_category_path(@category), notice: 'Category was successfully updated.' }
        format.json { head :no_content }
      else  # category could not updated successfully
        format.html { render action: "edit" } # re-render the form with errors
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end # end if
    end # end respond_to
  end # end action

  # DELETE /categories/1
  # DELETE /categories/1.json
  # Find the category and destroy it
  def destroy

    # find the category
    @category = Category.find(params[:id])

    #delete the category from DB
    @category.destroy

    # send data in different format
    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end# end respond_to
  end # end action


  private

 #private method to retrieve all categories from DB.
  def find_categories
    #retrieve all categories from DB.
    @categories = Category.all
  end # end method

end # end Class
