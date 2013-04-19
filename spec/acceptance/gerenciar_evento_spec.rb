# encoding: utf-8

require 'spec_helper'


feature 'Gerenciar Eventos' do
  def preencher_e_verificar_evento
    fill_in 'Nome', :with => "Festival de Bandas de Garagem"
    fill_in 'Data', :with => "14/06/2013"

    click_button 'Salvar'
    
    page.should have_content "Nome: Festival de Bandas de Garagem"
    page.should have_content "Data: 14/06/2013"
  end
  
  scenario 'adicionar evento' do
    visit new_evento_path
    preencher_e_verificar_evento
  end

  scenario 'editar evento' do
    evento =  FactoryGirl.create(:evento)

    visit edit_evento_path(evento)
    preencher_e_verificar_evento
  end

  scenario 'deletar evento' do 
    evento =  FactoryGirl.create(:evento)

    visit eventos_path
    click_link 'Excluir'

    page.should_not have_content "Nome: Festival de Bandas de Garagem"
    page.should_not have_content "Data: 14/06/2013"
  end
end