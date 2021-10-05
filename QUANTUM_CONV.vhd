----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:57:19 10/05/2021 
-- Design Name: 
-- Module Name:    QUANTUM_CONV - Behavioral 
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
use ieee.std_logic_unsigned.all; --Magic library to add numbers

entity QUANTUM_CONV is
	Port(
			DATA_IN	: in STD_LOGIC_VECTOR(11 downto 0);
			DATA_OUT	: out STD_LOGIC_VECTOR(11 downto 0)
	);
end QUANTUM_CONV;

architecture Behavioral of QUANTUM_CONV is
SIGNAL DATA_BUF : STD_LOGIC_VECTOR(21 downto 0);
begin

	DATA_BUF <= DATA_IN * "1100111001"; --825
	DATA_OUT <= DATA_BUF(21 downto 10);

end Behavioral;

