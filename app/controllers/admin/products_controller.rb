
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

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html{render :layout => false} # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html{render :layout => false} # new.html.erb 
    end
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
#        format.html { redirect_to admin_product_path(@product), notice: 'Product was successfully created.' }
#        format.json { render json: @product, status: :created, location: @product }
        format.js
      else
#        format.html { render action: "new" }
#        format.json { render json: @product.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
#        format.html { redirect_to admin_product_path(@product), notice: 'Product was successfully updated.' }
#        format.json { head :no_content }
         format.js
      else
#        format.html { render action: "edit" }
#        format.json { render json: @product.errors, status: :unprocessable_entity }
         format.js
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to admin_products_url }
      format.json { head :no_content }
    end
  end


  private

  #private method to retrieve all categories from DB.
  def find_categories
    #retrieve all categories from DB.
    @categories = Category.all
  end # end method

end # end Class
