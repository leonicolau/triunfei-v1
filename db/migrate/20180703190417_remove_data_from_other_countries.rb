class RemoveDataFromOtherCountries < ActiveRecord::Migration[5.2]
  def change
    country_id = 1
    Account.where.not(country_id: country_id).destroy_all
    Bank.where.not(country_id: country_id).destroy_all
    BlogPost.where.not(country_id: country_id).destroy_all
    Card.where.not(country_id: country_id).destroy_all
    CellPhonePlan.where.not(country_id: country_id).destroy_all
    City.where.not(country_id: country_id).destroy_all
    Consortium.where.not(country_id: country_id).destroy_all
    CountryDestiny.where.not(country_id: country_id).destroy_all
    Flag.where.not(country_id: country_id).destroy_all
    Insurance.where.not(country_id: country_id).destroy_all
    InsuranceCar.where.not(country_id: country_id).destroy_all
    InsuranceTravel.where.not(country_id: country_id).destroy_all
    InsuranceType.where.not(country_id: country_id).destroy_all
    Insurer.where.not(country_id: country_id).destroy_all
    LandingPage.where.not(country_id: country_id).destroy_all
    Loan.where.not(country_id: country_id).destroy_all
    Manufacturer.where.not(country_id: country_id).destroy_all
    MetaTag.where.not(country_id: country_id).destroy_all
    Operator.where.not(country_id: country_id).destroy_all
    ProductTip.where.not(country_id: country_id).destroy_all
    Uf.where.not(country_id: country_id).destroy_all
    Wizard.where.not(country_id: country_id).destroy_all
  end
end
