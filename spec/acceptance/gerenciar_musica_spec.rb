# encoding: utf-8

require 'spec_helper'


feature 'Gerenciar Músicas' do
  def preencher_e_verificar_musica
    fill_in 'Nome'   , :with => "Cuervo"
    fill_in 'Duração', :with => 500
    fill_in 'bpm'    , :with => 120
    fill_in 'Estilo' , :with =>"Spanish Rock"

    click_button 'Salvar'
    
    page.should have_content "Nome: Cuervo"
  end
  
  scenario 'adicionar Música' do
    visit new_musica_path
    preencher_e_verificar_musica
  end

  scenario 'editar Música' do
    musica =  FactoryGirl.create(:musica)

    visit edit_musica_path(musica)
    preencher_e_verificar_musica
  end

  scenario 'deletar Música' do 
    musica =  FactoryGirl.create(:musica)

    visit musicas_path
    click_link 'Excluir'

    page.should_not have_content "Nome: Cuervo"
  end
end