library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity simple_counter_tb is
end;

architecture bench of simple_counter_tb is

  component simple_counter
         Port ( 
                    clk    : in  STD_LOGIC;
                    start  : in  STD_LOGIC;
                    output : out  STD_LOGIC_VECTOR (7 downto 0));
  end component;

  signal clk: STD_LOGIC;
  signal start: STD_LOGIC;
  signal output: STD_LOGIC_VECTOR (7 downto 0);

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: simple_counter port map ( clk    => clk,
                                 start  => start,
                                 output => output );

  stimulus: process
  begin

 start <= '1';
 wait for 10 ns;
 start <= '1';
 wait for 10 ns;
 start <= '1';
 wait for 10 ns;
 start <= '0';
 wait for 10 ns;
 
    
    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;