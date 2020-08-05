library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Top_Modul_tb is
end;

architecture bench of Top_Modul_tb is

  component Top_Modul 
      Port 
      (
          giris_1 : in std_logic;
          giris_2 : in std_logic;
          cikis_and : out std_logic;
          cikis_or : out std_logic;
          cikis_xor : out std_logic;
          cikis_nand : out std_logic;
          cikis_nor : out std_logic;
          cikis_xnor : out std_logic
      );
  end component;

  signal giris_1: std_logic;
  signal giris_2: std_logic;
  signal cikis_and: std_logic;
  signal cikis_or: std_logic;
  signal cikis_xor: std_logic;
  signal cikis_nand: std_logic;
  signal cikis_nor: std_logic;
  signal cikis_xnor: std_logic ;

begin

  uut: Top_Modul port map ( giris_1    => giris_1,
                            giris_2    => giris_2,
                            cikis_and  => cikis_and,
                            cikis_or   => cikis_or,
                            cikis_xor  => cikis_xor,
                            cikis_nand => cikis_nand,
                            cikis_nor  => cikis_nor,
                            cikis_xnor => cikis_xnor );

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
    wait for 20 ns;

    wait;
  end process;


end;