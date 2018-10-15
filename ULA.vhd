----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:20:27 10/14/2018 
-- Design Name: 
-- Module Name:    ULA - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ULA is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
			  sel_ULA: in STD_LOGIC_VECTOR (2 downto 0);
           S : out  STD_LOGIC_VECTOR (7 downto 0));
end ULA;

architecture Behavioral of ULA is


begin

process(A,B, sel_ULA)
begin

	case sel_ULA is
		
		when "000" => S <= A + B;	-- ADD "000"
		
		when "001" => S <= A AND B; -- AND "001"
		
		when "010" => S <= A OR B; -- OR "010"
		
		when "011" => S <= NOT A; -- NOT "001"
		
		when "100" => S <= B; -- B "001"
		
		when "101" => S <= A - B; -- SUB "001"
		
		when "110" => S <= A + A ; -- SHL "001"
		
		when others => S <= "00000000";
		
		end case;
	
end process;

end Behavioral;

