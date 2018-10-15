----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:55:36 10/13/2018 
-- Design Name: 
-- Module Name:    RegNZ - Behavioral 
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

entity RegNZ is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
			  clk : in STD_LOGIC;
           N : out  STD_LOGIC;
           Z : out  STD_LOGIC);
end RegNZ;

architecture Behavioral of RegNZ is

begin

process(A, B, clk)
begin

	if RISING_EDGE(clk) then
		N <= A;
		Z <= B;
	end if;
	
end process;	
end Behavioral;

