# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130421185805) do

  create_table "eventos", :force => true do |t|
    t.string   "nome"
    t.string   "data"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "local_id"
    t.integer  "organizador_id"
    t.integer  "repertorio_id"
  end

  create_table "fontes", :force => true do |t|
    t.string   "nome"
    t.integer  "corrente"
    t.integer  "mala_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "comprimento"
    t.integer  "largura"
  end

  create_table "locais", :force => true do |t|
    t.string   "nome"
    t.string   "endereco"
    t.string   "cidade"
    t.string   "tipo"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "proprietario_id"
  end

  create_table "malas", :force => true do |t|
    t.string   "nome"
    t.integer  "largura"
    t.integer  "comprimento"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "musicas", :force => true do |t|
    t.string   "nome"
    t.integer  "duracao"
    t.integer  "bpm"
    t.string   "estilo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ordemmusicas", :force => true do |t|
    t.integer  "ordem"
    t.integer  "repertorio_id"
    t.integer  "musica_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "ordemmusicas", ["musica_id"], :name => "index_ordemmusicas_on_musica_id"
  add_index "ordemmusicas", ["repertorio_id"], :name => "index_ordemmusicas_on_repertorio_id"

  create_table "organizadors", :force => true do |t|
    t.string   "nome"
    t.string   "contato"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pedais", :force => true do |t|
    t.string   "nome"
    t.integer  "largura"
    t.integer  "comprimento"
    t.integer  "tensao"
    t.integer  "corrente"
    t.string   "tipo"
    t.integer  "mala_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "proprietarios", :force => true do |t|
    t.string   "nome"
    t.string   "contato"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "repertorios", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "saida_fontes", :force => true do |t|
    t.integer  "tensao",          :default => 9
    t.boolean  "centro_negativo", :default => true
    t.integer  "pedal_id"
    t.integer  "fonte_id"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

end
