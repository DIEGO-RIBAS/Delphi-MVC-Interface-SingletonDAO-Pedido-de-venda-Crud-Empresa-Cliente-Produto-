unit uCliente.ModeloDB;

interface

  type

  TClienteModeloDB = class
    private
      Fid: Integer;
      fuf: string;
      fnome: string;
      fcidade: string;

    public
      property id : Integer read Fid write Fid;
      property Nome : string read fnome write fnome;
      property cidade : string read fcidade write fcidade;
      property uf : string read fuf write fuf;
  end;

implementation

{ TClienteModeloDB }


end.
