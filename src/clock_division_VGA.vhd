library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity clock_division_VGA is
Port
(clock : in std_logic;
 reset : in std_logic;
 clock_out_VGA : out std_logic );
end clock_division_VGA;
architecture Behavioral of clock_division_VGA is
signal not_perm : std_logic;
signal count : integer range 0 to 1 := 0;
begin

operation_100Mhzto25 : process(reset ,clock)
begin
if (reset = '1') then
 count <= 0;
 not_perm <= '0';
elsif rising_edge(clock) then
 if (count = 1) then
 not_perm <= not (not_perm);
 count <= 0;
 else
 count <= count + 1;
 end if;
end if;
end process;
clock_out_VGA <= not_perm;
end Behavioral;