----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:33:06 10/13/2018 
-- Design Name: 
-- Module Name:    Decod - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Decod is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           S : out  STD_LOGIC_VECTOR (15 downto 0));
end Decod;

architecture Behavioral of Decod is

begin

process(A)
begin
	S <= "0000000000000000";
		case A is
            when "0000" => S(0) <= '1';
            when "0001" => S(1) <= '1';
            when "0010" => S(2) <= '1';
            when "0011" => S(3) <= '1';
				when "0100" => S(4) <= '1';
            when "0101" => S(5) <= '1';
            when "0110" => S(6) <= '1';
            when "0111" => S(7) <= '1';
				when "1000" => S(8) <= '1';
            when "1001" => S(9) <= '1';
            when "1010" => S(10) <= '1';
            when "1011" => S(11) <= '1';
				when "1100" => S(12) <= '1';
            when "1101" => S(13) <= '1';
            when "1110" => S(14) <= '1';
            when "1111" => S(15) <= '1';
				when others => S <= "0000000000000000";
		end case;
end process;

end Behavioral;

