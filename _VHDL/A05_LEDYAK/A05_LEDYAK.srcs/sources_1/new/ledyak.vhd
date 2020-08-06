library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity ledyak is
   port(
      clk      : in  std_logic;
      reset    : in  std_logic;
      hizlan   : in  std_logic;
      yavasla  : in  std_logic;
      leds     : out std_logic_vector(7 downto 0)
   );
end entity;

architecture rtl of ledyak is

signal cntled  : std_logic_vector(2 downto 0);
signal cntclk  : std_logic_vector(31 downto 0);
signal regtmr  : std_logic_vector(31 downto 0);

begin

process(cntled) begin
   case cntled is
      when "000"   => leds <= "00000001";
      when "001"   => leds <= "00000010";
      when "010"   => leds <= "00000100";
      when "011"   => leds <= "00001000";
      when "100"   => leds <= "00010000";
      when "101"   => leds <= "00100000";
      when "110"   => leds <= "01000000";
      when "111"   => leds <= "10000000";
      when others  => leds <= "00000000";
   end case;
end process;

process(clk, reset) begin
   if(reset='1') then
      cntled <= (others=>'0');
      cntclk <= (others=>'0');
      regtmr <= x"02FAF080";
   elsif(clk'event and clk='1') then
      if(cntclk=regtmr) then
         cntclk <= (others=>'0');
         cntled <= cntled + '1';
      else
         cntclk <= cntclk + '1';
      end if;
      
      if(hizlan='1') then
         regtmr <= '0' & regtmr(31 downto 1);
      elsif(yavasla='1') then
         regtmr <= regtmr(30 downto 0) & '0';
      else
         regtmr <= regtmr;
      end if;
   end if;
end process;

end architecture;