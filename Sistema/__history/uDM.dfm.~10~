object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 356
  Width = 569
  object Conexao: TIBDatabase
    Connected = True
    DatabaseName = 'localhost:M:\TESTE\Projeto\DB\BANCO.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    Left = 136
    Top = 104
  end
  object Transacao: TIBTransaction
    Active = True
    DefaultDatabase = Conexao
    Left = 280
    Top = 136
  end
end
