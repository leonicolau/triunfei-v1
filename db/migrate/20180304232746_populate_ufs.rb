class PopulateUfs < ActiveRecord::Migration[5.1]
  def change
   	Uf.create!(name:'Tocantins', id: 01)
   	Uf.create!(name:'Acre', id: 02)
   	Uf.create!(name:'Alagoas', id: 03)
  	Uf.create!(name:'Amapá', id: 04)
  	Uf.create!(name:'Amazonas', id: 05)
  	Uf.create!(name:'Bahia', id: 06)
  	Uf.create!(name:'Ceará', id: 07)
  	Uf.create!(name:'Distrito Federal', id: 8)
  	Uf.create!(name:'Espírito Santo', id: 9)
  	Uf.create!(name:'Goiás', id: 10)
  	Uf.create!(name:'Maranhão', id: 11)
  	Uf.create!(name:'Mato Grosso', id: 12)
  	Uf.create!(name:'Mato Grosso do Sul', id: 13)
  	Uf.create!(name:'Minas Gerais', id: 14)
  	Uf.create!(name:'Pará', id: 15)
  	Uf.create!(name:'Paraíba', id: 16)
  	Uf.create!(name:'Paraná', id: 17)
  	Uf.create!(name:'Pernambuco', id: 18)
  	Uf.create!(name:'Piauí', id: 19)
  	Uf.create!(name:'Roraima', id: 20)
  	Uf.create!(name:'Rondônia', id: 21)
  	Uf.create!(name:'Rio de Janeiro', id: 22)
  	Uf.create!(name:'Rio Grande do Norte', id: 23)
  	Uf.create!(name:'Rio Grande do Sul', id: 24)
  	Uf.create!(name:'Santa Catarina', id: 25)
  	Uf.create!(name:'São Paulo', id: 26)
  	Uf.create!(name:'Sergipe', id: 27)
  end
end
