class ArticlesController < ApplicationController
	#GET /articles
	def index
		#select all
		@articles = Article.all#llama todos los registros de la tabla article
	end	

	#GET /articles/:id
	def show				
		@article = Article.find(params[:id])
		#params es un hash con todos los parametros que se mandaron al servidor web

		#find devuelve siempre el primero
		#Article.where("id = ? ",params[:id])
		#Article.where("id = #{params[:id]}" )#interpolar la cadena es inseguro ya que la vuelve subseptible a sql inyection
		#Article.where("id = ? OR title = ? ",params[:id],params[:title])
	end


	#GET /articles/new
	def new
		@article = Article.new
	end
	#POST /articles
	def create
		#Insert into
		@article= Article.new(article_params)
		
		if @article.save
				
			redirect_to articles_path # redirecciona al index de article
		else
			render :new
		end
		#redirect_to @article #redirecciona al articulo recien creado
			
			#index()			#el uso de estos dos metodos permite
			#render :index	#la llamada al controlador index y la carga de su vistak
		#@article= Article.new(title: params[:article][:title],body: params[:article][:body])		
		#@article= Article.new(params[:article]) no es recomendable ya que no es seguro		
		#@article.invalid?
	end

	#PUT /articles/:id
	def update
		#@article.update_attibutes({title: 'Nuevo titulo'})
		@article = Article.find(params[:id])
		if @article.update(article_params)
			redirect_to @article
		else
			render :edit
		end
	end

	def edit
		@article = Article.find(params[:id])
		
	end
	
	def destroy
		@article = Article.find(params[:id])
		@article.destroy #Elimina el objeto de la base de datos
		redirect_to articles_path
	end


	private #todo debajo de esto son metodos privados de la clase

	def article_params#para que se mas segura la insercion de datos
		params.require(:article).permit(:title,:body)
	end
end