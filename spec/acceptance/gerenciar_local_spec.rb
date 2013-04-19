# encoding: utf-8

require 'spec_helper'

feature 'Gerenciar Locais' do
	def preencher_e_verificar_local
		fill_in 'Nome',     :with => "Manifesto" 
		fill_in 'Endereço', :with => "R. Iguatemi, 36C - Itaim Bibi"
  	fill_in 'Cidade',   :with => "São Paulo"
  	fill_in 'Tipo',     :with => "Bar"
  	
  	click_button 'Salvar'

		page.should have_content "Nome: Manifesto" 
		page.should have_content "Endereço: R. Iguatemi, 36C - Itaim Bibi"
  	page.should have_content "Cidade: São Paulo"
  	page.should have_content "Tipo: Bar"
	end
	
	scenario 'adicionar local' do
		visit new_local_path
		preencher_e_verificar_local
	end

	scenario 'editar local' do
		local = FactoryGirl.create(:local)
		visit edit_local_path(local)
		preencher_e_verificar_local
	end

	scenario 'deletar local' do
		local = FactoryGirl.create(:local)

		visit locais_path
		click_link 'Excluir'
		page.should_not have_content "Nome: Manifesto" 
		page.should_not have_content "Endereço: R. Iguatemi, 36C - Itaim Bibi"
  	page.should_not have_content "Cidade: São Paulo"
  	page.should_not have_content "Tipo: Bar"
  end
end