# encoding: utf-8

require 'spec_helper'


feature 'Gerenciar Repertórios' do
  def preencher_e_verificar_repertorio
    fill_in 'Nome', :with => "Death Metal"

    click_button 'Salvar'
    
    page.should have_content "Nome: Death Metal"
  end
  
  scenario 'adicionar repertório' do
    visit new_repertorio_path
    preencher_e_verificar_repertorio
  end

  scenario 'editar repertório' do
    repertorio =  FactoryGirl.create(:repertorio)

    visit edit_repertorio_path(repertorio)
    preencher_e_verificar_repertorio
  end

  scenario 'deletar repertório' do 
    repertorio =  FactoryGirl.create(:repertorio)

    visit repertorios_path
    click_link 'Excluir'

    page.should_not have_content "Nome: Death Metal"
  end
end