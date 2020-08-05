library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Top_Modul is 
    Port 
    ( 
        -- Giriþ Çýkýþlar Tanýmlanacak.
        giris_1 : in std_logic;
        giris_2 : in std_logic;
        cikis_and : out std_logic;
        cikis_or : out std_logic;
        cikis_xor : out std_logic;
        cikis_nand : out std_logic;
        cikis_nor : out std_logic;
        cikis_xnor : out std_logic
    );
end Top_Modul;

architecture Behavioral of Top_Modul is

begin

    cikis_and <= giris_1 and giris_2;
    cikis_or <= giris_1 or giris_2;
    cikis_xor <= giris_1 xor giris_2;
    cikis_nand <= giris_1 nand giris_2;
    cikis_nor <= giris_1 nor giris_2;
    cikis_xnor <= giris_1 xnor giris_2;
    

end Behavioral;
