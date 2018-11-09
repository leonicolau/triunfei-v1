admin_profile = AdminProfile.create!(name: 'Admin')
broker_profile = AdminProfile.create!(name: 'Broker')

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', admin_profile: admin_profile)
AdminUser.create!(email: 'broker@example.com', password: 'password', password_confirmation: 'password', admin_profile: broker_profile)

amex = Flag.create!(name: 'American Express', photo: open('https://s3.amazonaws.com/triunfei-v2/cards/photos/000/000/115/original/open-uri20170218-4-14hkviv?1487445781'))
mastercard = Flag.create!(name: 'Mastercard', photo: open('https://s3.amazonaws.com/triunfei-v2/cards/photos/000/000/091/original/open-uri20170218-4-18v2zeb?1487445675'))
visa = Flag.create!(name: 'Visa', photo: open('https://s3.amazonaws.com/triunfei-v2/cards/photos/000/000/444/original/neon.png?1530201206'))

itau = Bank.create!(name: 'Itau', photo: open('https://s3.amazonaws.com/triunfei-v2/banks/photos/000/000/010/original/itau-triunfei.png?1506973703'))
santander = Bank.create!(name: 'Santander', photo: open('https://s3.amazonaws.com/triunfei-v2/cards/photos/000/000/359/original/Santander123.png?1493122919'))
original = Bank.create!(name: 'Original', photo: open('https://s3.amazonaws.com/triunfei-v2/cards/photos/000/000/245/original/open-uri20170218-4-1c6ovns?1487446121'))

Card.credit.create!(name: 'Itau Advance Platinum', bank_id: itau.id, flag_id: amex.id, points: 'Transferência de limites: se possui mais de um cartão itau é você quem decide como distribuir o limite entre eles.', insurance: 'Limite de despesas é flexível de acordo com o comportamento de gastos, histórico de pagamentos e fontes de recursos', international: true, anuity: 162, anuity_multiple: 12, minimum_rent: 490, photo: open('https://s3.amazonaws.com/triunfei-v2/cards/photos/000/000/090/original/open-uri20170218-4-zx9k38?1487445669'), bank_usp1: 'Parcelamento de fatura: Se precisar organizar o orçamento e os gastos inesperados, parcele o valor total da sua fatura em até 12x.', flag_call_center: 'Programa de Relacionamento Valeu: troque pontos direto por desconto na fatura, viagens e mais de 500 mil produtos.Acesse.', flag_prem1: 'Assistência Residencial', flag_prem2: 'Membership Rewards', interest_rate: 0.1659, link: 'http://www.itau.com.br/1/2/br/para-voce/cartoes-de-credito/open-card/sobre-o-produto')

Card.credit.create!(name: 'Original MasterCard® Platinum', bank_id: original.id, flag_id: mastercard.id, points: '1 ponto = 1 real - Pague suas compras com os pontos do cartão de crédito na hora que quiser.', insurance2: 'MasterCard® Platinum Concierge', international: true, anuity: 336, anuity_multiple: 12, minimum_rent: 4000, photo: open('https://s3.amazonaws.com/triunfei-v2/cards/photos/000/000/030/original/open-uri20170218-4-hh6mmw?1487445376'), bank_usp1: 'Todos os serviços no celular, computador e tablet', flag_call_center: 'Programa de Relacionamento Valeu: troque pontos direto por desconto na fatura, viagens e mais de 500 mil produtos.Acesse.', flag_prem1: 'Proteção de Compra* - O cliente do cartão pode comprar com confiança, sabendo que, em sua maioria, as compras que faz com o seu cartão poderão estar protegidas', flag_prem2: 'MasterCard® Platinum Concierge', interest_rate: 0, link: 'https://www.original.com.br/')

Account.create!(bank: itau, name: 'Conta corrent itau mais', minimum_rent: 200.0, taxes: 10.0, link: 'http://itau.com.br', benefits: 'Uma boa conta#Eu gosto dela')

claro = Operator.create!(name: 'Claro', photo: open('https://s3.amazonaws.com/triunfei-v2/cell_phone_plans/photos/000/000/035/original/Claro-logo-logotype-1024x768.png?1508343549'))

CellPhonePlan.control.create!(name: 'Claro controle', description: 'Um bom plano de celular', minutes: 200, price: 20.0, link: 'www.claro.com.br', gb: 200, description_brand: 'A claro é boa, eu juro', operator: claro, photo: open('https://s3.amazonaws.com/triunfei-v2/cell_phone_plans/photos/000/000/018/original/oi.png?1510061376'))
