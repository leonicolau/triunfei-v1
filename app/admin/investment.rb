ActiveAdmin.register Investment do
  permit_params :broker_id, :name, :duration, :bank_id, :indexer, :gross_return, :cdi_return, :minimum_investment_value, :year_return_expectation_value, :gain_over_savings, :profitability_category_name, :bank_score, :fgc_guarantee, :yearly_profitability_value, :net_profitability_value, :product_category, :savings_profitability_value, :gross_return_expectation_value, :net_return_expectation_value, :type_of_profitability, :profitability, :fixed_remuneration, :description, :link, :gross_profitability, :expected_return, :order

  filter :broker_id, as: :select, collection: proc { Broker.all }

  filter :name

  controller do

    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    column :id
    column :name
    column :broker
    actions
  end

  form do |f|
    f.inputs 'Investment form' do
      f.input :name
      f.input :description
      f.input :broker_id, as: :select, collection: Broker.all
      f.input :order
      f.input :fixed_remuneration
      f.input :duration
      f.input :investment_term
      f.input :cdi_return
      f.input :gross_return
      f.input :gross_profitability
      f.input :expected_return
      f.input :profitability
      f.input :bank_id,  as: :select, collection: Bank.all
      f.input :indexer
      f.input :daily_deadline
      f.input :minimum_investment_value
      f.input :year_return_expectation_value
      f.input :gain_over_savings
      f.input :profitability_category_name
      f.input :bank_score
      f.input :fgc_guarantee
      f.input :yearly_profitability_value
      f.input :net_profitability_value
      f.input :product_category
      f.input :savings_profitability_value
      f.input :gross_return_expectation_value
      f.input :net_return_expectation_value
      f.input :type_of_profitability
      f.input :product_category_description
      f.input :link
    end
    f.actions
  end
end
