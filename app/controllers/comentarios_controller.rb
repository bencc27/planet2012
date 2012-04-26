class ComentariosController < ApplicationController
 
   # authenticate_user! ejecuta acción solo si sesión existe
  before_filter :authenticate_user!, :except => [ :index, :show ]

 # =Métodos para interactuar con los comentarios

# ==Método index
  # GET /comentarios
  # GET /comentarios.json
  def index
    if params[:site_id].nil? or params[:site_id].empty?
      @comentarios = Comentario.all            # path: /types
      else
      @comentarios = Site.find(params[:site_id]).comentarios  # path: /sites/id/comentarios
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comentarios }
    end
  end

# ==Método show
  # GET /comentarios/1
  # GET /comentarios/1.json
  def show
    @comentario = Comentario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comentario }
    end
  end
  
  # ==Método new
  # Este método es el usado para crear los comentarios, también en
  # las páginas show de los sitios, porque tuvimos muchos problemas
  # para introducir una caja de formulario. Si en vez de este método usabamos
  # los *formularios* se nos creaba un comentario con los campos null cada vez que se
  # accedía a la vista de calquier sitio.
  # GET /comentarios/new
  # GET /comentarios/new.json
  def new
    @comentario = current_user.comentarios.build
    @comentario.site_id= Site.find(params[:site_id]).id
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comentario }
    end
  end

# ==Método edit
  # GET /comentarios/1/edit
  def edit
    @comentario = current_user.comentarios.find(params[:id]) #filtro para que nadie pueda editar comentarios
                                                             #de otro usuario.
  end


# ==Método create
# Nos aseguramos de que el comentario se cree solo si hay un usuario logueado usando
# el comando *current_user.comentarios.build(params[:comentario])*
  # POST /comentarios
  # POST /comentarios.json
  def create
@comentario =  current_user.comentarios.build(params[:comentario])

    respond_to do |format|
      if @comentario.save
        format.html { redirect_to @comentario.site, notice: 'Comentario was successfully created.' }
        format.json { render json: @comentario.site, status: :created, location: @comentario }
      else
        format.html { redirect_to @site, notice: @comment.comment }
        format.json { render json: @comentario.errors, status: :unprocessable_entity }
      end
    end
  end


# ==Método update
  # PUT /comentarios/1
  # PUT /comentarios/1.json
  def update
    @comentario =  current_user.comentarios.find(params[:comentario])

    respond_to do |format|
      if @comentario.update_attributes(params[:id])
        format.html { redirect_to @comentario.site, notice: 'Comentario was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comentario.errors, status: :unprocessable_entity }
      end
    end
  end

# ==Método destroy
  # DELETE /comentarios/1
  # DELETE /comentarios/1.json
  def destroy
    @comentario = current_user.comentarios.find(params[:id])
    @comentario.destroy

    respond_to do |format|
      format.html { redirect_to comentarios_url }
      format.json { head :no_content }
    end
  end
end
