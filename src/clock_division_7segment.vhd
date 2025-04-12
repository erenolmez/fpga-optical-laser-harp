library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity clock_division_7segment is
 Port (clock : in STD_LOGIC;
 en : in STD_LOGIC;
 res : in STD_LOGIC;
 seg_clk : out STD_LOGIC_VECTOR (15 downto 0));
end clock_division_7segment;
architecture Behavioral of clock_division_7segment is
begin
 process(clock,res)
 variable count: std_logic_vector(15 downto 0) :=(others => '0');
 begin
 if res = '1' then
 count:= (others => '0');
 elsif en = '1' and clock'event and clock = '1' then
 count:= count + 1;
 end if;
 seg_clk <= count;
 end process;
end Behavioral;