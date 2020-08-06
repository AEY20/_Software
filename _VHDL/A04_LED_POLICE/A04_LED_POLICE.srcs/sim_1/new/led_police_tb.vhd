library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity vhdl_binary_counter_tb is
end;

architecture bench of vhdl_binary_counter_tb is

  component vhdl_binary_counter
  port
      (
          C, CLR : in std_logic;
          Q : out std_logic_vector(3 downto 0)
      );
  end component;

  signal C, CLR: std_logic;
  signal Q: std_logic_vector(3 downto 0) ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: vhdl_binary_counter port map ( C   => C,
                                      CLR => CLR,
                                      Q   => Q );

  stimulus: process
  begin
  
    -- Put initialisation code here
CLR <= '1';
c <= '1';
wait for 10ms;
 
    -- Put test bench stimulus code here

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      C <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;