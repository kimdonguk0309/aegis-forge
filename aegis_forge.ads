package Aegis_Forge is
   pragma Pure;

   type Byte is mod 2**8;
   type Bytes is array (Natural range <>) of Byte;

   type Session_Key is array (1 .. 32) of Byte;
   type Public_Key  is array (1 .. 32) of Byte;
   type Private_Key is array (1 .. 64) of Byte;
   type Signature   is array (1 .. 7856) of Byte;

   procedure Derive_Keys
     (Seed       : in  Bytes;
      Public_Out : out Public_Key;
      Secret_Out : out Private_Key);

   procedure Encrypt
     (Key         : in  Session_Key;
      Plaintext   : in  String;
      Ciphertext  : out Bytes);

   procedure Decrypt
     (Key         : in  Session_Key;
      Ciphertext  : in  Bytes;
      Plaintext   : out String);

   procedure Sign
     (Msg  : in  String;
      SK   : in  Private_Key;
      Sig  : out Signature);

   function Verify
     (Msg : String;
      Sig : Signature;
      PK  : Public_Key) return Boolean;

end Aegis_Forge;
