class PopulateInvestments < ActiveRecord::Migration[5.2]
  def change
     return unless Rails.env.production?

      investments = JSON.parse(File.read(Rails.root.join('config', 'investment_seed_data.json')))

       banks = {
         'Banco Indusval S.A.' => 110,
         'Banco Pine S.A.' => 111,
         'Banco Semear S.A.' => 112,
         'NBC Bank Brasil S.A. - Banco Múltiplo' => 113,
         'OMNI S/A CFI' => 114,
         'Banco Topázio S.A.' => 115,
         'Banco Original S.A.' => 116,
         'Banco Panamericano S.A.' => 117,
         'Banco Fibra S.A.' => 118,
         'Banco BMG S.A.' => 31,
         'Banco Modal S.A.' => 120,
         'Banco Sofisa S.A.' => 62,
         'Paraná Banco S.A.' => 121,
         'Banco GMAC S.A.' => 123,
         'Outros' => 42,
         'Banco Fator S.A.' => 119,
         'Haitong Banco de Investimento do Brasil S.A.' => 122,
         'Mizuho' => 124,
         'Caruana Financeira' => 125,
         'Banco Máxima S.A.' => 126,
         'Credipar Financeira' => 127,
         'Avista Financeira' => 128,
         'Facta Financeira' => 87,
         'Banco Agiplan' => 88,
         'Agoracred Financeira' => 89,
         'Barigui Financeira' => 90,
         'E. Mineira Financeira' => 91,
         'Sorocred Financeira' => 92,
         'Lecca Crédito, Financiamento e Investimento S.A.' => 93,
         'Banco Paulista S.A.' => 94,
         'Banco Votorantim S.A.' => 1,
         'Banco Luso Brasileiro S.A.' => 95,
         'Banco Pecúnia S.A.' => 96,
         'Lecca Financeira' => 97,
         'Banco Brasil Plural' => 98,
         'Banco Bonsucesso S.A.' => 99,
         'Banco Tricury S.A.' => 100,
         'Banco Daycoval S.A.' => 11,
         'Banco A.J.Renner S.A.' => 101,
         'Banco Morgan Stanley S.A.' => 102,
         'Banco Caixa Geral - Brasil S.A.' => 103,
         'CEF' => 104,
         'Banco Arbi S.A.' => 105,
         'Banco Cooperativo do Brasil S.A. - BANCOOB' => 106,
         'Banco ABN Amro S.A.' => 107,
         'Banco ABC Brasil S.A.' => 108,
         'Banco Boavista Interatlântico S.A.' => 109,
         'Tesouro Nacional' => 129
      }

        brokers ={
          'XP Investimentos' => 3,
          'Rico Corretora' => 5,
          'Easynvest' => 4,
          'Modal Mais' => 4,
          'Genial' => 7,
          'Órama' => 2
        }

        investments.each do |investment|
           p "============"
           p investment['bank']
           Investment.create!(
           name: investment['name'],
           indexer: investment['indexer'],
           duration: investment['deadline'],
           daily_deadline: investment['daily_deadline'],
           fgc_guarantee: investment['fgc_guarantee'],
           yearly_profitability_value: investment['yearly_profitability_value'],
           net_profitability_value: investment['net_profitability_value'],
           bank_id: banks[investment['bank']],
           product_category: investment['product_category'],
           product_category_description: investment['product_category_description'],
           gross_profitability: investment['gross_profitability_value'],
           expected_return: investment['gross_return_expectation_value'],
           link: investment['broker_url'],
           net_return_expectation_value: investment['net_return_expectation_value'],
           year_return_expectation_value: investment['year_return_expectation_value'],
           savings_profitability_value: investment['savings_profitability_value'],
           minimum_investment_value: investment['minimum_investment_value'],
           profitability_category_name: investment['profitability_category_name'],
           gain_over_savings: investment['gain_over_savings'],
           bank_score: investment['bank_score'],
           broker_id: brokers[investment['broker']],
           fixed_remuneration: :fixed_income
        )
        p "============"
      end
  end
end
