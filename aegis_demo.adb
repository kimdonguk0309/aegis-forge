with Aegis_Forge; use Aegis_Forge;
with Ada.Text_IO; use Ada.Text_IO;

procedure Aegis_Demo is
   Seed : constant Bytes := (others => 42);
   PK  : Public_Key;
   SK  : Private_Key;
   Sig : Signature;
   Msg : constant String := "Attack at dawn";
   Enc : Bytes(1 .. Msg'Length);
   Dec : String(1 .. Msg'Length);
   Key : Session_Key := (others => 1);
begin
   Derive_Keys(Seed, PK, SK);
   Encrypt(Key, Msg, Enc);
   Decrypt(Key, Enc, Dec);
   Sign(Msg, SK, Sig);

   Put_Line("Original: " & Msg);
   Put_Line("Decrypted: " & Dec);
   Put_Line("Signature valid: " & Boolean'Image(Verify(Msg, Sig, PK)));
end Aegis_Demo;
