library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity HALF_ADDER_tb is
end;

architecture bench of HALF_ADDER_tb is

  component HALF_ADDER
      Port ( giris_1 : in STD_LOGIC;
             giris_2 : in STD_LOGIC;
             cikis_toplam : out STD_LOGIC;
             cikis_elde : out STD_LOGIC
             );
  end component;

  signal giris_1: STD_LOGIC;
  signal giris_2: STD_LOGIC;
  signal cikis_toplam: STD_LOGIC;
  signal cikis_elde: STD_LOGIC ;

begin

  uut: HALF_ADDER port map ( giris_1      => giris_1,
                             giris_2      => giris_2,
                             cikis_toplam => cikis_toplam,
                             cikis_elde   => cikis_elde );

  stimulus: process
  begin
  
    giris_1 <= '0';
    giris_2 <= '0';
    wait for 20ns;
    giris_1 <= '0';
    giris_2 <= '1';
    wait for 20ns;
    giris_1 <= '1';
    giris_2 <= '0';
    wait for 20ns;
    giris_1 <= '1';
    giris_2 <= '1';
    wait for 20ns;

    wait;
  end process;


end;