# encoding: utf-8

require 'spec_helper'


feature 'Gerenciar Eventos' do
  scenario 'adicionar evento' do

    local = FactoryGirl.create(:local)
    organizador = FactoryGirl.create(:organizador)
    visit new_evento_path
    fill_in 'Nome', :with => "Festival de Bandas de Garagem"
    fill_in 'Data', :with => "14/06/2013"
    select "#{local.nome}", from: "Local"
    select "#{organizador.nome}", from: "Organizador"

    click_button 'Salvar'
    
    page.should have_content "Nome: Festival de Bandas de Garagem"
    page.should have_content "Data: 14/06/2013"
    page.should have_content "Local: #{local.nome}"
    page.should have_content "Organizador: #{organizador.nome}"
  
  end

  scenario 'editar evento' do
    local = FactoryGirl.create(:local)
    organizador = FactoryGirl.create(:organizador)
    evento =  FactoryGirl.create(:evento)


    visit edit_evento_path(evento)
    fill_in 'Nome', :with => "Festival de Bandas de Garagem"
    fill_in 'Data', :with => "14/06/2013"
    select "#{local.nome}", from: "Local"
    select "#{organizador.nome}", from: "Organizador"

    click_button 'Salvar'
    
    page.should have_content "Nome: Festival de Bandas de Garagem"
    page.should have_content "Data: 14/06/2013"
    page.should have_content "Local: #{local.nome}"
    page.should have_content "Organizador: #{organizador.nome}"
  end

  scenario 'deletar evento' do 
    local = FactoryGirl.create(:local)
    organizador = FactoryGirl.create(:organizador)
    
    visit new_evento_path
    fill_in 'Nome', :with => "Festival de Bandas de Garagem"
    fill_in 'Data', :with => "14/06/2013"
    select "#{local.nome}", from: "Local"
    select "#{organizador.nome}", from: "Organizador"

    click_button 'Salvar'

    visit eventos_path
    
    click_link 'Excluir'

    page.should_not have_content "Nome: Festival de Bandas de Garagem"
    page.should_not have_content "Data: 14/06/2013"
  end
end