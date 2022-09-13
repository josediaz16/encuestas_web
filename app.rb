require 'sinatra'
require 'pg'

conn = PG.connect(user: 'postgres', dbname: 'encuestas_web')

get '/paises' do # closures
  paises = conn.exec("SELECT * FROM paises").to_a
  # [
  #   { 'id' => 1, 'nombre' => 'Colombia' }
  #   { 'id' => 2, 'nombre' => 'Mexico' }
  # ]
  erb :paises, locals: { paises: paises }
end

get '/encuesta' do
  paises = conn.exec("SELECT * FROM paises").to_a

  erb :encuesta, locals: { paises: paises }
end

post '/enviar_encuesta' do
  sql = """
    INSERT INTO encuestas (nombre, sexo, edad, id_pais)
    VALUES ('#{params[:nombre]}', '#{params[:sexo]}', #{params[:edad]}, #{params[:id_pais]})
  """

  conn.exec(sql)

  redirect '/paises'
end
