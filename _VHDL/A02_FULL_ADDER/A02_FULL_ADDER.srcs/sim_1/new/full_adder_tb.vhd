
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity full_adder_tb is
end;

architecture bench of full_adder_tb is

  component full_adder
   Port 
      (
      A : in STD_LOGIC;
      B : in STD_LOGIC;
      Cin : in STD_LOGIC;
      S : out STD_LOGIC;
      Cout : out STD_LOGIC
      );
  end component;

  signal A: STD_LOGIC;
  signal B: STD_LOGIC;
  signal Cin: STD_LOGIC;
  signal S: STD_LOGIC;
  signal Cout: STD_LOGIC ;

begin

  uut: full_adder port map ( A    => A,
                             B    => B,
                             Cin  => Cin,
                             S    => S,
                             Cout => Cout );

  stimulus: process
  begin
  
    a <= '0';
    b <= '0';
    cin <= '0';
    wait for 20ns;
    a <= '0';
    b <= '1';
    cin <= '0';
    wait for 20ns;
    a <= '1';
    b <= '0';
    wait for 20ns;
    a <= '1';
    b <= '1';
    wait for 20ns;

    wait;
  end process;


end;