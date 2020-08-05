library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity HALF_ADDER is
    Port ( giris_1 : in STD_LOGIC;
           giris_2 : in STD_LOGIC;
           cikis_toplam : out STD_LOGIC;
           cikis_elde : out STD_LOGIC
           );

end HALF_ADDER;

architecture Behavioral of HALF_ADDER is

begin

cikis_toplam <= giris_1 xor giris_2;
cikis_elde <= giris_1 and giris_2;

end Behavioral;
