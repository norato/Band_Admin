# encoding: utf-8

require 'spec_helper'


feature 'Gerenciar Organizadores' do
  def preencher_e_verificar_organizador
    fill_in 'Nome', :with => "Dedé Muylaert"
    fill_in 'Contato', :with => 'dede_muylaert@foo.com'

    click_button 'Salvar'
    
    page.should have_content "Nome: Dedé Muylaert"
    page.should have_content "Contato: dede_muylaert@foo.com"
  end
  
  scenario 'adicionar organizador' do
    visit new_organizador_path
    preencher_e_verificar_organizador
  end

  scenario 'editar organizador' do
    organizador =  FactoryGirl.create(:organizador)

    visit edit_organizador_path(organizador)
    preencher_e_verificar_organizador
  end

  scenario 'deletar organizador' do 
    organizador =  FactoryGirl.create(:organizador)

    visit organizadors_path
    click_link 'Excluir'

    page.should_not have_content "Nome: Dedé Muylaert"
    page.should_not have_content "dede_muylaert@foo.com"
  end
end