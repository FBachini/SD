----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:10:12 10/13/2018 
-- Design Name: 
-- Module Name:    PC - Behavioral 
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
USE IEEE.STD_LOGIC_UNSIGNED.ALL; 
USE IEEE.STD_LOGIC_ARITH.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC is
    Port ( carga_PC : in  STD_LOGIC;
           Inc_PC : in  STD_LOGIC;
			  rst: in STD_LOGIC;
           A : in  STD_LOGIC_VECTOR (7 downto 0);
           S : out  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC);
end PC;

architecture Behavioral of PC is

signal Saida: STD_LOGIC_VECTOR (7 downto 0);

begin

process(rst, clk, Saida)
begin


	if (RISING_EDGE(clk)) then
			if rst = '1' then
			Saida <= "00000000";
			elsif carga_PC = '1' then
				Saida <= A;
			elsif Inc_PC = '1' then
				Saida <= Saida + 1;
			end if;
	end if;
	
S <= Saida;


end process;



end Behavioral;

