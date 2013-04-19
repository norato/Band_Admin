# encoding: utf-8

require 'spec_helper'


feature 'Gerenciar Proprietários' do
  def preencher_e_verificar_proprietario
    fill_in 'Nome', :with => "Alisson Zakka"
    fill_in 'Contato', :with => 'zakka_guitarrista@gmail.com'

    click_button 'Salvar'
    
    page.should have_content "Nome: Alisson Zakka"
    page.should have_content "Contato: zakka_guitarrista@gmail.com"
  end
  
  scenario 'adicionar proprietário' do
    visit new_proprietario_path
    preencher_e_verificar_proprietario
  end

  scenario 'editar proprietário' do
    proprietario =  FactoryGirl.create(:proprietario)

    visit edit_proprietario_path(proprietario)
    preencher_e_verificar_proprietario
  end

  scenario 'deletar proprietário' do 
    proprietario =  FactoryGirl.create(:proprietario)

    visit proprietarios_path
    click_link 'Excluir'

    page.should_not have_content "Nome: Alisson Zakka"
    page.should_not have_content "zakka_guitarrista@gmail.com"
  end
end