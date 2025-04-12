library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seven_seg_decode is
 Port (no_at_segment : in STD_LOGIC_VECTOR (3 downto 0);
 segment : out STD_LOGIC_VECTOR(6 downto 0));
 end seven_seg_decode;

architecture Behavioral of seven_seg_decode is
begin
process(no_at_segment)
 variable decipher_seg_info : std_logic_vector(6 downto 0);
 
 begin
 case (no_at_segment) is
 when "0000" => decipher_seg_info:= "0000001";
 when "0001" => decipher_seg_info:= "1001111";
 when "0010" => decipher_seg_info:= "0010010";
 when "0011" => decipher_seg_info:= "0000110";
 when "0100" => decipher_seg_info:= "1001100";
 when "0101" => decipher_seg_info:= "0100100";
 when "0110" => decipher_seg_info:= "0100000";
 when "0111" => decipher_seg_info:= "0001111";
 when "1000" => decipher_seg_info:= "0000000";
 when "1001" => decipher_seg_info:= "0000100";
 when others => decipher_seg_info:= "0111000";
 end case;
 
 segment(0) <=  decipher_seg_info(6) ;
 segment(1) <=  decipher_seg_info(5) ;
 segment(2) <=  decipher_seg_info(4) ;
 segment(3) <=  decipher_seg_info(3) ;
 segment(4) <=  decipher_seg_info(2) ;
 segment(5) <=  decipher_seg_info(1) ;
 segment(6) <=  decipher_seg_info(0) ;
 end process;
 
end Behavioral;