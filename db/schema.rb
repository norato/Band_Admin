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

ActiveRecord::Schema.define(:version => 20120811211606) do

  create_table "fontes", :force => true do |t|
    t.string   "nome"
    t.integer  "corrente"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "comprimento"
    t.integer  "largura"
  end

  create_table "fontes_malas", :force => true do |t|
    t.integer "mala_id"
    t.integer "fonte_id"
  end

  create_table "malas", :force => true do |t|
    t.string   "nome"
    t.integer  "largura"
    t.integer  "comprimento"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "malas_pedals", :force => true do |t|
    t.integer "mala_id"
    t.integer "pedal_id"
  end

  create_table "pedals", :force => true do |t|
    t.string   "nome"
    t.integer  "largura"
    t.integer  "comprimento"
    t.integer  "tensao"
    t.integer  "corrente"
    t.string   "tipo"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
