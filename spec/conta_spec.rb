require 'spec_helper'

describe Conta do
  it "deveria conseguir criar um objeto do tipo Conta" do
    conta = cria_conta
    expect(conta.numero).to eq numero
    expect(conta.nome).to eq nome
    expect(conta.limite).to eq limite
    expect(conta.saldo).to eq saldo
  end

  it "deveria ter um novo saldo quando houver um saque" do
    conta = cria_conta
    saldo_anterior = conta.saldo
    saque = 200
    conta.sacar(saque)
    expect(conta.saldo).to eq(saldo_anterior - saque)
  end

  it "deveria ter um novo saldo depois de um deposito" do
    conta = cria_conta
    saldo_anterior = conta.saldo
    deposito = 500
    conta.depositar(deposito)
    expect(conta.saldo).to eq(saldo_anterior + deposito)
  end

  it "deveria retorna false quando não for possível sacar" do
    conta = cria_conta
    saque = 2000
    expect(conta.sacar(saque)).to eq false
  end

  it "deveria deixar a conta negativa quando o saque usar o limite" do
    conta = cria_conta
    saque = 1500
    saldo_anterior = conta.saldo
    conta.sacar(saque)
    expect(conta.saldo).to eq(saldo_anterior - saque)
  end

  def cria_conta(numero="2303-2", nome="Jose da Silva", saldo=1000.10, limite=500)
    Conta.new(numero: numero, nome: nome, saldo: saldo, limite: limite)
  end
end
