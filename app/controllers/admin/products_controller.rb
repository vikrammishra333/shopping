
=begin
  @File Name     :- products_controller.rb
  @Create By     :- Vikram Kumar Mishra(Mindfire Solutions)
  @Date Created  :- 2012-05-28
  @Last Modified :-
  @purpose       :- To handle CRUD products by admin
=end

class Admin::ProductsController < AdminController

  #retrieve all categories, which will be used in each action except show and destroy actions
  before_filter :find_categories, :except => [:show, :destroy]

  
  # GET /products
  # GET /products.json
  # @params :- NONE
  # @return :- Array OF PRODUCTS
  def index
    @products = Product.all

    # send data in different format
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end # end respond_to block
  end # end action

  # GET /products/1
  # GET /products/1.json
  # @params :- NONE(ID Via URL)
  # @return :- Array(PRODUCT)
  def show
    @product = Product.find(params[:id])

    # send data in different format
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end # end respond_to
  end # end action

  # GET /products/new
  # GET /products/new.json
   # Display the form to create a product.
  def new
    #create a new product object
    @product = Product.new

    # send data in different format
    respond_to do |format|
      format.html{render :layout => false} # new.html.erb
      format.json { render json: @product }
    end # end respond_to
  end #end action

  # GET /products/1/edit
  # Display the form with pre-existing values to update a product.
  def edit
     #retrieve category to edit
    @product = Product.find(params[:id])

    # send data in different format
    respond_to do |format|
      format.html{render :layout => false} # new.html.erb 
    end # end respond_to
  end # end action

  # POST /products
  # POST /products.json
   # Create the product by inserting the values to DB.
  def create
     #initialize Product object with params
    @product = Product.new(params[:product])

    # send data in different format
    respond_to do |format|
      if @product.save #product saved successfully
#        format.html { redirect_to admin_product_path(@product), notice: 'Product was successfully created.' }
#        format.json { render json: @product, status: :created, location: @product }
        format.js
      else  # product could not saved successfully
#        format.html { render action: "new" }
#        format.json { render json: @product.errors, status: :unprocessable_entity }
        format.js
      end # end if

    end # end respond_to
  end # end action

  # PUT /products/1
  # PUT /products/1.json
  # Update the product by updating the values in DB..
  def update
    #find product by ID.
    @product = Product.find(params[:id])

    # send data in different format
    respond_to do |format|
      if @product.update_attributes(params[:product]) # product updated successfully
#        format.html { redirect_to admin_product_path(@product), notice: 'Product was successfully updated.' }
#        format.json { head :no_content }
         format.js
      else  # category could not saved successfully
#        format.html { render action: "edit" }
#        format.json { render json: @product.errors, status: :unprocessable_entity }
         format.js
      end # end if
    end # end respond_to
  end # end action

  # DELETE /products/1
  # DELETE /products/1.json
  # Find the product and destroy it
  def destroy
    #find the product by id
    @product = Product.find(params[:id])

    #destroy the product
    @product.destroy

    #send data in different format
    respond_to do |format|
      format.html { redirect_to admin_products_url }
      format.json { head :no_content }
    end # end respond_to
  end # end action


  private

  #private method to retrieve all categories from DB.
  def find_categories
    #retrieve all categories from DB.
    @categories = Category.all
  end # end method

end # end Class
