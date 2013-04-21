# encoding: utf-8

require 'spec_helper'


feature 'Gerenciar a Ordem das Músicas' do

  scenario 'adicionar a Ordem das Música', :js => true do
    musica = FactoryGirl.create(:musica)
    repertorio = FactoryGirl.create(:repertorio)
    musica.id, repertorio.id = 1 , 1

    visit new_ordemmusica_path
    
    fill_in 'Ordem', :with => 1
    select "#{musica.nome}", from: 'Música'
    select "#{repertorio.nome}" ,from: 'Repertório'
    
    click_button 'Salvar'
    
    page.should have_content "Ordem: 1"
    page.should have_content "Música: #{musica.nome}"
    page.should have_content "Repertório: #{repertorio.nome}"
  end

  scenario 'editar a Ordem das Música' , :js => true do
    ordemmusica =  FactoryGirl.create(:ordemmusica)

    musica = FactoryGirl.create(:musica)
    repertorio = FactoryGirl.create(:repertorio)
    musica.id, repertorio.id = 1 , 1

    visit edit_ordemmusica_path(ordemmusica)
    
    fill_in 'Ordem', :with => 1
    select "#{musica.nome}", from: 'Música'
    select "#{repertorio.nome}" ,from: 'Repertório'
    
    click_button 'Salvar'
    
    page.should have_content "Ordem: 1"
    page.should have_content "Música: #{musica.nome}"
    page.should have_content "Repertório: #{repertorio.nome}"
  end

  scenario 'deletar a Ordem das Música', :js => true do
    musica = FactoryGirl.create(:musica)
    repertorio = FactoryGirl.create(:repertorio)
    musica.id, repertorio.id = 1 , 1

    visit new_ordemmusica_path
    
    fill_in 'Ordem', :with => 1
    select "#{musica.nome}", from: 'Música'
    select "#{repertorio.nome}" ,from: 'Repertório'
    
    click_button 'Salvar'
    
    visit ordemmusicas_path
    click_link 'Excluir'

    page.should_not have_content "Ordem: 1"
    page.should_not have_content "Música: #{musica.nome}"
    page.should_not have_content "Repertório: #{repertorio.nome}"
  end
end